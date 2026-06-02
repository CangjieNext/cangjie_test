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
    var foo1: Foo<Int32> = Foo<Int32>(1, 2)
    var foo2: Foo<Int32> = Foo<Int32>(3, 4)
    var foo3: Foo<Int32> = Foo<Int32>(5, 6)
    var listFoo: Array<Foo<Int32>> = [foo1, foo2, foo3]
    var foo3_1: Foo<Int32> = listFoo[2]
    var res1: Int32 = foo3_1.x
    var res2: Int32 = foo3_1.y
    if (res1 == 5 && res2 == 6) {
        return 0
    }
    return 1
}
