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
import std.collection.*

var a = HashSet<Int8>()
var a1 = HashSet<Int16>()
var a2 = HashSet<Int32>()
var a3 = HashSet<Int64>()
var a4 = HashSet<UInt8>()
var a5 = HashSet<UInt16>()
var a6 = HashSet<UInt32>()
var a7 = HashSet<UInt64>()
var a8 = HashSet<Float16>()
var a9 = HashSet<Float32>()
var a10 = HashSet<Float64>()
var a11 = HashSet<Rune>()
var a12 = HashSet<Bool>()
var a13 = HashSet<String>()

main(): Int64 {
    return a.size + a1.size + a2.size + a3.size + a4.size + a5.size + a6.size + a7.size + a8.size + a9.size + a10.size + a11
        .size + a12.size + a13.size
}
