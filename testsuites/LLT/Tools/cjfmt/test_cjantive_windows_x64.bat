@REM Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
@REM This source file is part of the Cangjie project, licensed under Apache-2.0
@REM with Runtime Library Exception.

@REM See https://cangjie-lang.cn/pages/LICENSE for license information.

@echo off

call %1\envsetup.bat

python %2\framework\main.py --test_cfg=%WORKSPACE%\tools\cjfmt\tests\configs\test_win.cfg --test_list=%WORKSPACE%\tools\cjfmt\tests\configs\testlist_win -j16 %WORKSPACE%\tools\cjfmt\tests -pFAIL --fail_exit --fail-verbose
if %ERRORLEVEL% neq 0 ( echo *** Failed to test cjdoc! *** && exit /b 1 )