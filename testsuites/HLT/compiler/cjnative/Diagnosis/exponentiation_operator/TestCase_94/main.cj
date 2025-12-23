/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 2.400000f64 ** 2i64, left operand expression is of type Float64, right operand expression is of type Int64.
// EXEC: %compiler main.cj %cmp_opt

package packageA

main(): Unit {
    let _ = 2.400000f64 ** 2i64
}
