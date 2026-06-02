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

class Foo<T> {
    public var x: T
    public var y: T
    public init(a: T, b: T) {
        x = a
        y = b
    }
}

func run(): Int64 {
    var foo: Foo<Int32> = Foo<Int32>(1, 2)
    var mapFoo: HashMap<Int32, Foo<Int32>> = HashMap<Int32, Foo<Int32>>([(1, foo), (2, foo)])
    var foo2o = mapFoo.get(2)
    var foo2 = match (foo2o) {
        case Some(x) => x
        case _ => Foo<Int32>(0, 0)
    }
    var res1: Int32 = foo2.x
    var res2: Int32 = foo2.y
    if (res1 == 1 && res2 == 2) {
        return 0
    }
    return 1
}
