/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a: Float32 = 0.40129846E-45
    var b: Float32 = 3.41282347E38
    var c: Float32 = 1.40129846E-45
    var d: Float32 = 3.40282347E38
    a * b * c * d
    return 0
}
// ASSERT: scan sema_float_literal_too_small
// ASSERT: scan sema_float_literal_too_large
