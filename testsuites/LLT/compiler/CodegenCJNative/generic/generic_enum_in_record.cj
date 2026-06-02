// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum TimeUnit<T> {
    Year(T) | Day(T)
}

struct Foo {
    public var time: TimeUnit<Int32> = TimeUnit<Int32>.Year(3)
    public var day: TimeUnit<Int32> = Day<Int32>(4)
}

func run(): Int64 {
    var foo: Foo = Foo()
    var res1: Int32 = match (foo.time) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    var res2: Int32 = match (foo.day) {
        case Year(x) => 2020
        case Day(x) => 16
    }
    if (res1 == 2020 && res2 == 16) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
