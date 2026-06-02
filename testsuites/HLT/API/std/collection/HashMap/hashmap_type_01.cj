/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    var HashMap01: HashMap<Int8, Int64> = HashMap<Int8, Int64>([(1, 2)])
    var HashMap02: HashMap<Int16, Int32> = HashMap<Int16, Int32>([(1, 2)])
    var HashMap03: HashMap<Int32, Int16> = HashMap<Int32, Int16>([(1, 2)])
    var HashMap04: HashMap<Int64, Int8> = HashMap<Int64, Int8>([(1, 2)])
    var HashMap05: HashMap<UInt8, UInt64> = HashMap<UInt8, UInt64>([(1, 2)])
    var HashMap06: HashMap<UInt16, UInt32> = HashMap<UInt16, UInt32>([(1, 2)])
    var HashMap07: HashMap<UInt32, UInt16> = HashMap<UInt32, UInt16>([(1, 2)])
    var HashMap08: HashMap<UInt64, UInt8> = HashMap<UInt64, UInt8>([(1, 2)])
    var HashMap09: HashMap<Float16, Float64> = HashMap<Float16, Float64>([(3.14, 3.14)])
    var HashMap10: HashMap<Float32, Float16> = HashMap<Float32, Float16>([(3.14, 3.14)])
    var HashMap11: HashMap<Float64, Float32> = HashMap<Float64, Float32>([(3.14, 3.14)])
    var value1 = HashMap01[1]
    var value2 = HashMap02[1]
    var value3 = HashMap03[1]
    var value4 = HashMap04[1]
    var value5 = HashMap05[1]
    var value6 = HashMap06[1]
    var value7 = HashMap07[1]
    var value8 = HashMap08[1]
    var value9 = HashMap09[3.14]
    var value10 = HashMap10[3.14]
    var value11 = HashMap11[3.14]
    if (value1 != 2) {
        return 1
    }
    if (value2 != 2) {
        return 2
    }
    if (value3 != 2) {
        return 3
    }
    if (value4 != 2) {
        return 4
    }
    if (value5 != 2) {
        return 5
    }
    if (value6 != 2) {
        return 6
    }
    if (value7 != 2) {
        return 7
    }
    if (value8 != 2) {
        return 8
    }
    if (value9 != 3.14) {
        return 9
    }
    if (value10 != 3.14) {
        return 10
    }
    if (value11 != 3.14) {
        return 11
    }
    return 0
}
