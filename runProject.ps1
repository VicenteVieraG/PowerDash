param(
    [ValidateSet("cloud", "local")]
    [string]$SetUp = "local"
);

if($SetUp -eq "local"){
    if(Test-Path -Path ./powerdash/*){
        Write-Host "Validating Folder" -BackgroundColor Yellow -ForegroundColor Black;
        Set-Location -Path ./powerdash;
        Write-Host "Installing Packages" -BackgroundColor Yellow -ForegroundColor Black;
        Invoke-Expression -Command "yarn";
        Write-Host "Building Proyect" -BackgroundColor Yellow -ForegroundColor Black;
        Invoke-Expression -Command "yarn build";
        Write-Host "Proyect Ready to Start with command: yarn dev" -BackgroundColor Green -ForegroundColor Black;
    }else{
        Write-Host "Error:" -NoNewline -BackgroundColor Red -ForegroundColor Black;
        Write-Host " Can not Find 'powerdash' Folder";
    }
}else{
    [string]$gitCheck = Invoke-Expression -Command "git --version";
    [string]$nodeCheck = Invoke-Expression -Command "node --version";
    if(!($gitCheck -like "*git*")){
        Write-Host "Error:" -NoNewline -BackgroundColor Red -ForegroundColor Black;
        Write-Host " You Need to Install Locally git to Get the Data From the Cloud";
        exit
    }
    if(!($nodeCheck -like "*v*")){
        Write-Host "Error:" -NoNewline -BackgroundColor Red -ForegroundColor Black;
        Write-Host " You Need to Install Locally node to Get the Data From the Cloud";
        exit
    }

    Write-Host "Cloning Repository" -BackgroundColor Yellow -ForegroundColor Black;
    Invoke-Expression -Command "git clone https://github.com/JorgePAJ/Power-Dash.git";
    Set-Location -Path ./Power-Dash/powerdash;
    Write-Host "Installing Packages" -BackgroundColor Yellow -ForegroundColor Black;
    Invoke-Expression -Command "yarn";
    Write-Host "Building Project" -BackgroundColor Yellow -ForegroundColor Black;
    Invoke-Expression -Command "yarn build";
    Write-Host "Project Build Ready. You only need to set the env variables" -BackgroundColor Green -ForegroundColor Black;

}