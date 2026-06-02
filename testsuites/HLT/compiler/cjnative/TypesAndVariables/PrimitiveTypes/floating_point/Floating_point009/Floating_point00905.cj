/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var a: Float64 = 1.9406564584124654E-32400
    var b: Float64 = 1.7976931348623157E30800
    a ** b
    return 0
}
// ASSERT: scan sema_float_literal_too_small
// ASSERT: scan sema_float_literal_too_large
