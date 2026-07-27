/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// isIntType / isPrimitiveType：更多 TypeKind 走 TypeKind.toUInt

/* SCAN
Int16 isInt: true
UInt16 isInt: true
UInt64 isInt: true
Float16 isPrim: true
Float64 isPrim: true
Rune isPrim: true
Unit isPrim: true
CPointer isInt: false
CString isInt: false
Ref isInt: false
Box isInt: false
Func isInt: false
VArray isInt: false
Enum isInt: false
Struct isInt: false
*/

import stdx.chir.*

main() {
    println("Int16 isInt: ${IntType.getInt16().isIntType()}")
    println("UInt16 isInt: ${IntType.getUInt16().isIntType()}")
    println("UInt64 isInt: ${IntType.getUInt64().isIntType()}")
    println("Float16 isPrim: ${FloatType.getFloat16().isPrimitiveType()}")
    println("Float64 isPrim: ${FloatType.getFloat64().isPrimitiveType()}")
    println("Rune isPrim: ${RuneType.get().isPrimitiveType()}")
    println("Unit isPrim: ${UnitType.get().isPrimitiveType()}")
    let i32 = IntType.getInt32()
    println("CPointer isInt: ${CPointerType.get(i32).isIntType()}")
    println("CString isInt: ${CStringType.get().isIntType()}")
    println("Ref isInt: ${RefType.get(i32).isIntType()}")
    println("Box isInt: ${BoxType.get(i32).isIntType()}")
    println("Func isInt: ${FuncType.get(Array<Type>(), UnitType.get()).isIntType()}")
    println("VArray isInt: ${VArrayType.get(i32, 1).isIntType()}")
    let pkg = Package("pkg.tint.kinds", AccessLevel.Public)
    println("Enum isInt: ${pkg.addEnum("mE", "E", true).enumType.isIntType()}")
    println("Struct isInt: ${pkg.addStruct("mS", "S").structType.isIntType()}")
}
