REM Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
REM This source file is part of the Cangjie project, licensed under Apache-2.0
REM with Runtime Library Exception.
REM
REM See https://cangjie-lang.cn/pages/LICENSE for license information.

@echo off

set CANGJIE_OUTPUT_PATH=%1
set CANGJIE_TEST_PATH=%2

set HOME_PATH=%~p0
set TEST_PATH=%HOME_PATH%\tests

call %CANGJIE_OUTPUT_PATH%\envsetup.bat

python %CANGJIE_TEST_PATH%\framework\main.py --fail_exit --fail-verbose -pFAIL --test_list=testlist --test_cfg=test_win.cfg .

if %ERRORLEVEL% neq 0 ( echo *** Failed to test cjtrace-recover! *** && exit /b 1 )
