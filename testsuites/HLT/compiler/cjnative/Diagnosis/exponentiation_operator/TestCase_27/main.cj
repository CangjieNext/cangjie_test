/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 2i32 ** 2u32, left operand expression is of type Int32, right operand expression is of type UInt32.
// EXEC-PIPE-1: %compiler main.cj %cmp_opt 2>&1 | compare %f
// ASSERT: scan sema_invalid_binary_expr

package packageA

main(): Unit {
    let _ = 2i32 ** 2u32
}
