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
// EXEC-PIPE-1: %compiler %cmp_opt %f bbb.%middle -o %output 2>&1 | compare %f

package aaa

import bbb.foo

main(): Int64 {
    var bbb = COO()
    var a = bbb.foo(1, "a")
    return 0
}

func foo(x: Int32) {
    return 1
}

func foo(x: Int64) {
    return 2
}

func foo(x: Int64, y: String) {
    return 3
}

func foo(x: Int64, y: Rune) {
    return 4
}

class COO {
    public func foo(x: Int32) {
        return 11
    }

    public func foo(x: Int64) {
        return 12
    }
}
// ASSERT: scan sema_wrong_number_of_arguments
