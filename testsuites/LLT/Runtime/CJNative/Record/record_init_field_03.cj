// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Data {
    public var a: Int64 = 3
}

struct GenRec {
    public let a: Int64
    public init(x: Int64, y: Int32, str: String) {
        var tmp1 = x
        var tmp2 = y
        var tmp3 = str
        this.a = Data().a
    }
    public var b: Int32 = 1
}

main(): Int64 {
    var rec = GenRec(3, 4, "1")
    if (rec.a == 3 && rec.b == 1) {
        return 0
    }
    return 1
}
