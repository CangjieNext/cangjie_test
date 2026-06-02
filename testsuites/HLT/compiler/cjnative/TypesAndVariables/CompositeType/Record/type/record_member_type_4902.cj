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
    public let x: T
    public init(a: T) {
        x = a
    }
}

struct Test {
    public func f(x: Foo<Int32>): Foo<Int32> {
        return x
    }
}

let res = Test()
var i: Int32 = 3
var foo = res.f(Foo<Int32>(i))
let res1 = foo.x

func run(): Int64 {
    if (res1 == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
