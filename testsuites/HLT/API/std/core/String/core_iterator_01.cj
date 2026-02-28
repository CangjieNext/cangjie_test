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
// ASSERT: scan [a, b, c]
// ASSERT: scan [a, w, c]
// ASSERT: scan [ , ., \]
// ASSERT: scan []
// ASSERT: scan [a, 3]

import std.core.*
import std.collection.*

main(): Unit {
    var a = "abc"
    println(a.runes() |> collectArray)
    var a1 = String([r'a', r'\u{77}', r'c'])
    println(a1.runes() |> collectArray)
    var a2 = String([r' ', r'.', r'\\'])
    println(a2.runes() |> collectArray)
    var a3 = ""
    println(a3.runes() |> collectArray)
    println("a3".runes() |> collectArray)
}
