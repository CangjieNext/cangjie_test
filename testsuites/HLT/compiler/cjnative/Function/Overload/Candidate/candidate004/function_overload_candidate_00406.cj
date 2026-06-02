/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class A {}

class B <: A {}

func foo(inp: () -> A): Int64 {
    return 1
}

func foo(inp: () -> B): Int64 {
    return 2
}

main(): Int64 {
    if (foo({=> A()}) != 1) {
        return 1
    }
    return 0
}
