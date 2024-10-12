# Clear the screen and display the menu
function Show-MainMenu {
    while ($true) {
        Clear-Host
        Write-Host "Main Menu"
        Write-Host "1: Generate Guest Configuration Packages Only"
        Write-Host "2: Deploy Everything-L1/L2/L3/L4 - Audit & Remediate"
        Write-Host "3: Deploy Everything-L1/L2/L3/L4 - Audit Only"
        Write-Host "4: Deploy Only L1/L2 - Audit & Remidiation"
        Write-Host "5: Deploy Only L1/L2 - Audit Only"
        Write-Host "6: Deploy Only L3/L4 - Audit & Remidiation"
        Write-Host "7: Deploy Only L3/L4 - Audit Only"
        Write-Host "8: Deploy Individually"
        Write-Host "9: Exit"
        $input = Read-Host "Please select an option (1-8)"

        switch ($input) {
            '1' { Generate-Packages }
            '2' { Deploy-Everything-Audit-Remeidiate }
            '3' { Deploy-Everything-Audit-Only }
            '4' { Deploy-L1L2-Audit-Remdiate }
            '5' { Deploy-L1L2-Audit-Only }
            '6' { Deploy-L3L4-Audit-Remdiate }
            '7' { Deploy-L3L4-Audit-Only }
            '8' { Deploy-Individually }
            '9' { Write-Host "Exiting..."; return }
            default { Write-Host "Invalid option, please try again." -ForegroundColor Red }
        }
    }
}

# Display system information
function Generate-Packages {
    Write-Host "Generated Packages Complete:"
    Pause-And-Clear
}

function Deploy-Everything-Audit-Remeidiate {
    Write-Host "Deployed Everything, Pls check  Azure Console:"
    Pause-And-Clear
}

function Deploy-Everything-Audit-Only {
    Write-Host "Deployed Everything Audit Only"
    Pause-And-Clear
}


function Deploy-L1L2-Audit-Remdiate {
    Write-Host "Deployed L1L2 Controls in Audit & Remidiate Mode"
    Pause-And-Clear
}


function Deploy-L1L2-Audit-Only {
    Write-Host "Deployed L1L2 Controls in Audit Only Mode"
    Pause-And-Clear
}


function Deploy-L3L4-Audit-Remdiate {
    Write-Host "Deployed L3L4 Controls in Audit & Remediate Mode"
    Pause-And-Clear
}

function Deploy-L3L4-Audit-Only {
    Write-Host "Deployed L3L4 Controls in Audit Only Mode"
    Pause-And-Clear
}

# User operations menu
function Deploy-Individually {
    $exitSubMenu = $false
    while (-not $exitSubMenu) {
        Clear-Host
        Write-Host "User Operations Menu"
        Write-Host "PowerShell-Packages"
        Write-Host "PowerShell-SSH"
        Write-Host "PowerShell-NXFILELINEL1L2"
        Write-Host "PowerShell-NXFILELINEL3L4"
        Write-Host "c: Return to Main Menu"
        $choice = Read-Host "Select an option (a-c)"
        switch ($choice) {
            'a' { Add-User }
            'b' { Remove-User }
            'c' { $exitSubMenu = $true }
            default { Write-Host "Invalid option, please try again." -ForegroundColor Red }
        }
    }
}

# Add a new user
function Add-User {
    $userName = Read-Host "Enter the username to add"
    New-LocalUser -Name $userName -Description "Added via PowerShell Menu"
    Write-Host "User added successfully." -ForegroundColor Green
    Pause-And-Clear
}

# Remove an existing user
function Remove-User {
    $userName = Read-Host "Enter the username to remove"
    Remove-LocalUser -Name $userName
    Write-Host "User removed successfully." -ForegroundColor Green
    Pause-And-Clear
}

# Display network settings
function Show-NetworkSettings {
    Clear-Host
    Write-Host "Network Settings:"
    Get-NetIPAddress
    Pause-And-Clear
}

# Manage files
function Show-FileManagement {
    Clear-Host
    Write-Host "File Management:"
    Get-ChildItem
    Pause-And-Clear
}

# Display services
function Show-Services {
    Clear-Host
    Write-Host "Services:"
    Get-Service
    Pause-And-Clear
}

# Manage processes
function Show-ProcessManagement {
    Clear-Host
    Write-Host "Process Management:"
    Get-Process
    Pause-And-Clear
}

# Disk operations
function Show-DiskOperations {
    Clear-Host
    Write-Host "Disk Operations:"
    Get-Disk
    Pause-And-Clear
}

# Utility function to pause and clear the screen
function Pause-And-Clear {
    Write-Host "Press any key to continue..." -ForegroundColor Yellow
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Clear-Host
}

# Start the script
Show-MainMenu
