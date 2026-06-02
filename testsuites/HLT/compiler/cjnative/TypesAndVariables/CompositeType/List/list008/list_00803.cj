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

func foo(): Int64 {
    let a = [1, 2, 3]
    var b = [1, 2, 3]
    return a.size + b.size - 6
}

func bar<T>(input: T): Int64 {
    let a = [input]
    var b = [input]
    return a.size + b.size - 2
}

main(): Int64 {
    return foo() + bar(1)
}
