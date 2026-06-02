// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan norminal parameter
// ASSERT: scan trailing lambda

class B {
    public unsafe func f(fn: () -> Unit) {
        fn()
    }
}

unsafe main() {
    let b = B()
    b.f({ => println("norminal parameter") })
    b.f() { =>
        println("trailing lambda")
    }
}
