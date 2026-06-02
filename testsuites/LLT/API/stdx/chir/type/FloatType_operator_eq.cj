/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
Two Float32 types are equal: true
Float32 and Float64 types are equal: false
Float32 == Int32: false
Float32 == BoolType: false
Float32 == UnitType: false
Float32 == NothingType: false
Float32 == RuneType: false
*/

import stdx.chir.*

main() {
    let float32Type1 = FloatType.getFloat32()
    let float32Type2 = FloatType.getFloat32()
    let float64Type = FloatType.getFloat64()
    println("Two Float32 types are equal: ${float32Type1 == float32Type2}")
    println("Float32 and Float64 types are equal: ${float32Type1 == float64Type}")
    
    // Compare with other types
    let intType = IntType.getInt32()
    let boolType = BoolType.get()
    let unitType = UnitType.get()
    let nothingType = NothingType.get()
    let runeType = RuneType.get()
    
    println("Float32 == Int32: ${float32Type1 == intType}")
    println("Float32 == BoolType: ${float32Type1 == boolType}")
    println("Float32 == UnitType: ${float32Type1 == unitType}")
    println("Float32 == NothingType: ${float32Type1 == nothingType}")
    println("Float32 == RuneType: ${float32Type1 == runeType}")
}
