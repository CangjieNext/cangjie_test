/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: cast.c python_call_20027.py define_20027.cj
// EXEC: %clang %clang_opt ./cast.c -o libcast.%test_suffix
// EXEC: %compiler %cmp_macro define_20027.cj -lcast -L./
// EXEC-PIPE: %compiler %cmp_opt %macro_lib %f -lcast -L./ -o %output | compare %f
// ASSERT: scan cfoo!
// RUN-EXEC: %export cjStackSize=1MB && %run %run_opt %output %run_args 

import std.ffi.python.*
import std.log.*
import std.collection.*
import define.*

@CallPy
main(): Int64 {
    return 0
}
