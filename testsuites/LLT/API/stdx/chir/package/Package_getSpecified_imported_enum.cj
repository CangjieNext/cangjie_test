/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// addImportedEnum 后，用 getSpecifiedEnumDef 命中导入 enum

/* SCAN
getSpecified imported enum: ImpEnSpec
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.chir.gsie", AccessLevel.Public)
    let foreignPkg = "foreign.pkg.spec.en"
    pkg.addImportedEnum("iEnSpec", "ImpEnSpec", foreignPkg, false)

    if (let Some(en) <- pkg.getSpecifiedEnumDef(foreignPkg, "ImpEnSpec")) {
        println("getSpecified imported enum: ${en.srcCodeName}")
    } else {
        println("getSpecified imported enum: fail")
    }
}
