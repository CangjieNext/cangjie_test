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
member customAnnoInstances empty: 0
after anno size: 1
anno class: StructFieldAnno
anno str has At: true
field kind value: tag tag
outer is struct: true
instance vars: 2
second member anno size: 0
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.struct.anno", AccessLevel.Public)
    let st = pkg.addStruct("mS", "Point")

    let x = st.appendInstanceMemberVar("x", IntType.getInt32())
    println("member customAnnoInstances empty: ${x.customAnnoInstances.size}")

    let a = CustomAnnoInstance("StructFieldAnno")
    let args = Array<String>(2, repeat: "tag")
    a.argValues = args
    x.customAnnoInstances = Array<CustomAnnoInstance>(1, { _ => a })

    println("after anno size: ${x.customAnnoInstances.size}")
    println("anno class: ${x.customAnnoInstances[0].classSrcCodeName}")
    println("anno str has At: ${x.customAnnoInstances[0].toString().contains("@")}")
    if (let fs <- x.customAnnoInstances[0].argValues) {
        println("field kind value: ${fs[0]} ${fs[1]}")
    } else {
        println("field kind value: missing")
    }

    println("outer is struct: ${x.outerDef == st}")

    let y = st.appendInstanceMemberVar("y", IntType.getInt32())
    println("instance vars: ${st.instanceVars.size}")
    println("second member anno size: ${y.customAnnoInstances.size}")
}
