function CreateMenu {
    param(
        [string]$Title = "Menu",
        [string[]]$Options = @()
    )

    Write-Host "---------------------- $Title ----------------------"
    for ($i = 0; $i -lt $Options.Count; $i++) {
        Write-Host "[$($i + 1)] $($Options[$i])"
    }
    Write-Host "--------------------------------------------------"

    $Choice = Read-Host "Enter your choice:"
    if ($Choice -as [int] -gt 0 -and $Choice -le $Options.Count) {
        return $Choice
    } else {
        Write-Host "Invalid choice. Please try again."
        return CreateMenu $Title $Options
    }
}

function RunOption {
    param(
        [int]$Choice,
        [scriptblock[]]$OptionsScripts
    )

    if ($Choice -gt 0 -and $Choice -le $OptionsScripts.Count) {
        $OptionsScripts[$Choice - 1].Invoke()
    } else {
        Write-Host "Invalid choice. Please try again."
    }
}

# Example usage:
$MenuTitle = "Main Menu"
$MenuOptions = @("Option 1", "Option 2", "Option 3")
$MenuScripts = @({ Write-Host "You chose Option 1" }, { Write-Host "You chose Option 2" }, { Write-Host "You chose Option 3" })

$Choice = CreateMenu $MenuTitle $MenuOptions
RunOption $Choice $MenuScripts
