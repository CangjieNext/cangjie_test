/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test(): Int64 {
    const sum = {a: Int64, b: Int64 => a + b}
    var i: Int64 = 0
    const a = sum(i, 1)
    return sum(i, 1)
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_expect_const
