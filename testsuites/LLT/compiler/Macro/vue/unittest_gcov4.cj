// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan-not Expect Failed

import std.unittest.*
import std.unittest.testmacro.*

class Aoo {
    public var a: Int32 = 1
    public let b: Boo = Boo(10)
    public init(x: Int32) {
        a = x
    }
}

class Boo {
    public var c: Int32 = 1
    public let d: ?Coo = Coo(5)
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

@Test
func test() {
    var a: ?Aoo = Aoo(1)
    var res = a?.b.d?.e
    var (a1, b1, c1): (Int64, Int32, Int16) = (3, 4, 5)
    @Expect(res, 5)
    @Expect(b1, 4)
}
