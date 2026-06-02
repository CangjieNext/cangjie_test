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
    public let foo: Foo<Int32>
    public init(x: Foo<Int32>) {
        foo = x
    }
}

func run(): Int64 {
    var i: Int32 = 3
    let test = Test(Foo<Int32>(i))
    var foo = test.foo
    let res = foo.x
    if (res == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
