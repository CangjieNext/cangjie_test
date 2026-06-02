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
// EXEC: %compiler %cmp_opt src/aaa/%f bbb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package aaa

import bbb.foo

main(): Int64 {
    var TimeUnit = COO()
    var a = TimeUnit.foo(1, "a")
    if (a != 12) {
        return 1
    }
    return 0
}

enum TimeUnit {
    foo | foo(Int32) | foo(Int64, String)
}

class COO {
    public func foo(x: Int32) {
        return 11
    }

    public func foo(x: Int64, y: String) {
        return 12
    }
}
