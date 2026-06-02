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
raw dims 2: true
raw elt Int32: true
raw eq: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let r1 = RawArrayType.get(i32, 2)
    let r2 = RawArrayType.get(i32, 2)
    println("raw dims 2: ${r1.dims == 2}")
    println("raw elt Int32: ${r1.elementType == i32}")
    println("raw eq: ${r1 == r2}")
}
