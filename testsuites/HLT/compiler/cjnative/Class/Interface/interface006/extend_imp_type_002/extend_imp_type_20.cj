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

interface InterfaceA {
    static func foo(x: Int64) {
        return x
    }
}

interface I {
    prop i: String {
        get() {
            var a: String = "extend"
            return a
        }
    }
}

type IA = InterfaceA

type C = I

interface InterfaceB <: IA {}

class A {}

extend A <: InterfaceB {}

extend A <: C {}

main(): Int64 {
    if (A.foo(2) == 2 && A().i == "extend") {
        return 0
    }
    return 1
}
