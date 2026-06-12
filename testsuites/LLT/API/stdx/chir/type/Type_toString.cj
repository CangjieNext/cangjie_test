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
Type: Int32
Bool type: Bool
Int8 type: Int8
Int16 type: Int16
Int32 type: Int32
Int64 type: Int64
IntNative type: IntNative
UInt8 type: UInt8
UInt16 type: UInt16
UInt32 type: UInt32
UInt64 type: UInt64
UIntNative type: UIntNative
Float16 type: Float16
Float32 type: Float32
Float64 type: Float64
C pointer type: CPointer<Int32>
Reference type: Int32&
C string type: CString
Rune type: Rune
Unit type: Unit
Nothing type: Nothing
C pointer type string: CPointer<Int32>
Reference type string: Int32&
C pointer type: CPointer<Int32>
Element type: Int32
Reference type: Int32&
Base type: Int32
Reference type: Int32&&
After stripping refs: Int32
*/

import stdx.chir.*

main() {
    // ===== Type.toString() tests =====
    let intType = IntType.getInt32()
    println("Type: ${intType.toString()}")

    // ===== BoolType.toString() tests =====
    let boolType = BoolType.get()
    println("Bool type: ${boolType.toString()}")

    // ===== IntType.toString() tests =====
    let int8Type = IntType.getInt8()
    println("Int8 type: ${int8Type.toString()}")

    let int16Type = IntType.getInt16()
    println("Int16 type: ${int16Type.toString()}")

    let int32Type = IntType.getInt32()
    println("Int32 type: ${int32Type.toString()}")

    let int64Type = IntType.getInt64()
    println("Int64 type: ${int64Type.toString()}")

    let intNativeType = IntType.getIntNative()
    println("IntNative type: ${intNativeType.toString()}")

    let uint8Type = IntType.getUInt8()
    println("UInt8 type: ${uint8Type.toString()}")

    let uint16Type = IntType.getUInt16()
    println("UInt16 type: ${uint16Type.toString()}")

    let uint32Type = IntType.getUInt32()
    println("UInt32 type: ${uint32Type.toString()}")

    let uint64Type = IntType.getUInt64()
    println("UInt64 type: ${uint64Type.toString()}")

    let uintNativeType = IntType.getUIntNative()
    println("UIntNative type: ${uintNativeType.toString()}")

    // ===== FloatType.toString() tests =====
    let float16Type = FloatType.getFloat16()
    println("Float16 type: ${float16Type.toString()}")

    let float32Type = FloatType.getFloat32()
    println("Float32 type: ${float32Type.toString()}")

    let float64Type = FloatType.getFloat64()
    println("Float64 type: ${float64Type.toString()}")

    // ===== CPointerType.toString() tests =====
    let intType1 = IntType.getInt32()
    let cPointerType = CPointerType.get(intType1)
    println("C pointer type: ${cPointerType.toString()}")

    // ===== RefType.toString() tests =====
    let intType2 = IntType.getInt32()
    let refType = RefType.get(intType2)
    println("Reference type: ${refType.toString()}")

    // ===== CStringType.toString() tests =====
    let cStringType = CStringType.get()
    println("C string type: ${cStringType.toString()}")

    // ===== RuneType.toString() tests =====
    let runeType = RuneType.get()
    println("Rune type: ${runeType.toString()}")

    // ===== UnitType.toString() tests =====
    let unitType = UnitType.get()
    println("Unit type: ${unitType.toString()}")

    // ===== NothingType.toString() tests =====
    let nothingType = NothingType.get()
    println("Nothing type: ${nothingType.toString()}")

    // ===== CPointerType.toString() explicit test =====
    let intType3 = IntType.getInt32()
    let cPointerType2 = CPointerType.get(intType3)
    println("C pointer type string: ${cPointerType2.toString()}")

    // ===== RefType.toString() explicit test =====
    let intType4 = IntType.getInt32()
    let refType2 = RefType.get(intType4)
    println("Reference type string: ${refType2.toString()}")

    // ===== CPointerType elementType.toString() test =====
    let intType5 = IntType.getInt32()
    let cPointerType3 = CPointerType.get(intType5)
    let elementType = cPointerType3.elementType
    println("C pointer type: ${cPointerType3.toString()}")
    println("Element type: ${elementType.toString()}")

    // ===== RefType baseType.toString() test =====
    let intType6 = IntType.getInt32()
    let refType3 = RefType.get(intType6)
    let baseType = refType3.baseType
    println("Reference type: ${refType3.toString()}")
    println("Base type: ${baseType.toString()}")

    // ===== Type.stripAllRefs().toString() test =====
    let intType7 = IntType.getInt32()
    let refType4 = RefType.get(intType7)
    let refType5 = RefType.get(refType4)
    let baseType2 = refType5.stripAllRefs()
    println("Reference type: ${refType5.toString()}")
    println("After stripping refs: ${baseType2.toString()}")
}
