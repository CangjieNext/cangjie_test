/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

class A <: Exception {}

main() {
    try {
        var a = throw A()
    } catch (_) {
    }
    return 0
}
// ASSERT: scan chir_dce_unreachable_expression_hint
// ASSERT: scan chir_dce_unused_variable
