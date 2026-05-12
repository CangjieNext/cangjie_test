/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

main(): Int64 {
    let a: Float32 = 32767.8
    let b = a - 340000000000000000000000000000000000001e308

    return 0
}
// ASSERT: scan sema_float_literal_too_large
// (not iOS) ASSERT: scan chir_dce_unused_function
// ASSERT: scan chir_dce_unused_variable
