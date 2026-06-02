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

enum TimeUnit {
    Day(Int32)
}

struct Test {
    public func f(x: TimeUnit): TimeUnit {
        return x
    }
}

let res = Test()
var time = res.f(TimeUnit.Day(14))
var res1: Int32 = match (time) {
    case Day(x) => 2
}

func run(): Int64 {
    if (res1 == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
