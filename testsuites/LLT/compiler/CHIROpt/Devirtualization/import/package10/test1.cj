// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../../pick_defination.py p1
// EXEC: %compiler %cmp_opt %enableDevirtualization p1/test0.cj %compile_lib_opt -o test0.%middle
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all test0.%middle %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "WHOLE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN5test01IE&->@_CN5test01I3FooHv
// ASSERT: scan-not Apply(Class-_CN5test01IE&->@_CN5test01I3FooHv

internal import test0.*

public open class A {
    public open func Foo(): Int64 {
        2
    }
}

class B <: A & I {
    public func Foo(): Int64 {
        0
    }
}

func Test(i: I): Int64 {
    i.Foo()
}

main() {
    Test(B()) - 0
}
