/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args| compare %f
// ASSERT: regex test_38

main(): Int64 {
    let s1 = 10
    let s2 = 20
    let s3 = 7
    let s4 = "test_${s2 - s1 + s1 * s2 / s3}"
    print(s4)
    return 0
}
