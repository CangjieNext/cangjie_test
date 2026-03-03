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
Two NothingType instances are equal: true
NothingType == IntType: false
NothingType == FloatType: false
NothingType == BoolType: false
NothingType == UnitType: false
NothingType == RuneType: false
*/

import stdx.chir.*

main() {
    let nothingType1 = NothingType.get()
    let nothingType2 = NothingType.get()
    println("Two NothingType instances are equal: ${nothingType1 == nothingType2}")
    
    // Compare with other types
    let intType = IntType.getInt32()
    let floatType = FloatType.getFloat32()
    let boolType = BoolType.get()
    let unitType = UnitType.get()
    let runeType = RuneType.get()
    
    println("NothingType == IntType: ${nothingType1 == intType}")
    println("NothingType == FloatType: ${nothingType1 == floatType}")
    println("NothingType == BoolType: ${nothingType1 == boolType}")
    println("NothingType == UnitType: ${nothingType1 == unitType}")
    println("NothingType == RuneType: ${nothingType1 == runeType}")
}
