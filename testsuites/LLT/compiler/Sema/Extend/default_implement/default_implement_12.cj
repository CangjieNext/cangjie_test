// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

interface I1 {
    func foo() {
        println("foo")
    }
}

interface I2 <: I1 {}

class A {}

// 'foo' reached through I1 and through I2 is one and the same default implementation.
extend A <: I1 & I2 {}

main() {
    A().foo()
}

/* SCAN
foo
*/
