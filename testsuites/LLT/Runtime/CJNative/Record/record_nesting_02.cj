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
    public var a: Int32 = 10
}

struct Son {
    public var b1: Base1 = Base1()
    public var b2: Base2 = Base2()
    public var b3: Base3 = Base3()
    public var t: Int32 = 100
}

struct AA {
    public var a: Int32 = 10
    public func test(): Int32 {
        var tmp: Son = Son()
        var t: Int32 = 20
        t = tmp.t - t
        tmp.b3.a = t + a
        return tmp.b3.a
    }
}

main(): Int64 {
    var num = 0
    var a: AA = AA()
    if (a.test() == 90) {
        return 0
    }
    return 1
}
