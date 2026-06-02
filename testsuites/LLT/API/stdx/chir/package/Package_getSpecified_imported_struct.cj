/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// addImportedStruct 后，用 getSpecifiedStructDef 命中导入 struct

/* SCAN
getSpecified imported struct: ImpStSpec
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.chir.gsis", AccessLevel.Public)
    let foreignPkg = "foreign.pkg.spec.st"
    pkg.addImportedStruct("iStSpec", "ImpStSpec", foreignPkg)

    if (let Some(s) <- pkg.getSpecifiedStructDef(foreignPkg, "ImpStSpec")) {
        println("getSpecified imported struct: ${s.srcCodeName}")
    } else {
        println("getSpecified imported struct: fail")
    }
}
