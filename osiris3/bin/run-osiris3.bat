@echo off
rem This will be the run directory
set RUN_DIR=%cd%
rem Move up to the parent directory 
cd ..
rem This will be the base directory
set BASE_DIR=%cd%
rem This will be the context directory (osiris.home). You can changed the location anytime.  
set SERVICES_DIR=%BASE_DIR%\services

set JAVA_OPT="-Dosiris.run.dir=%RUN_DIR% -Dosiris.base.dir=%BASE_DIR% -Dosiris.services.dir=%SERVICES_DIR% -Dosiris.home=file:///%SERVICES_DIR%"
set JAVA_CLASSPATH=

for /R .\lib %%a in (*.jar) do call :AddToPath %%a
for /R .\server\osiris3\lib %%a in (*.jar) do call :AddToPath %%a

java "%JAVA_OPT%" -cp %JAVA_CLASSPATH% com.rameses.osiris3.server.common.OsirisServerBootstrap
pause
goto :EOF

:AddToPath
set JAVA_CLASSPATH=%1;%JAVA_CLASSPATH%
goto :EOF
