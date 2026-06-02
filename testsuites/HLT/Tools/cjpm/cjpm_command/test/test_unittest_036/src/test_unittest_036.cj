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

func getRes(a: Bool, b: Bool, c: Bool): Array<Bool> {
    var arr: Array<Bool> = [a, b, c]
    return arr
}

@Test
class TestA {
    @TestCase
    public func case01(): Unit {
        var expect: Array<Bool> = [true, false, true]
        var actual: Array<Bool> = [false, false, true]
        expectEqual("expect", "actual", expect, actual)
    }

    @TestCase
    public func case02(): Unit {
        var expect: Array<Bool> = [true, false, true]
        expectEqual("expect", "actual", expect, getRes(false, true, false))
    }

    @TestCase
    public func case03(): Unit {
        var expect: Array<Bool> = [true, false, true]
        expectEqual("expect", "actual", expect, getRes(true, false, true))
    }
}

main() {}
