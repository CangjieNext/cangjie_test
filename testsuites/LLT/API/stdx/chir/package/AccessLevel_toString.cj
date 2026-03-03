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
internal
protected
public
eq same: true
eq diff: false
*/

import stdx.chir.*

main() {
    println(AccessLevel.Internal.toString())
    println(AccessLevel.Protected.toString())
    println(AccessLevel.Public.toString())
    println("eq same: ${AccessLevel.Public == AccessLevel.Public}")
    println("eq diff: ${AccessLevel.Public == AccessLevel.Internal}")
}
