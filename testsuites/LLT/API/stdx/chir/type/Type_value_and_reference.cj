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
i32 val ref: true false
class val ref: false true
tuple val ref: true false
raw val ref: false true
this val ref: false true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.vr", AccessLevel.Public)
    let cls = pkg.addClass("mC", "C", true)
    let clt = ClassLikeType.get(cls, Array<Type>())
    let tup = TupleType.get(Array<Type>(1, { _ => i32 }))
    let ra = RawArrayType.get(i32, 1)
    let th = ThisType.get()

    println("i32 val ref: ${i32.isValueType()} ${i32.isReferenceType()}")
    println("class val ref: ${clt.isValueType()} ${clt.isReferenceType()}")
    println("tuple val ref: ${tup.isValueType()} ${tup.isReferenceType()}")
    println("raw val ref: ${ra.isValueType()} ${ra.isReferenceType()}")
    println("this val ref: ${th.isValueType()} ${th.isReferenceType()}")
}
