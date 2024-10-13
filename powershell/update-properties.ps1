# Function to prompt for user input and write to a properties file with validation against null values
function Write-PropertiesToFile {
    param (
        [string]$filePath
    )

    # Function to validate input
    function Validate-Input([string]$inputName, [string]$inputValue) {
        if ([string]::IsNullOrWhiteSpace($inputValue)) {
            throw "Input for $inputName cannot be null or empty."
        }
    }

    # Prompt for user input
    $playpenID = Read-Host "Enter PlaypenID (Number)"
    Validate-Input -inputName "PlaypenID" -inputValue $playpenID
    $frequency = Read-Host "Enter Frequency in minutes (Number)"
    Validate-Input -inputName "Frequency" -inputValue $frequency
    $mode = Read-Host "Enter Mode (String)"
    Validate-Input -inputName "Mode" -inputValue $mode

    # Validate numeric inputs
    if (-not [int]::TryParse($playpenID, [ref]0)) {
        throw "PlaypenID must be a numeric value."
    }
    if (-not [int]::TryParse($frequency, [ref]0)) {
        throw "Frequency must be a numeric value."
    }

    # Check if the properties file exists, create if not
    if (-Not (Test-Path $filePath)) {
        New-Item -Path $filePath -ItemType File -Force | Out-Null
    }

    # Construct the property strings with specific formatting and write to file
    $properties = @{
        "PlaypenID" = $playpenID
        "Frequency" = $frequency
        "Mode" = $mode
    }

    # Write each property to the file with a $ prefix
    foreach ($key in $properties.Keys) {
        $propertyString = "`$$key=`"$($properties[$key])`""
        Add-Content -Path $filePath -Value $propertyString
    }

    Write-Host "Properties have been successfully written to the file with the specified format." -ForegroundColor Green
}

# Specify the path to the properties file
$propertiesFilePath = ".\inputs3.properties"

# Call the function to write properties to the file
try {
    Write-PropertiesToFile -filePath $propertiesFilePath
} catch {
    Write-Host $_.Exception.Message -ForegroundColor Red
}
