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
    public var a: T
    public init(a1: T) {
        a = a1
    }
}

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    var foo: Foo<Rune> = Foo<Rune>(r'a')
    var time: Time<Foo<Rune>> = Time<Foo<Rune>>.Day(foo)
    var res: String = match (time) {
        case Day(x) => x.a.toString()
    }
    if (res == "a") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
