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
    public var dt: T
    public init(x: T) {
        dt = x
    }
}

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    let foo: Foo<String> = Foo<String>("hello")
    var time = Time.Day(foo)
    var res: String = match (time) {
        case Day(x) => x.dt
    }
    if (res == "hello") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
