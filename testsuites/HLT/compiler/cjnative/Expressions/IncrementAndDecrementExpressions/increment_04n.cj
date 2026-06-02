/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// 自增减表达式是unit类型，不是计算之后的值
main(): Int64 {
    return Int64(run())
}

func run(): Int32 {
    var i: Int32 = 1
    var j: Int32 = 0
    j = i--
    return j
}
// ASSERT: scan sema_mismatched_types
