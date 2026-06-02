// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to Foo at [37,12] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

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
