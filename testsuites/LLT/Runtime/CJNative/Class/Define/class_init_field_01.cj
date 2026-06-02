// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Data {
    public var a: Int32
    public var b: Float32
    public var c: Int64

    public init() {
        a = 1
        b = 2.0
        c = 2
    }
}

func run(): Int64 {
    var value: Data = Data();
    if ((value.a == 1) && (value.b == 2.0) && (value.c == 2)) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
