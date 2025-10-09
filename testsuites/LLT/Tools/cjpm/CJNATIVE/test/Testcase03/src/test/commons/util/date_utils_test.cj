// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package SS_PO.test.commons.util

import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

@Test
class DateUtilsTest{
    @TestCase
    func testConvertDateToDate_normal(){
        var time = DateTime.parse("2024-02-02 12:12:13", "yyyy-MM-dd HH:mm:ss")
        println(time)
    }

    @TestCase
    func testConvertDateToDate_faild(){
        var time = DateTime.parse("2024-02-02 12:12:13", "yyyy-MM-dd HH:mm:ss")
        println(time)
    }
}
