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

type ch = Rune

type A = classA

interface I {
    operator func +(inputB: A): ch {
        return r'0'
    }
}

extend A <: I {}

open class classA {}

class B <: A {
    public var a: ch
    public B() {
        this.a = A() + A()
    }
}

main(): Int64 {
    if (B().a == r'0') {
        return 0
    } else {
        return 1
    }
}
