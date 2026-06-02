// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define1.cj
// EXEC: %compiler %cmp_macro define1.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import define1.*

class Aoo {
    public var a: Int32 = 1
    public let b: Boo = Boo(10)
    public init(x: Int32) {
        a = x
    }
}

class Boo {
    public var c: Int32 = 1
    public let d: ?Coo = Coo(1)
    public init(x: Int32) {
        c = x
    }
}

class Coo {
    public var f: Int32 = 2
    public var e: Int32 = 1
    public init(x: Int32) {
        e = x
    }
}

main(): Int32 {
    var a: ?Aoo = Aoo(1)
    var res = @M1(a?.b.d?.e)
    var c = res ?? -1
    if (c != 1) {
        return 1
    }
    return 0
}
