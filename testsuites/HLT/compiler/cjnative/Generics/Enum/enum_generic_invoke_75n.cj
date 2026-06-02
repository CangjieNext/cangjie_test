/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

enum Time<T1, T2> {
    Day(T1) | Hour(T2)
}

func run(): Int64 {
    var time = Time<Int32>.Day("string")
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_generic_argument_no_match
