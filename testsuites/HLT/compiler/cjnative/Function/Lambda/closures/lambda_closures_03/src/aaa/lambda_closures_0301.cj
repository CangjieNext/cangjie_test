/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/bbb/b01.cj -o bbb.%middle
// EXEC: %compiler %cmp_opt src/aaa/%f bbb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package aaa

import bbb.foo1
import bbb.foo2
import bbb.foo4

main(): Int64 {
    if (case01()({=> 1}) != 1) {
        return 1
    }
    if (case02()({=> 1}) != 2) {
        return 2
    }
    if (foo2({=> 1}) != 2) {
        return 3
    }
    if (foo4({=> 1}) != 4) {
        return 3
    }
    return 0
}

func case01() {
    return foo1
}

func case02() {
    return foo2
}
