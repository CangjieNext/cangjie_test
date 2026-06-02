/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
func test(): Int32 {
    let sum = {a: Int32, b: Int32 => a + b}
    var i: Int8 = 0
    return sum(i, i)
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_mismatched_types
