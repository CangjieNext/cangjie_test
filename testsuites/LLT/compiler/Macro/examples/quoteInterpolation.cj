// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan arr =[1, 2, 3, 4, 5]
// ASSERT: scan x = 1.0
// ASSERT: scan s = "Hello"

import std.ast.*

let intList: Array<Int64> = [1, 2, 3, 4, 5]
let float: Float64 = 1.0
let str: String = "Hello"
let tokens = quote(arr = $(intList)
                   x = $(float)
                   s = $(str))

main() {
    println(tokens)
}
