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
    public var data: T
    public init(data1: T) {
        data = data1
    }
}

class Data<T> {
    public let count: T
    public init(x: T) {
        count = x
    }
}

type Fo<T> = Foo<T>

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>(3)
    var foo: Foo<Data<Int32>> = Foo<Data<Int32>>(data)
    var res: Int32 = foo.data.count
    if (res == 3) {
        return 0
    }
    return 1
}
