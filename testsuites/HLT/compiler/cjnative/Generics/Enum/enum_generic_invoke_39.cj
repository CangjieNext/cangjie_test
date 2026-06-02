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
    var i: Float16 = 6.104e-5
    var time = Time<Float16>.Day(i)
    var res = match (time) {
        case Day(x) => x
    }
    if (res == 6.104e-5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
