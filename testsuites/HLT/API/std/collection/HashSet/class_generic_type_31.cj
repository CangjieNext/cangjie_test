/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    return run()
}

class Foo<T> <: Hashable & Equatable<Foo<T>> {
    public var x: T
    public var y: T
    public init(a: T, b: T) {
        x = a
        y = b
    }

    public operator func !=(b: Foo<T>) {
        true
    }

    public operator func ==(b: Foo<T>) {
        false
    }

    public func hashCode(): Int64 {
        return 0
    }
}

func run(): Int64 {
    var foo1: Foo<Int32> = Foo<Int32>(1, 2)
    var foo2: Foo<Int32> = Foo<Int32>(3, 4)
    var setFoo: HashSet<Foo<Int32>> = HashSet<Foo<Int32>>([foo1, foo2])
    // var foo: Foo<Int32>
    for (foo in setFoo) {
        foo1 = foo
    }
    var res1: Int32 = foo1.x
    var res2: Int32 = foo1.y
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}
