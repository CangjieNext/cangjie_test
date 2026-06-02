/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

internal import std.unittest.*
import std.unittest.testmacro.*

func getRes(a: Rune, b: Rune, c: Rune): Array<Rune> {
    var arr: Array<Rune> = [a, b, c]
    return arr
}

@Test
class TestA {
    @TestCase
    public func case01(): Unit {
        var expect: Array<Rune> = [r'a', r'b', r'c']
        var actual: Array<Rune> = [r'b', r'b', r'c']
        expectEqual("expect", "actual", expect, actual)
    }

    @TestCase
    public func case02(): Unit {
        var expect: Array<Rune> = [r'a', r'b', r'c']
        expectEqual("expect", "actual", expect, getRes(r'a', r'b', r'e'))
    }

    @TestCase
    public func case03(): Unit {
        var expect: Array<Rune> = [r'a', r'b', r'c']
        expectEqual("expect", "actual", expect, getRes(r'a', r'b', r'c'))
    }
}

main(): Unit {
}
