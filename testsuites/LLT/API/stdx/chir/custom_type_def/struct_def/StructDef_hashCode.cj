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
struct hash stable: true
struct hash eq id hash: true
s1 s2 hash differ: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.struct.hash", AccessLevel.Public)
    let s1 = pkg.addStruct("mS", "S")
    let s2 = pkg.addStruct("mT", "T")

    println("struct hash stable: ${s1.hashCode() == s1.hashCode()}")
    println("struct hash eq id hash: ${s1.hashCode() == s1.identifier.hashCode()}")
    println("s1 s2 hash differ: ${s1.hashCode() != s2.hashCode()}")
}
