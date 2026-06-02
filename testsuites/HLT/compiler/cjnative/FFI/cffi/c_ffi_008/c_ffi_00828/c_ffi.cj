/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



foreign {
    func add_func(a: Int8, b: Int8): Int8 {
        return a + b
    }

    func add_func(a: Int64, b: Int64): Int64 {
        return a + b + c
    }
}

main():Int64 {
    return 0
}
// ASSERT: scan parse_foreign_function_with_body
