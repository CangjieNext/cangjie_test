// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to bar at [30,5] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class A {
    public open func foo(): Int64 {
        return 1
    }
}

open class B {
    public var a: A = A()
    public open func bar(): Int64 {
        return 0
    }
}

main() {
    var b = B()
    b.a = A()
    b.bar()
}
