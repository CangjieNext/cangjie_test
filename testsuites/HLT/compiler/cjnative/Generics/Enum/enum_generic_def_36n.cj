/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f




enum TimeUnit<T> {
    Year<T>(T) | Day(T)
}

func run(): Int64 {
    var year = TimeUnit<Int32, Int64, String>.Year<Int32>(2)
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_expected_decl
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_expected_character
