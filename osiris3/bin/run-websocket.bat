@echo off
rem This will be the run directory
set RUN_DIR=%cd%
rem Move up to the parent directory 
cd ..
rem This will be the base directory
set BASE_DIR=%cd%

rem Set java options
set JAVA_OPT=
set JAVA_CLASSPATH=

for /R .\lib %%a in (*.jar) do call :AddToPath %%a
for /R .\server\websocket\lib %%a in (*.jar) do call :AddToPath %%a

rem Run java 
java %JAVA_OPT% -cp %JAVA_CLASSPATH% com.rameses.websocket.WebsocketServer
goto :EOF

:AddToPath
set JAVA_CLASSPATH=%JAVA_CLASSPATH%;%1
goto :EOF
