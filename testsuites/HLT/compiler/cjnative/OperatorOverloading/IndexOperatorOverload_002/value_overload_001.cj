/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: test.cj
// EXEC: %compiler %cmp_macro test.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

import test.*

class A {
    var a: Int64 = 0
    protected operator func [](arg1: Int64): A {
        this.a = @M(arg1)
        return this
    }
}

main(): Int64 {
    if (A()[2].a == 2) {
        return 0
    } else {
        return 1
    }
}
