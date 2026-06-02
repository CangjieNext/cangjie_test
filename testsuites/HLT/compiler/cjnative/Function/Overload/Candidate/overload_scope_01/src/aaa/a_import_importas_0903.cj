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

package aaa

import bbb
import ccc.COO as bbb

type bbb = TimeUnit

main(): Int64 {
    var a = bbb.foo(1)
    var b = match (a) {
        case _ => 0
    }
    if (b != 0) {
        return 1
    }
    return 0
}

enum TimeUnit {
    foo | foo(Int32) | foo(Int64, String)
}
