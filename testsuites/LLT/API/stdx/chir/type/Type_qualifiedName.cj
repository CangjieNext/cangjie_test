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
qn Int32: Int32
qn Ref: Int32
qn CP: CPointer<Int32>
qn Tuple: Tuple<Int32,Bool>
qn Func: (Int32)->Bool
qn Gen: T
qn RA: RawArray<Int32>
qn VA: VArray<Int32,4>
qn Box: Box<Int32>
qn class: pkg.qn:C
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    println("qn Int32: ${i32.qualifiedName}")
    println("qn Ref: ${RefType.get(i32).qualifiedName}")
    println("qn CP: ${CPointerType.get(i32).qualifiedName}")
    let tup = TupleType.get(Array<Type>(2, { idx =>
        if (idx == 0) {
            i32
        } else {
            BoolType.get()
        }
    }))
    println("qn Tuple: ${tup.qualifiedName}")
    println("qn Func: ${FuncType.get(Array<Type>(1, { _ => i32 }), BoolType.get()).qualifiedName}")
    println("qn Gen: ${GenericType.get("pkgGT", "T").qualifiedName}")
    println("qn RA: ${RawArrayType.get(i32, 2).qualifiedName}")
    println("qn VA: ${VArrayType.get(i32, 4).qualifiedName}")
    println("qn Box: ${BoxType.get(i32).qualifiedName}")

    let pkg = Package("pkg.qn", AccessLevel.Public)
    let cls = pkg.addClass("mC", "C", true)
    println("qn class: ${ClassLikeType.get(cls, Array<Type>()).qualifiedName}")
}
