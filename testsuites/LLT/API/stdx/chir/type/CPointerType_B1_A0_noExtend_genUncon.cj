/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 矩阵：B1 泛型无约束 × A0 不挂 extend

/* SCAN
B1_A0 upper empty: 0
B1_A0 super count: 0
*/

import stdx.chir.*

main() {
    let g = GenericType.get("idB1A0", "T")
    println("B1_A0 upper empty: ${g.upperBounds.size}")
    let cp = CPointerType.get(g)
    println("B1_A0 super count: ${cp.getSuperTypesRecusively().size}")
}
