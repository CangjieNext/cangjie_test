/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    if (false) {
        if (return 1) {
            return 2
        } else {
            return 3
        }
    } else {
        if (return 4) {
            return 5
        } else {
            return 6
        }
    }
}

main(): Int64 {
    return test() - 4
}
// ASSERT: scan chir_dce_unreachable_expression_hint
