// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: src
// (Unix) EXEC: %rmdir build && %mkdir build
// (Windows) EXEC: %rmdir build && %mkdir build
// EXEC: %compiler %pkg_opt src/define/X %cmp_macro
// (CJNATIVE and Unix) EXEC: export CANGJIE_PATH=build/:$CANGJIE_PATH; %compiler %pkg_opt src -o %output
// (not CJNATIVE and Unix) EXEC: export CANGJIE_PATH=build/:$CANGJIE_PATH; %compiler %pkg_opt src -o %output
// (CJNATIVE and Windows) EXEC: set CANGJIE_PATH=build\;%CANGJIE_PATH%&& %compiler %pkg_opt src -o %output
// (not CJNATIVE and Windows) EXEC: set CANGJIE_PATH=build\;%CANGJIE_PATH%&& %compiler %pkg_opt src -o %output
// EXEC: %run %run_opt %output
