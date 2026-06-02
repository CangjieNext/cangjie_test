/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum TimeUnit1<T> {
    Year(T)
}

func run(): Int64 {
    var t0: TimeUnit1<Int32> = TimeUnit1<Int32>.Year(20)
    return 0
}

main(): Int64 {
    return run()
}
