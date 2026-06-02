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
Two reference types are equal: true
Int32& == Float32&: false
Int32& == Int32: false
Int32& == CPointer<Int32>: false
Int32& == BoolType: false
*/

import stdx.chir.*

main() {
    let intType = IntType.getInt32()
    let refType1 = RefType.get(intType)
    let refType2 = RefType.get(intType)
    println("Two reference types are equal: ${refType1 == refType2}")
    
    // Compare with other types
    let floatType = FloatType.getFloat32()
    let refFloat = RefType.get(floatType)
    let cPointerType = CPointerType.get(intType)
    let boolType = BoolType.get()
    
    println("Int32& == Float32&: ${refType1 == refFloat}")
    println("Int32& == Int32: ${refType1 == intType}")
    println("Int32& == CPointer<Int32>: ${refType1 == cPointerType}")
    println("Int32& == BoolType: ${refType1 == boolType}")
}
