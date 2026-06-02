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

func run(): Int64 {
    var foo: Foo<Int32> = Foo<Int32>(1, 2)
    var tup: (Int32, Foo<Int32>) = (1, foo)
    var getFoo: Foo<Int32> = tup[1]
    var res1: Int32 = getFoo.x
    var res2: Int32 = getFoo.y
    var res3: Int32 = tup[0]
    if (res1 == 1 && res2 == 2 && res3 == 1) {
        return 0
    }
    return 1
}
