// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct Data {
    public var data1: Int32
    public var data2: Int64
    public var data3: Int8
    public var data4: Int16
    public var data5: UInt32
    public init(a: Int32, b: Int64, c: Int8, d: Int16, e: UInt32) {
        data1 = a
        data2 = b
        data3 = c
        data4 = d
        data5 = e
    }
}

func run(): Int64 {
    var data: Data = Data(2, 20, 1, -8, 8)
    if (data.data1 == 2 && data.data3 == 1 && data.data5 == 8) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
