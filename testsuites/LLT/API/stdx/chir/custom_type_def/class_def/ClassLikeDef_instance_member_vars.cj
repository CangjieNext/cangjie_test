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
class instanceVars empty: 0
after append count: 2
first name a second name b: true
member a ty is Int32: true
outer is class: true
a readonly: true
a public: true
a str has name: true
b is internal: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.class.iv", AccessLevel.Public)
    let cls = pkg.addClass("mC", "C", true)

    println("class instanceVars empty: ${cls.instanceVars.size}")

    let va = cls.appendInstanceMemberVar("a", IntType.getInt32())
    let vb = cls.appendInstanceMemberVar("b", BoolType.get())

    println("after append count: ${cls.instanceVars.size}")
    println(
        "first name a second name b: ${cls.instanceVars[0].name == "a" && cls.instanceVars[1].name == "b"}"
    )

    println("member a ty is Int32: ${va.ty == IntType.getInt32()}")
    println("outer is class: ${va.outerDef == cls}")

    va.setReadOnly(true)
    println("a readonly: ${va.isReadOnly()}")

    va.setPublic()
    println("a public: ${va.isPublic()}")
    println("a str has name: ${va.toString().contains("a")}")

    vb.setInternal()
    println("b is internal: ${vb.isInternal()}")
}
