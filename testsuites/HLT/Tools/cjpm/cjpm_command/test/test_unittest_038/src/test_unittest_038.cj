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

func getRes(a: String, b: String, c: String): Array<String> {
    var arr: Array<String> = [a, b, c]
    return arr
}

@Test
class TestA {
    @TestCase
    public func case01(): Unit {
        var expect: Array<String> = ["abc", "123", "!@#"]
        var actual: Array<String> = ["ab1", "a23", "!@#"]
        expectEqual("expect", "actual", expect, actual)
    }

    @TestCase
    public func case02(): Unit {
        var expect: Array<String> = ["abc", "123", "!@#"]
        expectEqual("expect", "actual", expect, getRes("abc", "1233", "!@#"))
    }

    @TestCase
    public func case03(): Unit {
        var expect: Array<String> = ["abc", "123", "!@#"]
        expectEqual("expect", "actual", expect, getRes("abc", "123", "!@#"))
    }
}

main(): Unit {
}
