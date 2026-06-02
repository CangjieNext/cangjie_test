/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f

func test(): Int64 {
    var sum: (Int32) -> Int32
    sum = {a: Int32, b: Int32 => a + b}
    return 1
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_mismatched_types
