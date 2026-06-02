/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../pkga
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package pkg

import pkga.*

class A <: I {
    func foo() {
        A()[1, 2, 3, 4, 5.0] = A()
    }
}

main(): Int64 {
    if (A().foo() is Unit && a == 4 && b == 4 && c == 6 && d == 4 && e == 5.0) {
        return 0
    } else {
        return 1
    }
}
