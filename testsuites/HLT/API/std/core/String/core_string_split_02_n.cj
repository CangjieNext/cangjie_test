/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f

import std.core.*

main() {
    println("aaa aaa aaa".split("aaa", 1, removeEmpty: true))
    println("aaa aaa aaa".split("aaa", 1, removeEmpty: false))
    println("aaa aaa aaa".split("aaa", 10, removeEmpty: true))
    println("aaa aaa aaa".split("aaa", 10, removeEmpty: false))
    0
}

[aaa aaa aaa]
[aaa aaa aaa]
[ ,  ]
[,  ,  , ]*/
