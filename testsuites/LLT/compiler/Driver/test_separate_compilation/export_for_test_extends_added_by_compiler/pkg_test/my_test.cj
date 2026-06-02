// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
public class Test {
    @TestCase
    func extendString(): Unit {
        @Assert("a".foo(), "ab")
        @Assert("a".foo2(), "abc")
        @Assert("a".foo3(), "abcd")
        @Assert("a".foo4(), "abcde")
        @Assert("a".p, 234)
    }

    @TestCase
    func extendConcreteMap(): Unit {
        let m = HashMap<String, Int64>()
        m["_"] = 94534
        @Assert(m.get_(), 94534)
    }

    @TestCase
    func extendGenericMap(): Unit {
        let m = HashMap<Int8, Float16>()
        m[56] = 0.09132
        m.anotherSet(56, 0.09133)
        @Assert(m.anotherGet(56), 0.09133)
        let m2 = HashMap<String, Int8>()
        m2["56"] = 11
        m2.anotherSet("56", 22)
        @Assert(m2.anotherGet("56"), 22)
    }
}
