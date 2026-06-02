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
type1 == type2: true
type1 == type3: false
type1 == type4: false
float1 == float2: true
float1 == float3: false
type1 == float1: false
ref1 == ref2: true
ref1 == ref3: false
cptr1 == cptr2: true
cptr1 == cptr3: false
*/

import stdx.chir.*

main() {
    // Compare same IntType instances
    let type1 = IntType.getInt32()
    let type2 = IntType.getInt32()
    let type3 = IntType.getInt64()
    println("type1 == type2: ${type1 == type2}")
    println("type1 == type3: ${type1 == type3}")

    // Compare IntType with BoolType
    let type4 = BoolType.get()
    println("type1 == type4: ${type1 == type4}")

    // Compare FloatType instances
    let float1 = FloatType.getFloat32()
    let float2 = FloatType.getFloat32()
    let float3 = FloatType.getFloat64()
    println("float1 == float2: ${float1 == float2}")
    println("float1 == float3: ${float1 == float3}")

    // Compare IntType with FloatType
    println("type1 == float1: ${type1 == float1}")

    // Compare RefType instances
    let intType = IntType.getInt32()
    let ref1 = RefType.get(intType)
    let ref2 = RefType.get(intType)
    let floatType = FloatType.getFloat32()
    let ref3 = RefType.get(floatType)
    println("ref1 == ref2: ${ref1 == ref2}")
    println("ref1 == ref3: ${ref1 == ref3}")

    // Compare CPointerType instances
    let cptr1 = CPointerType.get(intType)
    let cptr2 = CPointerType.get(intType)
    let cptr3 = CPointerType.get(floatType)
    println("cptr1 == cptr2: ${cptr1 == cptr2}")
    println("cptr1 == cptr3: ${cptr1 == cptr3}")
}
