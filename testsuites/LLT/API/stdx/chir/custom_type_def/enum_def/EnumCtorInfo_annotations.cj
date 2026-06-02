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
annotations empty: 0
annotations size after set: 1
annotation class name: FlagAnno
annotation str has At: true
anno field kind: flag flag
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.enum.ctorinfo.anno", AccessLevel.Public)
    let ex = pkg.addEnum("mColor", "Color", true)

    let nullary = ex.appendEnumCtorInfo("mNone", "None", argTypes: Array<Type>())
    println("annotations empty: ${nullary.annotations.size}")

    let flag = Annotation("FlagAnno")
    nullary.annotations = Array<Annotation>(1, { _ => flag })
    println("annotations size after set: ${nullary.annotations.size}")
    println("annotation class name: ${nullary.annotations[0].classSrcCodeName}")
    println("annotation str has At: ${nullary.annotations[0].toString().contains("@")}")

    let ann0 = nullary.annotations[0]
    let args = Array<String>(2, repeat: "flag")
    ann0.argValues = args
    if (let fs <- ann0.argValues && fs.size == 2) {
        println("anno field kind: ${fs[0]} ${fs[1]}")
    } else {
        println("anno field kind: missing")
    }
}
