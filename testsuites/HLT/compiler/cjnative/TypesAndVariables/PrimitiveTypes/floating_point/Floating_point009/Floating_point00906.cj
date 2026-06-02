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

func test1(): Float16 {
    5.950464477539063E-8
}

func test2(): Float16 {
    6.5604E4
}

main(): Int64 {
    test1() * test2()
    return 0
}
// ASSERT: scan sema_float_literal_too_small
// ASSERT: scan sema_float_literal_too_large
