#Prompt the user for their operating system, changing which installers are downloaded and installed
if (-not $env:OS) {
    $os = Read-Host "Enter your operating system (Windows, Linux, or macOS)"
} elseif ($env:OS -match "Windows") {
    $os = "Windows"
} elseif ($OSTYPE -like "linux*") {
    $os = "Linux"
} elseif (Get-Command sw_vers -ErrorAction SilentlyContinue) {
    $os = "macOS"
} else {
    Write-Host "Unknown operating system. Exiting."
    exit
}

if ($env:OS) {
    Write-Host ("Windows OS detected. Proceeding with Windows installers...")
}
#url vars for Windows installers
$nmapWindowsURL = "https://nmap.org/dist/nmap-7.93-setup.exe"
$wiresharkWindowsURL = "https://2.na.dl.wireshark.org/win64/Wireshark-win64-4.0.4.exe"
$tcpdumpWindowsURL = "https://github.com/git-for-windows/git/releases/download/v2.40.0.windows.1/PortableGit-2.40.0-64-bit.7z.exe"

#output vars for downloads
$outputDir = [System.IO.Path]::Combine([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop), "Installers")

#Create the output directory if it doesn't exist
if (-not (Test-Path $outputDir)) {
    Write-Host "Creating directory for installers..."
    New-Item -ItemType Directory -Path $outputDir
} else {
    Write-Host "Installers directory already exists, skipping creation."
}

# Check if the programs are already installed
if ((Get-Command "nmap.exe" -ErrorAction SilentlyContinue) -and (Get-Command "wireshark.exe" -ErrorAction SilentlyContinue) -and (Get-Command "git.exe" -ErrorAction SilentlyContinue)) {
    Write-Host "The selected programs are already installed. You may now close this script."
} else {
    Write-Host "Downloading installers..."
    #Download the installers
    if (-not (Test-Path (Join-Path $outputDir "nmap.exe"))) {
        Write-Host "`tDownloading Nmap..."
        Invoke-WebRequest -Uri $nmapWindowsURL -OutFile (Join-Path $outputDir "nmap.exe")
    } else {
        Write-Host "`tNmap installer already exists, skipping download."
    }

    if (-not (Test-Path (Join-Path $outputDir "wireshark.exe"))) {
        Write-Host "`tDownloading Wireshark..."
        Invoke-WebRequest -Uri $wiresharkWindowsURL -OutFile (Join-Path $outputDir "wireshark.exe")
    } else {
        Write-Host "`tWireshark installer already exists, skipping download."
    }

    if (-not (Test-Path (Join-Path $outputDir "git.exe"))) {
        Write-Host "`tDownloading TCPDump..."
        Invoke-WebRequest -Uri $tcpdumpWindowsURL -OutFile (Join-Path $outputDir "git.exe")
    } else {
        Write-Host "`tTCPDump installer already exists, skipping download."
    }
}


Write-Host "Installing programs..."
#Install the installers
Write-Host "`tInstalling Network Mapper..."
Start-Process -FilePath (Join-Path -Path $outputDir -ChildPath "nmap.exe")
Write-Host "`tInstalling Wireshark..."
Start-Process -FilePath (Join-Path -Path $outputDir -ChildPath "wireshark.exe") -ArgumentList "/S"
Write-Host "`tInstalling TCPDump..."
Start-Process -FilePath (Join-Path -Path $outputDir -ChildPath "git.exe") -ArgumentList "/S"


Write-Host "The selected programs have been installed. Press Enter to close this script..."
Read-Host