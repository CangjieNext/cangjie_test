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

struct Data {
    public var x: Int32 = 1
    public var y: Int32 = 2
    public init(a: Int32, b: Int32) {
        x = a
        y = b
    }
}

interface Add<T> {
    operator func +(right: T): T
}

extend Data <: Add<Data> {
    public operator func +(right: Data): Data {
        Data(this.x + right.x, this.y + right.y)
    }
}

func run(): Int64 {
    var data1: Data = Data(3, 2)
    var data2: Data = Data(3, 2)
    var data3 = data1 + data2
    let res1: Int32 = data3.x
    let res2: Int32 = data3.y
    if (res1 == 6 && res2 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
