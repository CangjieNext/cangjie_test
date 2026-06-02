// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Data {
    public static var a: Int32 = 2
    public var b: Int32 = 2
    public init() {}
    public init(x: String) {
        b = a + b
    }
}

func run(): Int64 {
    var data: Data = Data("1")
    if (Data.a == 2 && data.b == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
