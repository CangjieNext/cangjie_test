// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct Data<T> {
    public init(x: T, y: T, z: T, w: T) {
        a = x
        i = y
        j = z
        k = w
    }
    public var a: T
    public var i: T
    public var j: T
    public var k: T
}

func run(): Int64 {
    var data: Data<Int32> = Data<Int32>(10, 20, 30, 40)
    if (data.a == 10 && data.i == 20 && data.j == 30 && data.k == 40) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
