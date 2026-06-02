// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Data {
    public var a: Rune
    public var b: Int8
    public var c: Int16
    public var d: Int32
    public var e: Int64
    public var f: Float32
    public var g: Float64
    public var h: Bool

    public init(v0: Rune, v1: Int8, v2: Int16, v3: Int32, v4: Int64, v5: Float32, v6: Float64, v7: Bool) {
        a = v0
        b = v1
        c = v2
        d = v3
        e = v4
        f = v5
        g = v6
        h = v7
    }
}

func run(): Int64 {
    var value: Data = Data(r'a', -1, -2, -3, 4, 2.0, 4.0, true);
    if (value.a == r'a' && value.b == -1 && value.d == -3 && value.f == 2.0) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
