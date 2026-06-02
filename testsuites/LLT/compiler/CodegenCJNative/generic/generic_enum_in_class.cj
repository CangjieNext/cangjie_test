// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum TimeUnit<T> {
    Hour
}

class Foo<T> {
    public var hour: TimeUnit<T>
    public init() {
        hour = TimeUnit<T>.Hour
    }
    public func f(x: TimeUnit<T>): TimeUnit<T> {
        return x
    }
}

func run(): Int64 {
    var foo: Foo<Int32> = Foo<Int32>()
    var time1 = foo.hour
    var time2 = foo.f(TimeUnit<Int32>.Hour)
    var res1: Int32 = match (time1) {
        case Hour => 11
    }
    var res2: Int32 = match (time2) {
        case Hour => 12
    }
    if (res1 == 11 && res2 == 12) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
