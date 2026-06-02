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

var a = ArrayList<Int8>()
var a1 = ArrayList<Int16>()
var a2 = ArrayList<Int32>()
var a3 = ArrayList<Int64>()
var a4 = HashSet<UInt8>()
var a5 = ArrayList<UInt16>([])
var a6 = ArrayList<UInt32>()
var a7 = ArrayList<UInt64>()
var a8 = ArrayList<Float16>()
var a9 = ArrayList<Float32>()
var a10 = ArrayList<Float64>()
var a11 = ArrayList<Rune>()
var a12 = ArrayList<Bool>()
var a13 = ArrayList<String>(2)

main(): Int64 {
    return a.size + a1.size + a2.size + a3.size + a4.size + a5.size + a6.size + a7.size + a8.size + a9.size + a10.size + a11
        .size + a12.size + a13.size
}
