// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: regex-not \[Devirtualization\] The function call to Foo at \[37,.*\] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class A {
    public open func Foo() {
        return 1
    }
}

open class Q <: A {
    public override func Foo() {
        return 3
    }
}

class B <: Q {}

class C <: Q {}

main() {
    var a = A();
    var s = "hello world"
    if (s.size == 11) {
        a = B()
    } else {
        a = Q()
    }
    a.Foo() - 3 // Q::Foo()
}
