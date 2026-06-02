REM Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
REM This source file is part of the Cangjie project, licensed under Apache-2.0
REM with Runtime Library Exception.
REM
REM See https://cangjie-lang.cn/pages/LICENSE for license information.

@echo off
for /f "delims=" %%i in ('where.exe gcc') do set PARENT=%%~dpi
for %%i in ("%PARENT%\..") do set MINGW=%%~fi
set COMMAND=%*
call set COMMAND=%%COMMAND:MINGW=%MINGW%%%
%COMMAND%