// LEVEL: 0
// EXEC: %compiler %debugCHIROpt %enableDevirtualization %n.cj -o %output 2>&1 | compare %f
// EXEC:%run %run_opt %output %run_args
// ASSERT: scan The function call to f1 in the line 28 and the column 5 was optimized by the opt Devirtualization
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<T> {
    func f1(a: T) : Unit 
    func f2(a: T) : Unit {
        f1(a)
    }
}

open class A {
    public func f1(a: Int64) : Unit {
        println("extend A f1")
    }
    public func f1(a: String) : Unit {
        println("extend A f1")
    }
}

class B <: A & I<Int64> & I<String> {}

main() {
    var a: I<Int64> = B()
    a.f1(1) // should print extend A f1
    var b = B()
    b.f1(1) // print extend A f1
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
