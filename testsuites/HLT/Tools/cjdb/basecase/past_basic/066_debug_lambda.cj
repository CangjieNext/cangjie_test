/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f1(a1: (Int64) -> Int64): Int64 {
    a1(1)
}

func f2(): (Int64) -> Int64 {
    {a: Int64 => a}
}
var globals_i64 = 64
main(): Int64 {
    var a = 10
    let result = Option<Int64>.Some(2023)
    return 0
}
func test_f() {
    var tf = 10
}
