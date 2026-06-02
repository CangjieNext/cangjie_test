// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p1
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization p1/test0.cj %compile_lib_opt -o test0.%middle
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization test0.%middle test1.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not Devirtualization
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import test0.*

public open class A {
    public open func Foo() {
        println("Foo from A")
    }
}

class B <: A & I {
    public func Foo() {
        println("Foo from B")
    }
}

func Test(i: I) {
    i.Foo()
}

main() {
    Test(B())
}
