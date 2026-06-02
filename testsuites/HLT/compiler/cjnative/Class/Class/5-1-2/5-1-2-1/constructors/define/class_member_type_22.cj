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

interface I {
    func y(): Int32
}

class Foo1 <: I {
    public func y(): Int32 {
        4
    }
}

class Foo2 <: I {
    public func y(): Int32 {
        5
    }
}

class Foo3 <: I {
    public func y(): Int32 {
        6
    }
}

class Test {
    public var a: I = Foo1()
    public var b: I
    public init(x: I) {
        b = x
    }
    public func f(x: I): I {
        return x
    }
}

func run(): Int64 {
    var test: Test = Test(Foo2())
    var res1: I = test.a // Foo1()
    var res2: I = test.b // Foo2()
    var res3: I = test.f(Foo3()) // Foo3()
    if (res1.y() == 4 && res2.y() == 5 && res3.y() == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
