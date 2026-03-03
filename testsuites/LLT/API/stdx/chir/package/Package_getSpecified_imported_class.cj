/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// addImportedClass 后，用 getSpecifiedClassDef(声明包名, 源码名) 命中导入类

/* SCAN
getSpecified imported class: ImpClsSpec
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.chir.gsic", AccessLevel.Public)
    let foreignPkg = "foreign.pkg.spec.cls"
    pkg.addImportedClass("iClsSpec", "ImpClsSpec", foreignPkg, true)

    if (let Some(c) <- pkg.getSpecifiedClassDef(foreignPkg, "ImpClsSpec")) {
        println("getSpecified imported class: ${c.srcCodeName}")
    } else {
        println("getSpecified imported class: fail")
    }
}
