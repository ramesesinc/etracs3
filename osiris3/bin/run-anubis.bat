@echo off
rem This will be the run directory
set RUN_DIR=%cd%
rem Move up to the parent directory 
cd ..
rem This will be the base directory
set BASE_DIR=%cd%

set JAVA_OPT="-Dosiris.run.dir=%RUN_DIR% -Dosiris.base.dir=%BASE_DIR% -Dweb.home.dir=%BASE_DIR% -Dweb.conf.dir=%BASE_DIR%\bin -Dweb.lib.dir=file:///%BASE_DIR%\server\anubis"
set JAVA_CLASSPATH=

for /R .\lib %%a in (*.jar) do call :AddToPath %%a
for /R .\server\anubis\lib %%a in (*.jar) do call :AddToPath %%a

java "%JAVA_OPT%" -cp %JAVA_CLASSPATH% com.rameses.anubis.web.WebServer
pause
goto :EOF

:AddToPath
set JAVA_CLASSPATH=%JAVA_CLASSPATH%;%1
goto :EOF
