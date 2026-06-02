// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output

open class I {
    static func f() {
        println("I")
    }
    static func f2() {
        let m = f;
        m
    }
    static func f3() {
        f
    }
    static func f4() {
        (f, 0)
    }
}

class M <: I {
    static func f() {
        println("M")
    }
}

main() {
    M.f2()()
    M.f3()()
    M.f4()[0]()
}

/* SCAN
M
M
M
*/
