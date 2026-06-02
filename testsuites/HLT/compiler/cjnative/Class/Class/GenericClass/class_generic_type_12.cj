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

func foo(x: Int32, y: Int32): Data<Int32> {
    var data: Data<Int32> = Data<Int32>(x, y)
    return data
}

main(): Int64 {
    let data: Data<Int32> = foo(3, 4)
    let res1: Int32 = data.x
    let res2: Int32 = data.y
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}
