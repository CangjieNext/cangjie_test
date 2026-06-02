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
    public var x: T
    public var y: T
    public init(a: T, b: T) {
        x = a
        y = b
    }
}

class Foo {
    public var data: Data<Int32> = Data<Int32>(3, 4)
}

main(): Int64 {
    var foo: Foo = Foo()
    var data: Data<Int32> = foo.data
    var res1: Int32 = data.x
    var res2: Int32 = data.y
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}
