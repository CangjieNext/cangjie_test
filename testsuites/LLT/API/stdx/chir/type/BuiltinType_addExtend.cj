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
builtin super after extend: 0
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.bext", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let ext = pkg.addExtend("extOnI32", i32)
    i32.addExtend(ext)
    println("builtin super after extend: ${i32.getSuperTypesRecusively().size}")
}
