/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*
import std.math.*

var map1: HashMap<String, Int64> = HashMap<String, Int64>([("a", 8), ("b", 19)])
var map2: HashMap<Bool, Unit> = HashMap<Bool, Unit>([(true, ()), (false, ())])
var map3: HashMap<Int8, Int16> = HashMap<Int8, Int16>([(Int8.Max, Int16.Max), (Int8.Min, Int16.Min)])
var map4: HashMap<Int32, UInt16> = HashMap<Int32, UInt16>([(Int32.Max, UInt16.Max), (Int32.Min, UInt16.Min)])
var map5: HashMap<UInt8, UInt32> = HashMap<UInt8, UInt32>([(UInt8.Max, UInt32.Max), (UInt8.Min, UInt32.Min)])
var map6: HashMap<Float16, UInt64> = HashMap<Float16, UInt64>([(Float16.Max, UInt64.Max), (Float16.Min, UInt64.Min)])
var map7: HashMap<Float32, Float64> = HashMap<Float32, Float64>([(Float32.Max, Float64.Max), (Float32.Min, Float64.Min)])
var map8: HashMap<Rune, Float64> = HashMap<Rune, Float64>([(r'S', Float64.Max), (r'g', Float64.Min)])

main(): Int64 {
    var str1 = [map1.toString(), map2.toString(), map3.toString(), map4.toString(), map5.toString(), map6.toString(),
        map7.toString(), map8.toString()]
    var expstr1 = ["(a, 8)", "(b, 19)"]
    var expstr2 = ["(false, ())", "(true, ())"]
    var expstr3 = ["(${Int8.Max}, ${Int16.Max})", "(${Int8.Min}, ${Int16.Min})"]
    var expstr4 = ["(${Int32.Max}, ${UInt16.Max})", "(${Int32.Min}, ${UInt16.Min})"]
    var expstr5 = ["(${UInt8.Min}, ${UInt32.Min})", "(${UInt8.Max}, ${UInt32.Max})"]
    var expstr6 = ["(${Float16.Max}, ${UInt64.Max})", "(${Float16.Min}, ${UInt64.Min})"]
    var expstr7 = ["(${Float32.Max}, ${Float64.Max})", "(${Float32.Min}, ${Float64.Min})"]
    var expstr8 = ["(S, ${Float64.Max})", "(g, ${Float64.Min})"]
    var exp_str = [expstr1, expstr2, expstr3, expstr4, expstr5, expstr6, expstr7, expstr8]
    for (i in 0..str1.size) {
        for (m in exp_str[i]) {
            if (!str1[i].contains(m)) {
                return 1
            }
        }
    }
    return 0
}
