// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: O2 must compile and run an explicitly instantiated method-level
// generic mut default method after wrapper generation.

// EXEC: %compiler %cmp_opt -O2 %compile_exe_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan result: 42

interface I {
    mut func f<T>(): Int64 {
        42
    }
}

struct C <: I {}

main(): Int64 {
    var x = C()
    println("result: ${x.f<Int64>()}")
    return 0
}
