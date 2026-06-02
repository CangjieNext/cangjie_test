REM Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
REM This source file is part of the Cangjie project, licensed under Apache-2.0
REM with Runtime Library Exception.
REM
REM See https://cangjie-lang.cn/pages/LICENSE for license information.

@echo off
mkdir "& dir & dir "
type NUL > injected!.txt
xcopy /e /q %CANGJIE_HOME% "& dir & dir "
call "& dir & dir \envsetup.bat"
cjc bat_1.cj
if %ERRORLEVEL% neq 0 (
    echo Compilation failed!
    exit /b 1
)
main.exe
if %ERRORLEVEL% neq 0 (
    echo Executing main.exe failed!
    exit /b 2
)