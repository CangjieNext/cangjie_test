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
Int32 builtin: true
class builtin: false
Int32 custom: false
class custom: true
enum custom: true
struct custom: true
class isClassLike: true
enum isEnum: true
struct isStruct: true
tuple isTuple: true
cstr isCString: true
raw isRaw: true
varr isVArray: true
gen isGeneric: true
box isBox: true
this isThis: true
fun isFunc: true
cp isCPointer: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.kp", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let cls = pkg.addClass("mC", "C", true)
    let en = pkg.addEnum("mE", "E", true)
    let st = pkg.addStruct("mS", "S")
    let clt = ClassLikeType.get(cls, Array<Type>())
    let ent = EnumType.get(en, Array<Type>())
    let sty = StructType.get(st, Array<Type>())
    let tup = TupleType.get(Array<Type>(1, { _ => i32 }))

    println("Int32 builtin: ${i32.isBuiltinType()}")
    println("class builtin: ${clt.isBuiltinType()}")
    println("Int32 custom: ${i32.isCustomType()}")
    println("class custom: ${clt.isCustomType()}")
    println("enum custom: ${ent.isCustomType()}")
    println("struct custom: ${sty.isCustomType()}")
    println("class isClassLike: ${clt.isClassLikeType()}")
    println("enum isEnum: ${ent.isEnumType()}")
    println("struct isStruct: ${sty.isStructType()}")
    println("tuple isTuple: ${tup.isTupleType()}")
    println("cstr isCString: ${CStringType.get().isCStringType()}")
    println("raw isRaw: ${RawArrayType.get(i32, 1).isRawArrayType()}")
    println("varr isVArray: ${VArrayType.get(i32, 3).isVArrayType()}")
    println("gen isGeneric: ${GenericType.get("gK", "K").isGenericType()}")
    println("box isBox: ${BoxType.get(i32).isBoxType()}")
    println("this isThis: ${ThisType.get().isThisType()}")
    println("fun isFunc: ${FuncType.get(Array<Type>(), UnitType.get()).isFuncType()}")
    println("cp isCPointer: ${CPointerType.get(i32).isCPointerType()}")
}
