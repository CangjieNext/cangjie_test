/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import stdx.chir.*

// Diverse builtin and composite types in function signature

main() {
    let pkgName = "pkg.ser51"
    let pkg = Package(pkgName, AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i8 = IntType.getInt8()
    let i16 = IntType.getInt16()
    let inat = IntType.getIntNative()
    let u8 = IntType.getUInt8()
    let u16 = IntType.getUInt16()
    let u32 = IntType.getUInt32()
    let u64 = IntType.getUInt64()
    let unat = IntType.getUIntNative()
    let f16 = FloatType.getFloat16()
    let f32 = FloatType.getFloat32()
    let f64 = FloatType.getFloat64()
    let runeTy = RuneType.get()
    let boolTy = BoolType.get()
    let rawArr = RawArrayType.get(i32, 2)
    let vaTy = VArrayType.get(i32, 3)
    let tupTy = TupleType.get(Array<Type>(2, { i => if (i == 0) { i32 } else { boolTy } }))
    let nestedFnTy = FuncType.get([i32], UnitType.get())
    let gT = GenericType.get("${pkgName}.T", "T")

    let paramTypes = Array<Type>(
        18,
        { i =>
            if (i == 0) {
                i8
            } else if (i == 1) {
                i16
            } else if (i == 2) {
                inat
            } else if (i == 3) {
                u8
            } else if (i == 4) {
                u16
            } else if (i == 5) {
                u32
            } else if (i == 6) {
                u64
            } else if (i == 7) {
                unat
            } else if (i == 8) {
                f16
            } else if (i == 9) {
                f32
            } else if (i == 10) {
                f64
            } else if (i == 11) {
                runeTy
            } else if (i == 12) {
                boolTy
            } else if (i == 13) {
                CStringType.get()
            } else if (i == 14) {
                rawArr
            } else if (i == 15) {
                vaTy
            } else if (i == 16) {
                BoxType.get(i32)
            } else {
                RefType.get(i32)
            }
        }
    )

    let fn = pkg.addFunction(FuncType.get(paramTypes, NothingType.get()), "fnTypes", "fnTypes", pkgName)
    fn.genericTypeParams = [gT]
    fn.initBody()
    fn.body.getOrThrow().entryBlock.appendExpr(Exit.create())

    let fnTup = pkg.addFunction(FuncType.get([tupTy, nestedFnTy], UnitType.get()), "fnTup", "fnTup", pkgName)
    fnTup.initBody()
    fnTup.body.getOrThrow().entryBlock.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
