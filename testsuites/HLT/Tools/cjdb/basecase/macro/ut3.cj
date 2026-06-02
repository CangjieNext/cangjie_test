// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package ohos_app_cangjie_entry_test

import std.unittest.TestClass
import std.unittest.TestPackage
import std.unittest.TestSuite
import std.unittest.UnitTestCase
import std.unittest.common.Configuration
import std.unittest.testmacro.*
import std.unittest.*

@Test
class TestExample01 {
    @TestCase
    func testa() {
        @Assert(false)
    }

    @TestCase[x in [ 1, 2 ]]
    func testb(x: Int) {
        @Assert( x >= 1)
    }

    public override func afterAll(): Unit {
        var a = 10
    }
    public override func beforeAll(): Unit {
        var c = 1
        for (i in 0..500000) {
            c++
        }
    }
}
