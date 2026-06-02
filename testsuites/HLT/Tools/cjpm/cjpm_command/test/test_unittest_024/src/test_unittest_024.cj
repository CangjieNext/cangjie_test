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

func getArr(a: Rune, b: Rune, c: Rune): Array<Rune> {
    var aNew: Rune = r'a'
    var bNew: Rune = r'b'
    var cNew: Rune = r'c'
    var arr: Array<Rune> = [aNew, bNew, cNew]
    return arr
}

@Test
class TestA {
    @TestCase
    public func caseA01(): Unit {
        sleep(Duration.second)
        var args1: Array<Rune> = [r'a', r'b', r'c']
        @Expect(getArr(r'a', r'b', r'c'), args1)
    }
}

main() {}
