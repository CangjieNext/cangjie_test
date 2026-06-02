@REM Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
@REM This source file is part of the Cangjie project, licensed under Apache-2.0
@REM with Runtime Library Exception.

@REM See https://cangjie-lang.cn/pages/LICENSE for license information.

@echo off

set "inputPath=%~1"
set "testPath=%~2"
set /a cjpm_test_jobs=%NUMBER_OF_PROCESSORS%/6

if %cjpm_test_jobs% lss 3 ( set cjpm_test_jobs=3 )

call %inputPath%\envsetup.bat

echo *** Note: Run %cjpm_test_jobs% cjpm test cases concurrently. ***
python %testPath%\framework\main.py --fail_exit --retry=5 --temp_dir=temp --test_cfg=..\test\LLT\test_windows.cfg --test_list=..\tests\LLT\testlist_windows --fail-verbose -pFAIL -j%cjpm_test_jobs% ..\tests\LLT\CJNATIVE
if %ERRORLEVEL% neq 0 ( echo *** Failed to test cjpm! *** && exit /b 1 )
