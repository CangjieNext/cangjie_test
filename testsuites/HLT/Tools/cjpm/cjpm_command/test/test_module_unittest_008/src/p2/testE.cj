/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a.p2

internal import std.unittest.*
import std.unittest.testmacro.*
internal import std.collection.*

@Test
public class TestE {
    @TestCase
    public func caseE(): Unit {
        var buf: ArrayList<String> = ArrayList<String>(3, {x: Int64 => x.toString()})
        var res = buf.get(1)
        @Expect(res, "2")
    }
}
