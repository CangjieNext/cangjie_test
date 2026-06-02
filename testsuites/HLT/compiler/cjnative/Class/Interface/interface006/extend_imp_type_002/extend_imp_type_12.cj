/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type int = UIntNative

type A = I

interface I {
    prop i: int {
        get() {
            var a: int = 0
            123 + a
        }
    }
}

extend int <: A {}

func a(a!: int = UIntNative(1).i) {
    return a
}

main(): Int64 {
    if (a() == 123 && a(a: 2) == 2) {
        return 0
    } else {
        return 1
    }
}
