// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
// (Windows) DEPENDENCE: set_mingw_path.bat
// (Linux) EXEC: %compiler %cmp_opt main.cj --sysroot / -o %output
// (Windows) EXEC: set_mingw_path.bat && %compiler %cmp_opt main.cj --sysroot %mingw_path% -o %output
// EXEC: %run %run_opt %output %run_args
