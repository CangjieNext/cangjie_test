// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct Test {}

class Data {
    public var d0: Int32 = 1
    public var d1: Int64 = 2
    public static var s: Int16 = 3
    public static var t: Test = Test()
    public func foo(): Unit {}
}

func run(): Int64 {
    var value: Data = Data();
    if (value.d0 == 1 && Data.s == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
