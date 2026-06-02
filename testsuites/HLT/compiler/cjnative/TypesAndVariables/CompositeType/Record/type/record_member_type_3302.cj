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

interface Foo<T> {
    func x(): Int32 {
        3
    }
}

class B<T> <: Foo<T> {}

struct Test {
    public let a: Foo<Int32>
    public init(x: Foo<Int32>) {
        a = x
    }
}

func run(): Int64 {
    let res = Test(B<Int32>())
    let foo = res.a
    let res1 = foo.x()
    if (res1 == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
