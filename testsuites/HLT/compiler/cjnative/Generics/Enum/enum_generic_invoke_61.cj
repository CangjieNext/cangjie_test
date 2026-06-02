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

class Foo {
    public var dt: Int32 = 2
}

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    var foo: Foo = Foo()
    var time: Time<Foo> = Time<Foo>.Day(foo)
    var res: Int32 = match (time) {
        case Day(x) => x.dt + 2
    }
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
