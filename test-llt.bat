@echo off

setlocal

call :normalize_path "%~dp0\.."
set ROOT_DIR=%RETVAL%
set HOME_DIR=%ROOT_DIR%\cangjie_test
set TEST_DIR=%HOME_DIR%\testsuites\LLT
set TEMP_DIR=%HOME_DIR%\test_temp
set OBJCINTEROPGEN_BUILD_DIR=%ROOT_DIR%\cangjie_multiplatform_interop\objc\src\ObjCInteropGen\build
set CONFIG_NAME=cjnative_test_win

set PATH=D:\llvm.build\Debug\bin;%PATH%

if "%1" == "-h" (
  echo Usage: %~n0 [-g ^(current ^| cmake ^| msbuild^)] [^<test^>]
  echo   -h : print this help
  echo   -g : ObjCInteropGen to use:
  echo     current : from the current path ^(default^)
  echo     cmake   : built with %OBJCINTEROPGEN_BUILD_DIR%\build.sh
  echo     msbuild : built with Visual Studio
  echo   ^<test^> : if specified, test or test directory to run ^(path relative to
  echo            'testsuites\LLT'^).  By default all tests run.
  exit /b 2
) else if "%1" == "-g" (
  if "%2" == "cmake" (
    call :set_cmake_path
  ) else if "%2" == "msbuild" (
    call :set_msbuild_path
  )
  shift
  shift
)

if not "%1" == "" (
  call :set_one_test %1
) else (
  call :set_testlist
)

python ^
  "%ROOT_DIR%\cangjie_test_framework\main.py" ^
  --fail_exit ^
  -pFAIL ^
  -pPASS ^
  --fail-verbose ^
  --debug ^
  "--temp_dir=%TEMP_DIR%" ^
  "--json_output=%TEMP_DIR%\run_result.json" ^
  "--test_cfg=%TEST_DIR%\configs\cjnative\%CONFIG_NAME%.cfg" ^
  %TESTS%

exit /b

:normalize_path
set RETVAL=%~f1
exit /b

:set_cmake_path
set PATH=%OBJCINTEROPGEN_BUILD_DIR%\output\Debug;%PATH%
exit /b

:set_msbuild_path
set PATH=%OBJCINTEROPGEN_BUILD_DIR%\msbuild\Debug.MSVC\bin;%PATH%
exit /b

:set_one_test
set TESTS="%TEST_DIR%\%1"
exit /b

:set_testlist
set TESTS="--test_list=%HOME_DIR%\testlist.llt" "%TEST_DIR%"
exit /b
