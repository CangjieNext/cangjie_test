// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package SS_PO.test.product

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*
import std.collection.*

@Test
class ARBaseData_findshopgroupTest <: BaseTest {
    @TestCase
    func testARBaseData_findshopgroupTest_normal() {
        let arr = ArrayList<String>(100000) {ix: Int64 => "Hello"}
        println(arr)
    }
}
