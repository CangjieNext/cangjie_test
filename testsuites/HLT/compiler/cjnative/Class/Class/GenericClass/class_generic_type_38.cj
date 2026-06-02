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

struct Data<T> {
    public var foo: T
    public init(foo1: T) {
        foo = foo1
    }
}

func run(): Int64 {
    let foo: Foo<Int32> = Foo<Int32>(1, 2)
    var foo2: Data<Foo<Int32>> = Data<Foo<Int32>>(foo)
    var getFoo: Foo<Int32> = foo2.foo
    var res1: Int32 = getFoo.x
    var res2: Int32 = getFoo.y
    if (res1 == 1 && res2 == 2) {
        return 0
    }
    return 1
}
