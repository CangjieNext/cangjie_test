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
// ASSERT: scan [1, 2, 3]
// ASSERT: scan [1, 2]
// ASSERT: scan [1, 3, 5]
// ASSERT: scan [5, 4, 3, 2, 1]

import std.core.*
import std.collection.*

main(): Unit {
    let a = Range<Int64>(1, 3, 1, false, false, true)
    let b = Range<Int64>(1, 3, 1, false, false, false)
    let c = Range<Int64>(1, 5, 2, false, false, true)
    let d = Range<Int64>(5, 1, -1, false, false, true)
    
    println("${a |> collectArray}")
    println("${b |> collectArray}")
    println("${c |> collectArray}")
    println("${d |> collectArray}")
}
