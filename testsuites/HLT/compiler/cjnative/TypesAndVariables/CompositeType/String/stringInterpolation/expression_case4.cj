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
// ASSERT: regex test_hello world

main(): Int64 {
    let s1 = 3
    let s3 = 2
    let s4: String = "hello world"
    let s5: String = "new world"
    let s2 = "test_${if (s1 >= s3) { s4 } else { s5 }}"
    print(s2)
    return 0
}
