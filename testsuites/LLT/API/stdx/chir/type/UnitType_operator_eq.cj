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
Two UnitType instances are equal: true
UnitType == IntType: false
UnitType == FloatType: false
UnitType == BoolType: false
UnitType == NothingType: false
UnitType == RuneType: false
*/

import stdx.chir.*

main() {
    let unitType1 = UnitType.get()
    let unitType2 = UnitType.get()
    println("Two UnitType instances are equal: ${unitType1 == unitType2}")
    
    // Compare with other types
    let intType = IntType.getInt32()
    let floatType = FloatType.getFloat32()
    let boolType = BoolType.get()
    let nothingType = NothingType.get()
    let runeType = RuneType.get()
    
    println("UnitType == IntType: ${unitType1 == intType}")
    println("UnitType == FloatType: ${unitType1 == floatType}")
    println("UnitType == BoolType: ${unitType1 == boolType}")
    println("UnitType == NothingType: ${unitType1 == nothingType}")
    println("UnitType == RuneType: ${unitType1 == runeType}")
}
