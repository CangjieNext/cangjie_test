/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Package.packageInitFunc / packageLiteralInitFunc 默认均为 None

/* SCAN
packageInitFunc none: true
packageLiteralInitFunc none: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.chir.init", AccessLevel.Public)
    println("packageInitFunc none: ${pkg.packageInitFunc.isNone()}")
    println("packageLiteralInitFunc none: ${pkg.packageLiteralInitFunc.isNone()}")
}
