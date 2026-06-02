/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    let c: Float16 = 2.5 * 0x4027333333333333

    if (c - 41314.652154156 > 0.000000001) {
        return 1
    }

    return 0
}
// ASSERT: scan sema_invalid_binary_expr
// ASSERT: scan sema_float_literal_too_small
