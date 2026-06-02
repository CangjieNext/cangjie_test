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
pkg protected init: true
pkg internal init: true
*/

import stdx.chir.*

main() {
    println("pkg protected init: ${Package("p2", AccessLevel.Protected).accessLevel == AccessLevel.Protected}")
    println("pkg internal init: ${Package("p3", AccessLevel.Internal).accessLevel == AccessLevel.Internal}")
}
