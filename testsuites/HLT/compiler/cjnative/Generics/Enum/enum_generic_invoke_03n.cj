/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum TimeUnit<T> {
    Year(T) | Month(T)
}

var i: Int64 = 4
var time = TimeUnit<Int32>.Year(i)
var res1: Int32 = match (time) {
    case Year(x) => 2020
    case Month(x) => 9
}

func run(): Int64 {
    if (res1 == 2020) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_mismatched_types
