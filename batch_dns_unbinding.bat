::::::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights V2
::::::::::::::::::::::::::::::::::::::::::::
@echo off
CLS
ECHO.
ECHO =============================
ECHO Running Admin shell
ECHO =============================

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
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
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::
REM Run shell as admin (example) - put here code as you like
SET batchfiledir=%~dp0

for /F "tokens=*" %%B in ('%windir%\system32\inetsrv\appcmd list site "samplephp" /text:bindings') DO SET data=%%B
@REM @echo "!data!"
cd \
cd %windir%\system32\inetsrv

for /F "tokens=*" %%A in (%batchfiledir:~0,-1%\domain_list.txt) do (
    set string=%%A
    echo "!data!"|find "!string!" >nul
    if errorlevel 1 (
        @echo "!string!" already removed domain              
    ) else (
        @echo "!string!" removed 
         appcmd set site /site.name:samplephp /-bindings.[protocol='http',bindingInformation='127.0.0.1:8008:!string!'] 
    )
    @REM appcmd set site /site.name:samplephp /+bindings.[protocol='http',bindingInformation='127.0.0.1:8008:%%A']    
)


@REM scrip structure comment just pm jr tahud if you have any question

@REM appcmd set site /site.name:your_iis_site_name_here /+bindings.[protocol='http',bindingInformation='your_ip_here:your_port:your_dns(doman_name)_here']
@REM parameters 
@REM  /site.name:your_iis_site_name_here
@REM  /+bindings.[protocol='http' just change to https or http 
@REM bindingInformation='your_ip_here:your_port:your_dns(doman_name)_here'] 3 sectio nthat correspond to binding information in IIS 


pause