// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to Foo at [33,12] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class A {
    protected open func Foo() {
        return 1
    }
    protected open func Bar() {
        return 2
    }
}

open class B <: A {
    // open function, can be overridden again
    protected open override func Foo() {
        return 10
    }
}

main() {
    // Devirtualization required as we declare "a" as an instance of class A
    // It could be either A::Foo or B::Foo, so we need devirtualization to determine it's B::Foo
    let a: A = B();
    return a.Foo() - 10;
}
