/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// isEqualOrSubTypeOf：Ref↔Ref、class vs class&、visited 环、CType parent、generic 上界失败

/* SCAN
ref-ref sub: true
class vs ref false: false
visited cycle: false
ctype parent: true
gen ub sub fail: false
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.sub.ref", AccessLevel.Public)
    let base = pkg.addClass("mBase", "Base", true)
    let sub = pkg.addClass("mSub", "Sub", true)
    sub.superClass = Some(base.classType)

    let rBase = RefType.get(base.classType)
    let rSub = RefType.get(sub.classType)
    println("ref-ref sub: ${rSub.isEqualOrSubTypeOf(rBase)}")
    println("class vs ref false: ${base.classType.isEqualOrSubTypeOf(rBase)}")

    var visited = ArrayList<(Type, Type)>()
    visited.add((sub.classType, base.classType))
    println("visited cycle: ${sub.classType.isEqualOrSubTypeOf(base.classType, visited: visited)}")

    let core = Package("std.core", AccessLevel.Public)
    let cType = core.addClass("CType", "CType", false)
    println("ctype parent: ${i32.isEqualOrSubTypeOf(cType.classType)}")

    let gUb = GenericType.get("gUbFail", "U")
    gUb.upperBounds = [RefType.get(base.classType)]
    let other = pkg.addClass("mOther", "Other", true)
    println("gen ub sub fail: ${gUb.isEqualOrSubTypeOf(other.classType)}")
}
