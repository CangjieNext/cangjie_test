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
    public let a: T
    public init(x: T) {
        a = x
    }
}

class Test {
    public let c1: Foo<Int32> = Foo<Int32>(2)
    public let c2: Foo<Int32>
    public init(x: Foo<Int32>) {
        c2 = x
    }
    public func f(x: Foo<Int32>): Foo<Int32> {
        return x
    }
}

func run(): Int64 {
    var foo1: Foo<Int32> = Foo<Int32>(3)
    var foo2: Foo<Int32> = Foo<Int32>(4)
    var test: Test = Test(foo1)
    var res1: Foo<Int32> = test.c1
    var res2: Foo<Int32> = test.c2
    var res3: Foo<Int32> = test.f(foo2)
    if (res1.a == 2 && res2.a == 3 && res3.a == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
