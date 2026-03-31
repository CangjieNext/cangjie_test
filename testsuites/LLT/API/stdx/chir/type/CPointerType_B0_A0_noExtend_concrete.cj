/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 矩阵：B0 具体元素类型 × A0 不挂 extend → 递归父类型为空

/* SCAN
B0_A0 super count: 0
*/

import stdx.chir.*

main() {
    let cp = CPointerType.get(IntType.getInt32())
    println("B0_A0 super count: ${cp.getSuperTypesRecusively().size}")
}
