/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test(): Int64 {
    let sum = {a: Int64, b: Int64 => a + b}
    var i: Int64 = 0
    return sum(i, i, i)
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_wrong_number_of_arguments
