// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan-not unused function

open class Base {
    protected open func foo() {
        println("1")
    }
}

open class A <: Base {
    protected open override func foo() {
        println("1")
    }
}

class B <: A {
    protected override func foo() {
        println("2")
    }
}

main() {
    var b = B()
    return 0
}
