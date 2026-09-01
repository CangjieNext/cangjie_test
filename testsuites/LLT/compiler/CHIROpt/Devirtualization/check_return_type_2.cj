// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableDevirtualization %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Class-_CN7defaultU00000000uknyt1BE&->@_CN7defaultU00000000uknyt1B3FooHv
// ASSERT: scan-not Invoke(Class-_CN7defaultU00000000uknyt1BE&->@_CN7defaultU00000000uknyt1B3FooHv

private open class A {
    protected open func Foo() {
        return 1
    }
    protected open func Bar() {
        return 2
    }
}

private open class B <: A {
    protected open func Foo() {
        return 10
    }
}

private open class C <: B {}

private func test(): A {
    var b: B = C()
    return b
}

main() {
    var x: A = test()
    return x.Foo() - 10
}
