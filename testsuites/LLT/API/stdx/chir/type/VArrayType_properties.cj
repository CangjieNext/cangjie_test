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
varr size 5: true
varr elt Int32: true
varr eq: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let v1 = VArrayType.get(i32, 5)
    let v2 = VArrayType.get(i32, 5)
    println("varr size 5: ${v1.size == 5}")
    println("varr elt Int32: ${v1.elementType == i32}")
    println("varr eq: ${v1 == v2}")
}
