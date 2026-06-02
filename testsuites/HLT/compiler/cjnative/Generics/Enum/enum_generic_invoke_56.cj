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

func getTime<V>(x: V): V {
    return x
}

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    var time = Time<(Int32) -> Int32>.Day(getTime<Int32>)
    var res: Int32 = match (time) {
        case Day(x) => x(3)
    }
    if (res == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
