/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*
import std.math.*

var map1: HashSet<String> = HashSet<String>(["a", "c"])
var map2: HashSet<Bool> = HashSet<Bool>([true, false])
var map3: HashSet<Int8> = HashSet<Int8>([Int8.Max, Int8.Min])
var map4: HashSet<Int32> = HashSet<Int32>([Int32.Max, Int32.Min])
var map5: HashSet<UInt8> = HashSet<UInt8>([UInt8.Max, UInt8.Min])
var map6: HashSet<Float16> = HashSet<Float16>([Float16.Max, Float16.Min])
var map7: HashSet<Float32> = HashSet<Float32>([Float32.Max, Float32.Min])
var map8: HashSet<Rune> = HashSet<Rune>([r'S', r'g'])
var map9: HashSet<Int64> = HashSet<Int64>([Int64.Max, Int64.Min])
var map11: HashSet<Int16> = HashSet<Int16>([Int16.Max, Int16.Min])
var map12: HashSet<UInt16> = HashSet<UInt16>([UInt16.Max, UInt16.Min])
var map13: HashSet<UInt32> = HashSet<UInt32>([UInt32.Max, UInt32.Min])
var map14: HashSet<UInt64> = HashSet<UInt64>([UInt64.Max, UInt64.Min])
var map15: HashSet<Float64> = HashSet<Float64>([Float64.Max, Float64.Min])

main(): Int64 {
    var str1: Array<String> = [map1.toString(), map2.toString(), map3.toString(), map4.toString(), map5.toString(),
        map6.toString(), map7.toString(), map8.toString(), map9.toString(), map11.toString(), map12.toString(),
        map13.toString(), map14.toString(), map15.toString()]
    var exp_str: Array<String> = [
        "[a, c]",
        "[true, false]",
        "[${Int8.Max}, ${Int8.Min}]",
        "[${Int32.Max}, ${Int32.Min}]",
        "[${UInt8.Max}, ${UInt8.Min}]",
        "[${Float16.Max}, ${Float16.Min}]",
        "[${Float32.Max}, ${Float32.Min}]",
        "[S, g]",
        "[${Int64.Max}, ${Int64.Min}]",
        "[${Int16.Max}, ${Int16.Min}]",
        "[${UInt16.Max}, ${UInt16.Min}]",
        "[${UInt32.Max}, ${UInt32.Min}]",
        "[${UInt64.Max}, ${UInt64.Min}]",
        "[${Float64.Max}, ${Float64.Min}]"
    ]
    for (i in 0..str1.size) {
        if (str1[i] != exp_str[i]) {
            println("i=" + i.toString())
            println("str1[i]=" + str1[i])
            println("exp_str[i]=" + exp_str[i])
            return 1
        }
    }
    return 0
}
