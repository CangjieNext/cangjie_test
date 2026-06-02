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

struct test {
    public test(let aaa: TimeUnit) {}
}

func run(): Int64 {
    let obj = test(TimeUnit.Day(14))
    let bbb = obj.aaa

    var res: Int32 = match (bbb) {
        case Day(x) => x + 2
    }

    if (res == 16) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
