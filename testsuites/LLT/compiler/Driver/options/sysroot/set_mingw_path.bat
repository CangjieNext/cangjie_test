REM Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
REM This source file is part of the Cangjie project, licensed under Apache-2.0
REM with Runtime Library Exception.
REM
REM See https://cangjie-lang.cn/pages/LICENSE for license information.

@echo off 
Rem This program is to get the path of the `mingw` directory.

for /f %%i in ( 'where gcc' ) do ( set remaining_dir=%%~dpi )
set mingw_path=

:begin
for /f "tokens=1,* delims=\" %%i in ("%remaining_dir%") do (
    set content=%%i
    set remaining_dir=%%j
)
if "%content%" == "" goto error
set mingw_path=%mingw_path%%content%\
if "%remaining_dir%" == "" goto error
if "%content:mingw=%" == "%content%" (
    goto begin
) else (
    goto end
)

:error
echo Failed to obtain the path of `mingw`.

:end
echo %mingw_path%
