/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt p1/a.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1

var b = p1.a

main(): Int64 {
    if (foo(b)() != r'a') {
        return 1
    }
    if (goo()() != r'a') {
        return 2
    }
    return 0
}

func foo(x: () -> Rune) {
    return x
}

func goo(x!: () -> Rune = b) {
    return x
}
