/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
    Day(T)
}

struct Data<T> {
    public let timeEnum: T
    public Data(x: T) {
        timeEnum = x
    }
}

func run(): Int64 {
    let time: TimeUnit<Int32> = TimeUnit<Int32>.Day(14)
    let data: Data<TimeUnit<Int32>> = Data<TimeUnit<Int32>>(time)
    var timeEnum: TimeUnit<Int32> = data.timeEnum
    var res: Int32 = match (timeEnum) {
        case Day(x) => 2
    }
    if (res == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
