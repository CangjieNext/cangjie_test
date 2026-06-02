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

open class A {}

class B <: A {}

class C {
    func foo(a: B) {
        1
    }
    func goo(a: A) {
        1
    }
}

extend C {
    func foo(a: A) {
        2
    }
    func goo(a: B) {
        2
    }
    func f1() {
        foo(A())
    }
    func f2() {
        goo(A())
    }
    func f3() {
        foo(B())
    }
    func f4() {
        goo(B())
    }
}

main() {
    let c = C()
    if (c.f1() != 2) {
        return 1
    }
    if (c.f2() != 1) {
        return 2
    }
    if (c.f3() != 1) {
        return 3
    }
    if (c.f4() != 2) {
        return 4
    }
    return 0
}
