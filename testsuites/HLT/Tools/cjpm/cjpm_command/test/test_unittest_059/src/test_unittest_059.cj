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

func foo<T>(x: Option<T>): Option<T> {
    return x
}

@Test
class TestA {
    @TestCase
    public func case01(input: Rune): Unit {
        var expect: Option<Rune> = Some<Rune>('a')
        var actual: Option<Rune> = Some<Rune>('b')
        expectEqual("expect", "actual", expect, actual)
    }

    @TestCase
    public func case02(): Unit {
        var expect: Option<Rune> = Option<Rune>.None
        expectEqual("expect", "actual", expect, foo(Some<Rune>('b')))
    }

    @TestCase
    public func case03(): Unit {
        var expect: Option<Rune> = Some<Rune>('a')
        expectEqual("expect", "actual", expect, foo(Some<Rune>('a')))
    }

    @TestCase
    public func case04(): Unit {
        var expect: Option<Rune> = Option<Rune>.None
        expectEqual("expect", "actual", expect, foo(Option<Rune>.None))
    }
}

main(): Unit {
    let _ = TestA()
}
