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
customAnnoInstances empty: 0
customAnnoInstances size after set: 1
annotation class name: FlagAnno
annotation str has At: true
anno field kind: flag flag
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.enum.ctorinfo.anno", AccessLevel.Public)
    let ex = pkg.addEnum("mColor", "Color", true)

    let nullary = ex.appendEnumCtorInfo("mNone", "None", argTypes: Array<Type>())
    println("customAnnoInstances empty: ${nullary.customAnnoInstances.size}")

    let flag = CustomAnnoInstance("FlagAnno")
    nullary.customAnnoInstances = Array<CustomAnnoInstance>(1, { _ => flag })
    println("customAnnoInstances size after set: ${nullary.customAnnoInstances.size}")
    println("annotation class name: ${nullary.customAnnoInstances[0].classSrcCodeName}")
    println("annotation str has At: ${nullary.customAnnoInstances[0].toString().contains("@")}")

    let ann0 = nullary.customAnnoInstances[0]
    let args = Array<String>(2, repeat: "flag")
    ann0.argValues = args
    if (let fs <- ann0.argValues && fs.size == 2) {
        println("anno field kind: ${fs[0]} ${fs[1]}")
    } else {
        println("anno field kind: missing")
    }
}
