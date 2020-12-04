$Url = "http://zoom.us/client/latest/ZoomInstallerFull.msi"
$SavePath = "c:\Windows\Temp\ZoomInstallerFull.msi"

$WebClient = New-Object System.Net.WebClient
$downloadResults = $WebClient.DownloadFile($Url,$SavePath)

$MSIArguments = @(
    "/i"
    ('"{0}"' -f $SavePath)
    "/qn"
    "/norestart"
    "ALLUSERS=1"
)

$FileArguments = " "
$runProcessResults = Start-Process -Filepath "msiexec.exe" -ArgumentList "$MSIArguments" -Wait -NoNewWindow
$DiditRun = "Zoom install script completed successfully"
$DiditRun