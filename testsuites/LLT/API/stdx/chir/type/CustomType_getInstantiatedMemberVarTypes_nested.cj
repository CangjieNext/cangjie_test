/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// getInstantiatedMemberVarTypes：复合类型参数经 getInstType/createNewTypeWithArgs 实例化

/* SCAN
nested inst size: 10
nested kinds ok: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let bl = BoolType.get()
    let pkg = Package("pkg.ct.nested", AccessLevel.Public)
    let gT = GenericType.get("pkg.ct.nested.T", "T")

    let innerCls = pkg.addClass("Inner", "Inner", true, genericTypeParams: [gT])
    let innerSt = pkg.addStruct("InnerS", "InnerS", genericTypeParams: [gT])
    let innerEn = pkg.addEnum("InnerE", "InnerE", true, genericTypeParams: [gT])

    let holder = pkg.addClass("Holder", "Holder", true, genericTypeParams: [gT])
    holder.appendInstanceMemberVar("tup", TupleType.get([gT, i32]))
    holder.appendInstanceMemberVar("st", StructType.get(innerSt, [gT]))
    holder.appendInstanceMemberVar("cl", ClassLikeType.get(innerCls, [gT]))
    holder.appendInstanceMemberVar("en", EnumType.get(innerEn, [gT]))
    holder.appendInstanceMemberVar("fn", FuncType.get([gT], i32))
    holder.appendInstanceMemberVar("rf", RefType.get(gT))
    holder.appendInstanceMemberVar("bx", BoxType.get(gT))
    holder.appendInstanceMemberVar("cp", CPointerType.get(gT))
    holder.appendInstanceMemberVar("ra", RawArrayType.get(gT, 1u32))
    holder.appendInstanceMemberVar("va", VArrayType.get(gT, 4))

    let mono = ClassLikeType.get(holder, [bl])
    let inst = mono.getInstantiatedMemberVarTypes()
    println("nested inst size: ${inst.size}")

    let ok = (inst[0] as TupleType).isSome() &&
        (inst[1] as StructType).isSome() &&
        (inst[2] as ClassLikeType).isSome() &&
        (inst[3] as EnumType).isSome() &&
        (inst[4] as FuncType).isSome() &&
        (inst[5] as RefType).isSome() &&
        (inst[6] as BoxType).isSome() &&
        (inst[7] as CPointerType).isSome() &&
        (inst[8] as RawArrayType).isSome() &&
        (inst[9] as VArrayType).isSome() &&
        (inst[0] as TupleType).getOrThrow().elementTypes[0] == bl &&
        (inst[5] as RefType).getOrThrow().baseType == bl &&
        (inst[8] as RawArrayType).getOrThrow().elementType == bl &&
        (inst[9] as VArrayType).getOrThrow().elementType == bl
    println("nested kinds ok: ${ok}")
}
