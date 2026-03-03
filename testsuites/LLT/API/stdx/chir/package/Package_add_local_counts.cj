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
after adds local: 1 1 1 1
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.chir.local", AccessLevel.Public)
    pkg.addClass("mCls", "LocalClass", true)
    pkg.addStruct("mSt", "LocalStruct")
    pkg.addEnum("mEn", "LocalEnum", true)
    pkg.addExtend("mExt", IntType.getInt32())
    println(
        "after adds local: ${pkg.classDefs.size} ${pkg.structDefs.size} ${pkg.enumDefs.size} ${pkg.extendDefs.size}"
    )
}
