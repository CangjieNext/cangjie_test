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

main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo()
    if (res == 1) {
        return 0
    }
    return 1
}

enum Day {
    Monday | Tuesday
}

func Foo(a!: Day = Day.Monday) {
    var res: Int64 = match (a) {
        case Monday => 1
        case Tuesday => 2
    }
    return res
}
