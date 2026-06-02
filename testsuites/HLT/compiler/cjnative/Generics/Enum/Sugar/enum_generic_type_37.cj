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

interface I<T> {
    func getTime(): T
}

class Foo <: I<Time<Int64>> {
    public func getTime(): Time<Int64> {
        Time<Int64>.Day(4)
    }
}

func run(): Int64 {
    var time = Foo().getTime()
    var res = match (time) {
        case Day(x) => x + 1
    }
    if (res == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
