/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Day
}

func foo<T>(x: TimeUnit<T>): TimeUnit<T> {
    return x
}

func run(): Int64 {
    var time = foo<Int32>(TimeUnit<Int32>.Day)
    var res: Int32 = match (time) {
        case Day => 23
    }
    if (res == 23) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
