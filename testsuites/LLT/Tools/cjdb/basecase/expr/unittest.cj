// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.unittest.*
import std.unittest.testmacro.*

var n: Int32 = 0

@Test
public class TestA {
    @TestCase
    public func case1(): Unit {
        if (n == 1) {
            n++
        }
    }
}

main(): Int32 {
    let a = TestA()
    a.asTestSuite().runTests()
    0
}
