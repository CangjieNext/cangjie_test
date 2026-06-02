/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Foo<T> {
    public var opt: Option<T> = Option<T>.None
    public init(x: Option<T>) {
        opt = x
    }
    public func f(x: Option<T>): Option<T> {
        return x
    }
}

func run(): Int64 {
    var foo1: Foo<Int32> = Foo<Int32>(Option<Int32>.Some(2))
    var foo2: Foo<Int32> = Foo<Int32>(Option<Int32>.None)
    var opt1 = foo1.opt
    var opt2 = foo1.f(Option<Int32>.Some(3))
    var opt3 = foo2.opt
    var opt4 = foo2.f(Option<Int32>.None)
    var res1: Int32 = match (opt1) {
        case Some(x) => x
        case None => -1
    }
    var res2: Int32 = match (opt2) {
        case Some(x) => x
        case None => -1
    }
    var res3: Int32 = match (opt3) {
        case Some(x) => x
        case None => -1
    }
    var res4: Int32 = match (opt4) {
        case Some(x) => x
        case None => -2
    }

    if (res1 == 2 && res2 == 3 && res3 == -1 && res4 == -2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
