/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output 
// RUN-EXEC: %run %run_opt %output %run_args

import pkgs.*

type B = classB

interface I {
    mut static prop i: Int64 {
        get() {
            var a = 0
            123 + a
        }
        set(v) {
            var b = 0
            b = v
        }
    }
}

extend B <: I {
    public mut static prop i: Int64 {
        get() {
            var a = 0
            123 + a
        }
        set(v) {
            var b = 0
            b = v
        }
    }
}

struct A {
    public func b() {
        B.i = 20
        return B.i
    }
}

main(): Int64 {
    if (A().b() == 123) {
        return 0
    } else {
        return 1
    }
}
