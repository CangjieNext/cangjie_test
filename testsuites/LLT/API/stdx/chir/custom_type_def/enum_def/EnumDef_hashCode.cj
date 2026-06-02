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
enum hash stable: true
enum hash eq id hash: true
color flags hash differ: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.enum.hash", AccessLevel.Public)
    let color = pkg.addEnum("mColor", "Color", true)
    color.appendEnumCtorInfo("mRed", "Red", argTypes: Array<Type>())
    let flags = pkg.addEnum("mFlags", "Flags", false)
    flags.appendEnumCtorInfo("mA", "A", argTypes: Array<Type>())

    println("enum hash stable: ${color.hashCode() == color.hashCode()}")
    println("enum hash eq id hash: ${color.hashCode() == color.identifier.hashCode()}")
    println("color flags hash differ: ${color.hashCode() != flags.hashCode()}")
}
