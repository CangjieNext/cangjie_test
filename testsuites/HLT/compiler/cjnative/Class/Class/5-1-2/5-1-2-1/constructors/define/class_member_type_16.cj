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

struct Data {
    public let width: Int32
    public let length: Int32
    public init(x: Int32, y: Int32) {
        width = x
        length = y
    }
    public func area(): Int32 {
        return length * width
    }
}

class Test {
    public let data1: Data = Data(2, 3)
    public let data2: Data
    public init(x: Data) {
        data2 = x
    }
    public func f(x: Data): Data {
        return x
    }
}

func run(): Int64 {
    var d1: Data = Data(3, 4)
    var d2: Data = Data(4, 4)
    var test: Test = Test(d1)
    let res1: Data = test.data1
    let res2: Data = test.data2
    let res3: Data = test.f(d2)
    if (res1.area() == 6 && res2.area() == 12 && res3.area() == 16) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
