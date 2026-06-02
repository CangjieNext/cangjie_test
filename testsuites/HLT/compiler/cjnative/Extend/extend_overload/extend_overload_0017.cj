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

interface I {}

open class A <: I {}

class B <: A {}

class C {
    func foo(a: A) {
        1
    }
    func goo(a: I) {
        1
    }
}

extend C {
    func foo(a: I) {
        2
    }
    func goo(a: A) {
        2
    }
}

main() {
    var c = C()
    if (c.foo(A()) != 1) {
        return 1
    }
    if (c.goo(A()) != 2) {
        return 2
    }
    if (c.foo(B()) != 1) {
        return 3
    }
    if (c.goo(B()) != 2) {
        return 4
    }
    return 0
}
