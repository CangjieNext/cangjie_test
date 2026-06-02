// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class A {
    var x: Int64 = 0

    operator func [](y: Int64) {
        x
    }

    operator func [](y: Int64, value!: Int64) {
        x = value
    }
}

class B <: A {
    func foo() {
        super[3] *= 4
    }

    func bar() {
        var a = A()
        a[3] *= 4
    }
}

main() {
    0
}

