/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test(a: Int8): Int64 {
    1
}

func test(a: Int16): Int64 {
    2
}

main(): Int64 {
    test(1)
    return 0
}
// ASSERT: scan sema_ambiguous_match
