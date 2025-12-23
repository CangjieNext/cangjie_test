/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 2.400000f32 ** 2.400000f32, left operand expression is of type Float32, right operand expression is of type Float32.
// EXEC-PIPE-1: %compiler main.cj %cmp_opt 2>&1 | compare %f
// ASSERT: scan sema_invalid_binary_expr

package packageA

main(): Unit {
    let _ = 2.400000f32 ** 2.400000f32
}
