/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: regex-not (.*FAIL.*) CASE: caseA01
// ASSERT: regex (.*FAIL.*) CASE: caseA02

import std.unittest.*
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
