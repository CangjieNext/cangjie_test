/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

func add_func(a: Int8, b: Int8): Int8 {
    return a + b
}

@C
func add_func(a: Int8, b: Int8, c: Int8): Int8 {
    return a + b + c
}

main(): Int64 {
    return 0
}
// ASSERT: regex-not no position error occurred
