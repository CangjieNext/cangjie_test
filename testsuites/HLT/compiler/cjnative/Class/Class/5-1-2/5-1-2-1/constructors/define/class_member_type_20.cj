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
    public let a: Int32
    public init(x: Int32) {
        a = x + 2
    }
}

class Test {
    public let c1: Foo = Foo(2)
    public let c2: Foo
    public init(x: Foo) {
        c2 = x
    }
    public func f(x: Foo): Foo {
        return x
    }
}

func run(): Int64 {
    var foo1: Foo = Foo(3)
    var foo2: Foo = Foo(4)
    var test: Test = Test(foo1)
    var res1: Foo = test.c1
    var res2: Foo = test.c2
    var res3: Foo = test.f(foo2)
    if (res1.a == 4 && res2.a == 5 && res3.a == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
