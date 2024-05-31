::::::::::::::::::::::::::::::::::::::::::::
:: Elevate.cmd - Version 5
:: Automatically check & get admin rights
:: see "https://stackoverflow.com/a/12264592/1016343" for description
::::::::::::::::::::::::::::::::::::::::::::
 @echo off
 CLS
 ECHO.
 ECHO =============================
 ECHO Running Admin shell
 ECHO =============================

:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~dpnx0"

 rem this works also from cmd shell, other than %~0
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
  ECHO.
  ECHO **************************************
  ECHO Invoking UAC for Privilege Escalation
  ECHO **************************************

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"
  
  if '%cmdInvoke%'=='1' goto InvokeCmd 

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

 ::::::::::::::::::::::::::::
 ::START
 ::::::::::::::::::::::::::::

 REM Run shell as admin (example) - put here code as you like

 :: Download the PowerShell script
 powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/iNath15/Borgor-Apps/main/choco_installs.ps1', '%USERPROFILE%\choco_installs.ps1')"

 :: Ask for CPU type (Intel or AMD)
 set /p cpu=Enter your CPU type ([I]ntel, [A]MD, [N]vidia, [S]kip): 
 if /i "%cpu%"=="I" set "cpu=intel"
 if /i "%cpu%"=="A" set "cpu=amd"
 if /i "%cpu%"=="A" set "cpu=skip"

 :: Ask for GPU type (Intel, AMD, or Nvidia)
 set /p gpu=Enter your GPU type ([I]ntel, [A]MD, [N]vidia, [S]kip): 
 if /i "%gpu%"=="I" set "gpu=intel"
 if /i "%gpu%"=="A" set "gpu=amd"
 if /i "%gpu%"=="N" set "gpu=nvidia"
 if /i "%gpu%"=="N" set "gpu=skip"

 :: Set execution policy and run the PowerShell script
 powershell -ExecutionPolicy Bypass -File "%USERPROFILE%\choco_installs.ps1" -cpu %cpu% -gpu %gpu%

 endlocal