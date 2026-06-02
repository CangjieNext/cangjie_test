/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var b = 1
    let a = [1, 0]
    b = a[0.5]
    return b
}
// ASSERT: scan sema_parameters_and_arguments_mismatch
// ASSERT: scan sema_cannot_convert_literal
