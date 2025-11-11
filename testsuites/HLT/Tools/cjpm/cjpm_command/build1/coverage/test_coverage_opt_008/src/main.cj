/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

internal import std.unittest.*
import std.unittest.testmacro.*

open class A <: Equatable<A> & ToString {
    public var x: Int32
    public var y: Rune
    public var z: String

    public init(a: Int32, b: Rune, c: String) {
        this.x = a
        this.y = b
        this.z = c
    }

    public operator func ==(that: A): Bool {
        if (that.x == this.x) {
            return true
        } else {
            return false
        }
    }

    public operator func !=(that: A): Bool {
        if (that.x != this.x) {
            return true
        } else {
            return false
        }
    }

    public func toString(): String {
        return this.z
    }
}

@Test
class TestA {
    @TestCase
    public func caseA01(): Unit {
        var expect: A = A(0, r'a', "abc")
        expectEqual("expect", "getRes()", expect, A(0, r'a', "abc"))
    }

    @TestCase
    public func caseA02(): Unit {
        var expect: A = A(0, r'a', "abcd")
        expectEqual("expect", "getRes()", expect, A(1, r'a', "abc"))
    }
}
