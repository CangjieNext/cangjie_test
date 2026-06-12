/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// OverflowStrategy、UnaryExprKind、BinaryExprKind 公开枚举 toString

/* SCAN
OverflowStrategy count ok: true
Unary kinds: Neg Not BitNot
Binary has Add And: true true
*/

import stdx.chir.*

main() {
    let os = OverflowStrategy.NA.toString() != String.empty &&
        OverflowStrategy.Throwing.toString() != String.empty &&
        OverflowStrategy.Saturating.toString() != String.empty &&
        OverflowStrategy.Wrapping.toString() != String.empty
    println("OverflowStrategy count ok: ${os}")
    println("Unary kinds: ${UnaryExprKind.Neg} ${UnaryExprKind.Not} ${UnaryExprKind.BitNot}")
    println(
        "Binary has Add And: ${BinaryExprKind.Add.toString().contains("Add")} ${BinaryExprKind.And.toString().contains("And")}"
    )
}
