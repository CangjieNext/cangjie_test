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
member annotations empty: 0
after anno size: 1
anno class: StructFieldAnno
anno str has At: true
field kind value: tag
outer is struct: true
instance vars: 2
second member anno size: 0
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.struct.anno", AccessLevel.Public)
    let st = pkg.addStruct("mS", "Point")

    let x = st.appendInstanceMemberVar("x", IntType.getInt32())
    println("member annotations empty: ${x.annotations.size}")

    let a = Annotation("StructFieldAnno")
    a.setFieldValue("kind", "tag")
    x.annotations = Array<Annotation>(1, { _ => a })

    println("after anno size: ${x.annotations.size}")
    println("anno class: ${x.annotations[0].classSrcCodeName}")
    println("anno str has At: ${x.annotations[0].toString().contains("@")}")
    if (let Some(v) <- x.annotations[0].getFieldValue("kind")) {
        println("field kind value: ${v}")
    } else {
        println("field kind value: missing")
    }

    println("outer is struct: ${x.outerDef == st}")

    let y = st.appendInstanceMemberVar("y", IntType.getInt32())
    println("instance vars: ${st.instanceVars.size}")
    println("second member anno size: ${y.annotations.size}")
}
