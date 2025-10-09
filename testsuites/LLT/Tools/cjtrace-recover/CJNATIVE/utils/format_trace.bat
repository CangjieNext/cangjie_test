REM Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
REM This source file is part of the Cangjie project, licensed under Apache-2.0
REM with Runtime Library Exception.
REM
REM See https://cangjie-lang.cn/pages/LICENSE for license information.

@echo off

set local
setlocal enabledelayedexpansion
set os=%1
set type=%2
set file=%3
set tmp=.\tmpfile

if "%type%" == "1" (
    powershell -c "(Get-Content -Path %file%) -notmatch 'is not a valid mangling name'" > %tmp%
    copy /y %tmp% %file%
) else if "%type%" == "2" (
    powershell -c "(Get-Content -Path %file%) -notmatch 'should be the character'" > %tmp%
    copy /y %tmp% %file%
) else if "%type%" == "3" (
    powershell -c "(Get-Content -Path  %file%) -replace '(:[\d]*\))', ')'" > %tmp%
    copy /y %tmp% %file%
)
