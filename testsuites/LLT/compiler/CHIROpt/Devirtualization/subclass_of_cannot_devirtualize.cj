// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// Negative: A-typed parameter in bar stays Invoke even when runtime value is B.
// EXEC: %python pick_defination.py test0_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN5test03barHCNY_1AE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan-not Invoke(Class-_CN5test01AE&->@_CN5test01A3fooHv
// ASSERT: scan Apply(Class-_CN5test01BE&->@_CN5test01B3fooHv

package test0

public abstract class A {
    public func foo(): Int64
}

public class B <: A {
    public func foo(): Int64 {
        return 0
    }
}

func bar(a: A): Int64 {
    a.foo() //invoke
}

main() {
    var a: A = B()
    bar(a) - 0
}
