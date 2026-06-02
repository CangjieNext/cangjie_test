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
Two Int32 types are equal: true
Int32 and Int64 types are equal: false
Int32 == Float32: false
Int32 == BoolType: false
Int32 == UnitType: false
Int32 == NothingType: false
Int32 == RuneType: false
*/

import stdx.chir.*

main() {
    let int32Type1 = IntType.getInt32()
    let int32Type2 = IntType.getInt32()
    let int64Type = IntType.getInt64()
    println("Two Int32 types are equal: ${int32Type1 == int32Type2}")
    println("Int32 and Int64 types are equal: ${int32Type1 == int64Type}")
    
    // Compare with other types
    let floatType = FloatType.getFloat32()
    let boolType = BoolType.get()
    let unitType = UnitType.get()
    let nothingType = NothingType.get()
    let runeType = RuneType.get()
    
    println("Int32 == Float32: ${int32Type1 == floatType}")
    println("Int32 == BoolType: ${int32Type1 == boolType}")
    println("Int32 == UnitType: ${int32Type1 == unitType}")
    println("Int32 == NothingType: ${int32Type1 == nothingType}")
    println("Int32 == RuneType: ${int32Type1 == runeType}")
}
