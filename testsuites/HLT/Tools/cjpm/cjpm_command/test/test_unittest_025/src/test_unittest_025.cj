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
    var arr: Array<Rune> = [a, b, c]
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

    @TestCase
    public func caseA02(): Unit {
        var args1: Array<Rune> = [r'a', r'b', r'c']
        @Expect(getArr(r'd', r'e', r'f'), args1)
    }

    @TestCase
    public func caseA03(): Unit {
        var args1: Array<Rune> = [r'a', r'b', r'c']
        @Expect(getArr(r'h', r'i', r'j'), args1)
    }

    @TestCase
    public func caseA04(): Unit {
        var args1: Array<Rune> = [r'a', r'b', r'c']
        @Expect(getArr(r'k', r'l', r'm'), args1)
    }

    @TestCase
    public func caseA05(): Unit {
        var args1: Array<Rune> = [r'a', r'b', r'c']
        @Expect(getArr(r'n', r'o', r'p'), args1)
    }
}

main() {}
