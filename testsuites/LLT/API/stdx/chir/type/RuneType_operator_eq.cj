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
Two RuneType instances are equal: true
RuneType == IntType: false
RuneType == FloatType: false
RuneType == BoolType: false
RuneType == UnitType: false
RuneType == NothingType: false
*/

import stdx.chir.*

main() {
    let runeType1 = RuneType.get()
    let runeType2 = RuneType.get()
    println("Two RuneType instances are equal: ${runeType1 == runeType2}")
    
    // Compare with other types
    let intType = IntType.getInt32()
    let floatType = FloatType.getFloat32()
    let boolType = BoolType.get()
    let unitType = UnitType.get()
    let nothingType = NothingType.get()
    
    println("RuneType == IntType: ${runeType1 == intType}")
    println("RuneType == FloatType: ${runeType1 == floatType}")
    println("RuneType == BoolType: ${runeType1 == boolType}")
    println("RuneType == UnitType: ${runeType1 == unitType}")
    println("RuneType == NothingType: ${runeType1 == nothingType}")
}
