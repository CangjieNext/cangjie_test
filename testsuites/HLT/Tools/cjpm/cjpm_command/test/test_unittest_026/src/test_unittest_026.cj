/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

internal import std.collection.*
internal import std.unittest.*
import std.unittest.testmacro.*

func getArr(a: Int64, b: Array<Int16>): Array<Array<Int16>> {
    var arr: Array<Array<Int16>> = Array<Array<Int16>>(a, repeat: b)
    return arr
}

@Test
class TestA {
    @TestCase
    public func case01(): Unit {
        var set1: HashSet<String> = HashSet<String>(["abc", "123", "!@#"])
        var set2: HashSet<String> = HashSet<String>(["abcd", "1234", "!@#$"])
        var set3: HashSet<String> = HashSet<String>(["abcde", "12345", "!@#$%"])
        var set4: HashSet<String> = HashSet<String>(["abcde", "12345", "!@#$%^"])

        var expect: Array<HashSet<String>> = [set1, set2, set3]
        var actual: Array<HashSet<String>> = [set1, set2, set4]

        expectEqual("expect", "actual", expect, actual)
    }
}

main() {}
