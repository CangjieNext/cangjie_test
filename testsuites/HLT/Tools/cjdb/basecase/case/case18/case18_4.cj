/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.ast.*

main() {
    let intList: Array<Int64> = [1, 2, 3, 4, 5]
    let float: Float64 = 1.0
    let str: String = "Hello"
    let tokens = quote(
    arr = $(intList)
    x = $(float)
    s = $(str)
)
    println(tokens)
}
