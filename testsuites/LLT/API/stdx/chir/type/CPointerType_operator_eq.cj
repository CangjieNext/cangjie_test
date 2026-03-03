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
Two C pointer types are equal: true
CPointer<Int32> == CPointer<Float32>: false
CPointer<Int32> == Int32: false
CPointer<Int32> == RefType: false
CPointer<Int32> == BoolType: false
*/

import stdx.chir.*

main() {
    let intType = IntType.getInt32()
    let cPointerType1 = CPointerType.get(intType)
    let cPointerType2 = CPointerType.get(intType)
    println("Two C pointer types are equal: ${cPointerType1 == cPointerType2}")
    
    // Compare with other types
    let floatType = FloatType.getFloat32()
    let cPointerFloat = CPointerType.get(floatType)
    let refType = RefType.get(intType)
    let boolType = BoolType.get()
    
    println("CPointer<Int32> == CPointer<Float32>: ${cPointerType1 == cPointerFloat}")
    println("CPointer<Int32> == Int32: ${cPointerType1 == intType}")
    println("CPointer<Int32> == RefType: ${cPointerType1 == refType}")
    println("CPointer<Int32> == BoolType: ${cPointerType1 == boolType}")
}
