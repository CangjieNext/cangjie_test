// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan B::()()
// ASSERT: scan B::()(b: B)

class B {
    public unsafe operator func()(): B {
        println("B::()()")
        this
    }

    public unsafe operator func()(b: B): B {
        println("B::()(b: B)")
        b
    }
}

unsafe main() {
    var b = B()
    b = b()
    b = b(b)
    0
}
