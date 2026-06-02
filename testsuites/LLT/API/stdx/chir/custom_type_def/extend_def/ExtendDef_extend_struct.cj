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
extend struct ty: true
extended isStructType: true
extendDefs: 1
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.extend.struct", AccessLevel.Public)
    let st = pkg.addStruct("mP", "Point")
    let ext = pkg.addExtend("extPoint", st.ty)

    println("extend struct ty: ${ext.extendedType == st.ty}")
    println("extended isStructType: ${ext.extendedType.isStructType()}")
    println("extendDefs: ${pkg.extendDefs.size}")
}
