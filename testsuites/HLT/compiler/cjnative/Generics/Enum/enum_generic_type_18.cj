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
    Day(T)
}

class A {
    public var b: TimeUnit<Int32> = TimeUnit<Int32>.Day(14)
}

func run(): Int64 {
    var obj = A()
    var time = obj.b

    var res: Int32 = match (time) {
        case Day(x) => 2
    }

    if (res == 2) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
