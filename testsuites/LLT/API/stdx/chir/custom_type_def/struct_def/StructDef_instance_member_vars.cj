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
struct instanceVars empty: 0
after append count: 2
x ty is Int32: true
y ty is Bool: true
outer is struct: true
x readonly off: false
x readonly on: true
x str has let: true
y protected: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.struct.iv", AccessLevel.Public)
    let st = pkg.addStruct("mS", "S")

    println("struct instanceVars empty: ${st.instanceVars.size}")

    let vx = st.appendInstanceMemberVar("x", IntType.getInt32())
    let vy = st.appendInstanceMemberVar("y", BoolType.get())

    println("after append count: ${st.instanceVars.size}")
    println("x ty is Int32: ${vx.ty == IntType.getInt32()}")
    println("y ty is Bool: ${vy.ty == BoolType.get()}")
    println("outer is struct: ${vx.outerDef == st}")

    println("x readonly off: ${vx.isReadOnly()}")
    vx.setReadOnly(true)
    println("x readonly on: ${vx.isReadOnly()}")
    println("x str has let: ${vx.toString().contains("let")}")

    vy.setProtected()
    println("y protected: ${vy.isProtected()}")
}
