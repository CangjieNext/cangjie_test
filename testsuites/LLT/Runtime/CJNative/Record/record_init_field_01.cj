// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct Data {
    public var data1: Int32 = 2
    public var data2: Int64 = 20
    public var data3: Int8 = 1
    public init() {}
}

func run(): Int64 {
    var data: Data = Data()
    if (data.data1 == 2 && data.data2 == 20 && data.data3 == 1) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
