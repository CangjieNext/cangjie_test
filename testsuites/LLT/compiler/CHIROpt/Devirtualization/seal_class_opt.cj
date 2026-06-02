// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to foo at [36,5] was optimized.
// ASSERT: scan-not [Devirtualization] The function call to foo at [34,5] was optimized.

public open interface I {
    public func foo() {}
}

public open class CA <: I {
    public func foo() {}
}

public class CA2 <: I {
    public func foo() {}
}

func goo(): I {
    return CA()
}

func goo2(): I {
    return CA2()
}

main() {
    let a: I = goo()
    a.foo()
    let b: I = goo2()
    b.foo()
    0
}
