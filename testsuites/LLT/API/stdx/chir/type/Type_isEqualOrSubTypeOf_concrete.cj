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
nothing sub i32: true
i32 sub i32: true
i32 sub i64: false
sub sub base: true
base sub sub: false
leaf sub mid: true
mid sub leaf: false
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()
    let n = NothingType.get()

    println("nothing sub i32: ${n.isEqualOrSubTypeOf(i32)}")
    println("i32 sub i32: ${i32.isEqualOrSubTypeOf(i32)}")
    println("i32 sub i64: ${i32.isEqualOrSubTypeOf(i64)}")

    let pkg = Package("pkg.sub.conc", AccessLevel.Public)
    let base = pkg.addClass("mBase", "Base", true)
    let sub = pkg.addClass("mSub", "Sub", true)
    sub.superClass = Some(base.classType)
    println("sub sub base: ${sub.ty.isEqualOrSubTypeOf(base.ty)}")
    println("base sub sub: ${base.ty.isEqualOrSubTypeOf(sub.ty)}")

    let mid = pkg.addClass("mMid", "Mid", true)
    let leaf = pkg.addClass("mLeaf", "Leaf", true)
    leaf.superClass = Some(mid.classType)
    println("leaf sub mid: ${leaf.ty.isEqualOrSubTypeOf(mid.ty)}")
    println("mid sub leaf: ${mid.ty.isEqualOrSubTypeOf(leaf.ty)}")
}
