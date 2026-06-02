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

class Foo<T> {
    public var data: T
    public init(data1: T) {
        data = data1
    }
}

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    let time = Time<Int32>.Day(3)
    var foo: Foo<Time<Int32>> = Foo<Time<Int32>>(time)
    var res: Int32 = match (foo.data) {
        case Day(x) => x + 1
    }
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
