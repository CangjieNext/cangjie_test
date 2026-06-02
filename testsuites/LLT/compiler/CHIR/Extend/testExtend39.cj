// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %f -o %output
// EXEC-PIPE-0: %run %output 2>&1 | compare %f
// ASSERT: scan AA1A

interface I {}

open class A {
    public var a = 10
    func test(): Unit {
        print("A")
    }
    func test1(): Unit {
        print("A1")
    }
}

class B <: A & I {}

main(): Int64 {
    let b: I = B()
    match (b) {
        case v0: A where v0.a == 10 =>
            var x = v0.a
            v0.a = 5
            v0.test()
            v0.test1()
            v0.test()
            return x / 2 - v0.a
        case v1: B => ()
        case _ => ()
    }
    return 1
}