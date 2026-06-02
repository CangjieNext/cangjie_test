// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to Foo at [39,12] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I1 {}

interface I2 <: I1 {}

open class A {
    protected open func Foo() {
        return 1
    }
}

open class B <: A {
    // open function, can be overridden again
    protected open override func Foo() {
        return 10
    }
}

open class C <: B {
    protected open override func Foo() {
        return 20
    }
}

main() {
    var a = B();
    a = C()
    return a.Foo() - 20;
}
