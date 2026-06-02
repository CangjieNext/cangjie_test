// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct Base1 {}

struct Base2 {}

struct Base3 {
    public var bb1: Base1 = Base1()
    public var bb2: Base2 = Base2()
    public var a: Int32
    public var b: Int64
    public var c: Int16
    public init(a0: Int32, b0: Int64, c0: Int16) {
        a = a0
        b = b0
        c = c0
    }
}

struct Son {
    public var b1: Base1 = Base1()
    public var b2: Base2 = Base2()
    public var b3: Base3 = Base3(1, 2, 3)
    public var t: Int32 = 1
    public var x: Int64 = 1
    public var y: Int16 = 1
}

var res: Int32 = 0

struct AA {
    public var a: Int32 = 10
    public func test(): Int32 {
        var tmp: Son = Son()
        tmp.t = 16
        res = a + tmp.b3.a + Int32(tmp.b3.b) + Int32(tmp.b3.c)
        res = tmp.t - res
        return res
    }
}

main(): Int64 {
    var num = 0
    var a: AA = AA()
    if (a.test() == 0) {
        return 0
    }
    return 1
}
