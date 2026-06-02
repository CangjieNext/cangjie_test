/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

class C1 {
    public let test: Int64 = 1
    public let lambda: (Int64) -> Int64 = {i: Int64 => test - i}
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_illegal_usage_of_member
