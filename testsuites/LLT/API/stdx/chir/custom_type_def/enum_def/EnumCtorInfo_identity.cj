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
ctor identifier: mTag
ctor srcCodeName: Tag
ctor toString: Tag
constructors size: 1
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.enum.ctorinfo.id", AccessLevel.Public)
    let ex = pkg.addEnum("mE", "E", true)

    let c = ex.appendEnumCtorInfo("mTag", "Tag", argTypes: Array<Type>())
    println("ctor identifier: ${c.identifier}")
    println("ctor srcCodeName: ${c.srcCodeName}")
    println("ctor toString: ${c.toString()}")
    println("constructors size: ${ex.constructors.size}")
}
