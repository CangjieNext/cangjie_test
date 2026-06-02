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
    public func case01(): Unit {
        var expect: Option<Bool> = Some<Bool>(true)
        var actual: Option<Bool> = Some<Bool>(false)
        expectEqual("expect", "actual", expect, actual)
    }

    @TestCase
    public func case02(): Unit {
        var expect: Option<Bool> = Some<Bool>(true)
        expectEqual("expect", "actual", expect, foo(Some<Bool>(false)))
    }

    @TestCase
    public func case03(): Unit {
        var expect: Option<Bool> = Some<Bool>(true)
        expectEqual("expect", "actual", expect, foo(Some<Bool>(true)))
    }

    @TestCase
    public func case04(): Unit {
        var expect: Option<Bool> = Option<Bool>.None
        expectEqual("expect", "actual", expect, foo(Option<Bool>.None))
    }
}

main(): Unit {}
