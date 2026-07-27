/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// RawArrayType.get / VArrayType.get：同 elementType 下第二维/尺寸走 cache 未命中创建

/* SCAN
ra dims 3: true
va size 7: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let _ = RawArrayType.get(i32, 1u32)
    let ra2 = RawArrayType.get(i32, 3u32)
    let _ = VArrayType.get(i32, 2)
    let va2 = VArrayType.get(i32, 7)
    println("ra dims 3: ${ra2.dims == 3}")
    println("va size 7: ${va2.size == 7}")
}
