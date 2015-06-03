@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  proteus_utils startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

@rem Add default JVM options here. You can also use JAVA_OPTS and PROTEUS_UTILS_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windowz variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if "%@eval[2+2]" == "4" goto 4NT_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
goto execute

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\proteus_utils-1.0.jar;%APP_HOME%\lib\commons-lang3-3.3.2.jar;%APP_HOME%\lib\gson-2.2.4.jar;%APP_HOME%\lib\docker-java-0.10.5.jar;%APP_HOME%\lib\jackson-jaxrs-json-provider-2.1.2.jar;%APP_HOME%\lib\jersey-apache-connector-2.11.jar;%APP_HOME%\lib\jersey-client-2.11.jar;%APP_HOME%\lib\unix-socket-factory-2014-11-16T14-41-27.jar;%APP_HOME%\lib\commons-compress-1.5.jar;%APP_HOME%\lib\commons-codec-1.8.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\commons-io-2.3.jar;%APP_HOME%\lib\jnr-unixsocket-0.3.jar;%APP_HOME%\lib\slf4j-api-1.7.5.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.5.jar;%APP_HOME%\lib\guava-18.0.jar;%APP_HOME%\lib\bcpkix-jdk15on-1.51.jar;%APP_HOME%\lib\jackson-core-2.1.2.jar;%APP_HOME%\lib\jackson-databind-2.1.2.jar;%APP_HOME%\lib\jackson-module-jaxb-annotations-2.1.2.jar;%APP_HOME%\lib\httpclient-4.3.1.jar;%APP_HOME%\lib\jersey-common-2.11.jar;%APP_HOME%\lib\javax.ws.rs-api-2.0.jar;%APP_HOME%\lib\hk2-api-2.3.0-b05.jar;%APP_HOME%\lib\javax.inject-2.3.0-b05.jar;%APP_HOME%\lib\hk2-locator-2.3.0-b05.jar;%APP_HOME%\lib\groovy-all-2.3.6.jar;%APP_HOME%\lib\http-builder-0.7.1.jar;%APP_HOME%\lib\xz-1.2.jar;%APP_HOME%\lib\jnr-ffi-1.0.3.jar;%APP_HOME%\lib\jnr-constants-0.8.4.jar;%APP_HOME%\lib\jnr-enxio-0.4.jar;%APP_HOME%\lib\bcprov-jdk15on-1.51.jar;%APP_HOME%\lib\jackson-annotations-2.1.1.jar;%APP_HOME%\lib\httpcore-4.3.jar;%APP_HOME%\lib\commons-logging-1.1.3.jar;%APP_HOME%\lib\javax.annotation-api-1.2.jar;%APP_HOME%\lib\jersey-guava-2.11.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.1.jar;%APP_HOME%\lib\hk2-utils-2.3.0-b05.jar;%APP_HOME%\lib\aopalliance-repackaged-2.3.0-b05.jar;%APP_HOME%\lib\javassist-3.18.1-GA.jar;%APP_HOME%\lib\json-lib-2.3-jdk15.jar;%APP_HOME%\lib\nekohtml-1.9.16.jar;%APP_HOME%\lib\xml-resolver-1.2.jar;%APP_HOME%\lib\jffi-1.2.7.jar;%APP_HOME%\lib\jffi-1.2.7-native.jar;%APP_HOME%\lib\asm-4.0.jar;%APP_HOME%\lib\asm-commons-4.0.jar;%APP_HOME%\lib\asm-analysis-4.0.jar;%APP_HOME%\lib\asm-tree-4.0.jar;%APP_HOME%\lib\asm-util-4.0.jar;%APP_HOME%\lib\jnr-x86asm-1.0.2.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\commons-beanutils-1.8.0.jar;%APP_HOME%\lib\commons-collections-3.2.1.jar;%APP_HOME%\lib\ezmorph-1.0.6.jar;%APP_HOME%\lib\xercesImpl-2.9.1.jar;%APP_HOME%\lib\xml-apis-1.3.04.jar

@rem Execute proteus_utils
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %PROTEUS_UTILS_OPTS%  -classpath "%CLASSPATH%" com.venturetech.proteus.utils.Main %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable PROTEUS_UTILS_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%PROTEUS_UTILS_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
