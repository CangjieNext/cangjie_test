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
name: pkg.chir.demo
access: public
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.chir.demo", AccessLevel.Public)
    println("name: ${pkg.name}")
    println("access: ${pkg.accessLevel.toString()}")
}
