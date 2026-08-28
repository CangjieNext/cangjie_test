/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// TypeKind Equatable：isBuiltinType/isFloatType 等谓词；同 kind 不同实例的 isEqualOrInstantiatedTypeOf

/* SCAN
each builtin isBuiltin: true
class isBuiltin: false
float kinds: true
signed unsigned: true
same kind mismatch: true
cross kind mismatch: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.tkind.eq", AccessLevel.Public)
    let base = pkg.addClass("mBase", "Base", true)
    let other = pkg.addClass("mOther", "Other", true)
    let en = pkg.addEnum("mE", "E", true)
    let st = pkg.addStruct("mS", "S")

    let eachBuiltin =
        IntType.getInt8().isBuiltinType() &&
        IntType.getInt16().isBuiltinType() &&
        IntType.getInt32().isBuiltinType() &&
        IntType.getInt64().isBuiltinType() &&
        IntType.getIntNative().isBuiltinType() &&
        IntType.getUInt8().isBuiltinType() &&
        IntType.getUInt16().isBuiltinType() &&
        IntType.getUInt32().isBuiltinType() &&
        IntType.getUInt64().isBuiltinType() &&
        IntType.getUIntNative().isBuiltinType() &&
        FloatType.getFloat16().isBuiltinType() &&
        FloatType.getFloat32().isBuiltinType() &&
        FloatType.getFloat64().isBuiltinType() &&
        BoolType.get().isBuiltinType() &&
        RuneType.get().isBuiltinType() &&
        UnitType.get().isBuiltinType() &&
        NothingType.get().isBuiltinType() &&
        RawArrayType.get(i32, 1u32).isBuiltinType() &&
        VArrayType.get(i32, 1).isBuiltinType() &&
        CPointerType.get(i32).isBuiltinType() &&
        CStringType.get().isBuiltinType()
    println("each builtin isBuiltin: ${eachBuiltin}")
    println("class isBuiltin: ${base.classType.isBuiltinType()}")

    println("float kinds: ${FloatType.getFloat16().isFloatType() && FloatType.getFloat32().isFloatType() && FloatType.getFloat64().isFloatType()}")
    println("signed unsigned: ${IntType.getInt8().isSignedIntType() && IntType.getUInt8().isUnsignedIntType()}")

    let sameKind =
        !RawArrayType.get(i32, 1u32).isEqualOrInstantiatedTypeOf(RawArrayType.get(BoolType.get(), 1u32)) &&
        !VArrayType.get(i32, 1).isEqualOrInstantiatedTypeOf(VArrayType.get(BoolType.get(), 1)) &&
        !BoxType.get(i32).isEqualOrInstantiatedTypeOf(BoxType.get(BoolType.get())) &&
        !CPointerType.get(i32).isEqualOrInstantiatedTypeOf(CPointerType.get(BoolType.get())) &&
        !FuncType.get([i32], UnitType.get()).isEqualOrInstantiatedTypeOf(
            FuncType.get([BoolType.get()], UnitType.get())) &&
        !TupleType.get([i32]).isEqualOrInstantiatedTypeOf(TupleType.get([BoolType.get()])) &&
        !GenericType.get("gK1", "A").isEqualOrInstantiatedTypeOf(GenericType.get("gK2", "B")) &&
        !RefType.get(i32).isEqualOrInstantiatedTypeOf(RefType.get(BoolType.get()))
    println("same kind mismatch: ${sameKind}")

    let crossKind =
        !base.classType.isEqualOrInstantiatedTypeOf(other.classType) &&
        !base.classType.isEqualOrInstantiatedTypeOf(en.enumType) &&
        !en.enumType.isEqualOrInstantiatedTypeOf(st.structType) &&
        !ThisType.get().isEqualOrInstantiatedTypeOf(i32)
    println("cross kind mismatch: ${crossKind}")
}
