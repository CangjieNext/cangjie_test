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
    public var a: Int32 = 4
}

class Data<T> {
    public let count: T
    public init(x: T) {
        count = x
    }
    public func getFoo<V>(x: Foo<V>): Foo<V> {
        return Foo<V>()
    }
}

func run(): Int64 {
    let foo: Foo<Int32> = Foo<Int32>()
    var data: Data<Int32> = Data<Int32>(3)
    var foo2: Foo<Int32> = data.getFoo<Int32>(foo)
    var res: Int32 = foo2.a
    if (res == 4) {
        return 0
    }
    return 1
}
