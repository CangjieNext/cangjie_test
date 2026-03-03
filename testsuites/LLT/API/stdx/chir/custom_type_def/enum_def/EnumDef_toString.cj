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
enum str has enum kw: true
enum str has ctor Red: true
nonexh str has ellipsis: true
enum str has brace: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.enum.str", AccessLevel.Public)
    let color = pkg.addEnum("mColor", "Color", true)
    color.appendEnumCtorInfo("mRed", "Red", argTypes: Array<Type>())
    let flags = pkg.addEnum("mFlags", "Flags", false)
    flags.appendEnumCtorInfo("mA", "A", argTypes: Array<Type>())

    let cs = color.toString()
    let fs = flags.toString()
    println("enum str has enum kw: ${cs.contains("enum")}")
    println("enum str has ctor Red: ${cs.contains("Red")}")
    println("nonexh str has ellipsis: ${fs.contains("...")}")
    println("enum str has brace: ${cs.contains("{")}")
}
