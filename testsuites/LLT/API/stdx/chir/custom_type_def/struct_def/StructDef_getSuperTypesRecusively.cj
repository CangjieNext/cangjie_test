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
plain struct supers size: 0
struct extend adds IFS: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.struct.sups", AccessLevel.Public)

    let plain = pkg.addStruct("mS", "S")
    println("plain struct supers size: ${plain.getSuperTypesRecusively().size}")

    let ifs = pkg.addClass("IFS", "IFS", false)
    let st = pkg.addStruct("mP", "Point")
    let ext = pkg.addExtend("extPoint", st.ty)
    ext.implementedInterfaceTypes = [ifs.classType]
    st.extends = [ext]

    let sups = st.getSuperTypesRecusively()
    var hasIfs = false
    for (t in sups) {
        if (t == ifs.classType) {
            hasIfs = true
        }
    }
    println("struct extend adds IFS: ${hasIfs}")
}
