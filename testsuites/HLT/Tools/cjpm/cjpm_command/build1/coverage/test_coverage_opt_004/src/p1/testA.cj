/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.p1

internal import std.unittest.*
import std.unittest.testmacro.*
internal import std.collection.*

@Test
public class TestA {
    @TestCase
    public func caseA(): Unit {
        var buf: ArrayList<String> = ArrayList<String>(3, {x: Int64 => x.toString()})
        var res = buf.size
        @Expect(res, 3)
    }
}
