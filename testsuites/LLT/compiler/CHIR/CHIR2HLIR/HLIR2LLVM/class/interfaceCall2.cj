// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I {
    operator func **(b: I): Int32 {
        return 2
    }

    operator func /(b: I): Int32 {
        return 8
    }

    operator func >(b: I): Int32 {
        return 4096
    }
}

class A <: I {}

main(): Int64 {
    var a: I = A()
    var res1 = a > a
    if (res1 != 4096) {
        return 1
    }
    return 0
}
