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

class Data<T> {
    public let width: T
    public let length: T
    public init(x: T, y: T) {
        width = x
        length = y
    }
}

class Foo {
    public var i1: Int32 = 4
    public var i2: Int32 = 6
    public var data: Data<Int32> = Data<Int32>(i1, i2)
}

func run(): Int64 {
    var foo: Foo = Foo()
    var data: Data<Int32> = foo.data
    var width: Int32 = data.width
    var length: Int32 = data.length
    if (width == 4 && length == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
