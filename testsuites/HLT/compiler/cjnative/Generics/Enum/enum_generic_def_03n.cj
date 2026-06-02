/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



enum TimeUnit<T { 
    Year(T)
}

main(): Int64 {
    let time = TimeUnit<Int64>.Year(3)
    return 0
}
// ASSERT: scan parse_expected_right_delimiter
