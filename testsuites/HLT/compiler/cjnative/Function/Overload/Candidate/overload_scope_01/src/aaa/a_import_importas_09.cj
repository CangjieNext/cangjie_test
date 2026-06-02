/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/bbb/b_01.cj -o bbb.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/ccc/c_01.cj -o ccc.%middle
// EXEC: %compiler %cmp_opt src/aaa/%f bbb.%middle ccc.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package aaa

import bbb.foo
import ccc.COO as bbb

main(): Int64 {
    var a = bbb.foo(1)
    if (a != 100) {
        return 1
    }
    return 0
}
