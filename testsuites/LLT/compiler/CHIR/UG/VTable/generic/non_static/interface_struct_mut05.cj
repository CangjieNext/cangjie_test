// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %output %run_args

interface I_Buddy {
    mut func f_Buddy(): Int64
}

interface I {
    mut func f(): Int64
}

interface I1 <: I & I_Buddy {
    mut func f(): Int64 {
        1
    }

    mut func f_Buddy(): Int64 {
        f()
    }
}

struct Foo <: I1 & I {
    public mut func f(): Int64 {
        3
    }
}

main(): Unit {}