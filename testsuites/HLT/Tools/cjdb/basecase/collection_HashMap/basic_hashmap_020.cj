import std.collection.*
import std.math.*

main() {
    var map1: HashMap<String, Int64> = HashMap<String, Int64>([("a", 8), ("b", 19)])
    var map2: HashMap<Bool, Unit> = HashMap<Bool, Unit>([(true, ()), (false, ())])
    var map3: HashMap<Int8, Int16> = HashMap<Int8, Int16>([(Int8.Max, Int16.Max), (Int8.Min, Int16.Min)])
    var map4: HashMap<Int32, UInt16> = HashMap<Int32, UInt16>([(Int32.Max, UInt16.Max), (Int32.Min, UInt16.Min)])
    var map5: HashMap<UInt8, UInt32> = HashMap<UInt8, UInt32>([(UInt8.Max, UInt32.Max), (UInt8.Min, UInt32.Min)])
    var map6: HashMap<Float16, UInt64> = HashMap<Float16, UInt64>([(Float16.Max, UInt64.Max), (Float16.Min, UInt64.Min)])
    var map7: HashMap<Float32, Float64> = HashMap<Float32, Float64>(
        [(Float32.Max, Float64.Max), (Float32.Min, Float64.Min)])
    var map8: HashMap<Rune, Float64> = HashMap<Rune, Float64>([(r'S', Float64.Max), (r'g', Float64.Min)])
    var HashMap01: HashMap<IntNative, UIntNative> = HashMap<IntNative, UIntNative>([(1, 2)])
    var HashMap02: HashMap<UIntNative, IntNative> = HashMap<UIntNative, IntNative>([(1, 2)])
    let sum = {a: HashMap<Int32, String> => a}
    let myTuple: (HashMap<Int32, Int32>, HashMap<Int32, Int32>) = (HashMap<Int32, Int32>([(1, 1)]),
        HashMap<Int32, Int32>([(2, 2)]))
    0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
