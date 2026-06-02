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
    Year(T) | Day(T)
}

interface I<T> {
    func foo(x: TimeUnit<T>): TimeUnit<T>
}

class Foo <: I<Int32> {
    public func foo(x: TimeUnit<Int32>): TimeUnit<Int32> {
        return x
    }
}

func run(): Int64 {
    var time = Foo().foo(TimeUnit<Int32>.Year(3))
    let res: Int32 = match (time) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    if (res == 2020) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
