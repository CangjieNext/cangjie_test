/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

main() {
    var a = (1, 2, return 0, return 1, 3)
    return 2
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_dce_unreachable_expression_hint
