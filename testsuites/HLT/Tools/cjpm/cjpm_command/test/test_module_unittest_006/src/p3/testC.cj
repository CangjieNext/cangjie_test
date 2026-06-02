/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a.p3

internal import std.unittest.*
import std.unittest.testmacro.*
internal import std.collection.*

@Test
class TestC {
    @TestCase
    public func caseC(): Unit {
        var buf: ArrayList<String> = ArrayList<String>(3, {x: Int64 => x.toString()})
        var res = buf.isEmpty().toString()
        expectEqual("res", "3", res, "false")
    }
}
