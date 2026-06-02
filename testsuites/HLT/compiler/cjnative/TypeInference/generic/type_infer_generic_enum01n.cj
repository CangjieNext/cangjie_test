/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum TimeUnit1<T> {
    Year(T)
}

func run(): Int64 {
    var t0 = TimeUnit1<Int32>.Year(20)
    var t1: TimeUnit1<Int32> = TimeUnit1<Int64>.Year(20)
    var t2 = TimeUnit1<TimeUnit1<Int64>>.Year(t0)
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_mismatched_types
