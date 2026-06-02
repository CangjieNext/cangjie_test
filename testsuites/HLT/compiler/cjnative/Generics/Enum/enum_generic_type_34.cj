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

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    var time = Time<Int32>.Day(2)
    var tup: (Int32, Time<Int32>) = (1, time)
    var getTime: Time<Int32> = tup[1]
    var res: Int32 = match (getTime) {
        case Day(x) => x + 2
    }
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
