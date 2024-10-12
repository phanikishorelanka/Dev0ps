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
        Write-Host "***Individual Menu - RHEL8-Baseline-Controls****"
        Write-Host "1:  NxAccounts"
        Write-Host "2:  SSH"
        Write-Host "3:  NxFileline-L1L2"
        Write-Host "4:  NxFileline-L3L4"
        Write-Host "5:  NXServices-L1L2"
        Write-Host "6:  NXServices-L3L4"
        Write-Host "7:  NXPackages-L1L2"
        Write-Host "8:  NXPackages-L3L4"
        Write-Host "9:  L1-Controls"
        Write-Host "10: L2-Controls"
        Write-Host "11: L3-Controls"
        Write-Host "12: L4-Controls"
        Write-Host "13: Return to Main Menu"
        $choice = Read-Host "Select an option (a-c)"
        switch ($choice) {
            '1' { NxAccounts }
            '2' { SSH }
            '3' { NxFileLine-L1L2 }
            '4' { NxFileLine-L3L4 }
            '5' { NxServices-L1L2 }
            '6' { NxServices-L3L4 }
            '7' { NxPackages-L1L2 }
            '8' { NxPackages-L3L4 }
            '9' { L1-Controls }
            '10' { L2-Controls }
            '11' { L3-Controls }
            '12' { L4-Controls }
            '13' { $exitSubMenu = $true }
            default { Write-Host "Invalid option, please try again." -ForegroundColor Red }
        }
    }
}

# Add a new user
function NxAccounts {
    Write-Host "In NxAccounts" -ForegroundColor Green
    Pause-And-Clear
}

function SSH {
    Write-Host "In SSH" -ForegroundColor Green
    Pause-And-Clear
}

function NxFileLine-L1L2 {
    Write-Host "In NxFileLine-L1L2" -ForegroundColor Green
    Pause-And-Clear
}

function NxFileLine-L3L4 {
    Write-Host "In NxFileLine-L3L4" -ForegroundColor Green
    Pause-And-Clear
}

function NxServices-L1L2 {
    Write-Host "In NxServices-L1L2" -ForegroundColor Green
    Pause-And-Clear
}

function NxServices-L3L4 {
    Write-Host "In NxServices-L3L4" -ForegroundColor Green
    Pause-And-Clear
}

function NxPackages-L1L2 {
    Write-Host "In NxPackages-L1L2" -ForegroundColor Green
    Pause-And-Clear
}

function NxPackages-L3L4 {
    Write-Host "In NxPackages-L3L4" -ForegroundColor Green
    Pause-And-Clear
}

function L1-Controls {
    Write-Host "In L1-Controls" -ForegroundColor Green
    Pause-And-Clear
}

function L2-Controls {
    Write-Host "In L2-Controls" -ForegroundColor Green
    Pause-And-Clear
}

function L3-Controls {
    Write-Host "In L3-Controls" -ForegroundColor Green
    Pause-And-Clear
}

function L4-Controls {
    Write-Host "In L4-Controls" -ForegroundColor Green
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
