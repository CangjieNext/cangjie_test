// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

// ASSERT: scan 3\n5\n8\n2\n2\n

interface I1 {
    func foo(): Unit
}

interface I2 {
    func zoo(): Unit
}

open class Y {
    public open func joo(): Unit {
        println("1")
    }
    public func foo(): Unit {
        println("2")
    }
    public open func roo(): Unit {
        println("3")
    }
}

class Z1 <: Y & I1 {
    public open func joo(): Unit {
        println("4")
    }
    public open func roo(): Unit {
        println("5")
    }
}

class Z2 <: Y & I2 & I1 {
    public func zoo(): Unit {
        println("6")
    }
    public open func joo(): Unit {
        println("7")
    }
    public open func roo(): Unit {
        println("8")
    }
}

func work1(ins: Y) {
    ins.roo()
}

func work2(ins: I1) {
    ins.foo()
}

main() {
    work1(Y()) // 3
    work1(Z1()) // 5
    work1(Z2()) // 8

    work2(Z1()) // 2
    work2(Z2()) // 2
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
