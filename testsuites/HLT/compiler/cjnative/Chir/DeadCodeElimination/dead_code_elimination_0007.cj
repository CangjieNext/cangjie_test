/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler  %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

var num = 0

func test(a: Int64, b: Nothing, c: Int64) {
    num = 1
}

main() {
    test(1, return num, 2)
    return 1
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir2_dce_unreachable_expression
