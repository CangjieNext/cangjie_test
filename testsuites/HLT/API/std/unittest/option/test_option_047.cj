/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: regex (.*FAIL.*) CASE: case01
// ASSERT: regex (.*FAIL.*) CASE: case02
// ASSERT: regex-not (.*FAIL.*) CASE: case03

import std.unittest.*
import std.unittest.testmacro.*

func getRes(a: A, b: A, c: A): Array<A> {
    var arr: Array<A> = [a, b, c]
    return arr
}

struct A <: Equatable<A> & ToString {
    public var x: Int32
    public var y: Rune
    public var z: String

    public init(a: Int32, b: Rune, c: String) {
        this.x = a
        this.y = b
        this.z = c
    }

    public operator func ==(that: A): Bool {
        if ((that.x == this.x) && (that.y == this.y) && (that.z == this.z)) {
            return true
        } else {
            return false
        }
    }

    public operator func !=(that: A): Bool {
        if ((that.x != this.x) || (that.y != this.y) || (that.z != this.z)) {
            return true
        } else {
            return false
        }
    }

    public func toString(): String {
        return this.x.toString() + this.y.toString() + this.z
    }
}

@Test
class TestA {
    @TestCase
    public func case01(): Unit {
        var expect: Array<A> = [A(0, r'a', "abc"), A(0, r'b', "abc"), A(0, r'c', "abc")]
        var actual: Array<A> = [A(1, r'a', "abc"), A(1, r'b', "abc"), A(1, r'c', "abc")]
        expectEqual("expect", "actual", expect, actual)
    }

    @TestCase
    public func case02(): Unit {
        var expect: Array<A> = [A(0, r'a', "abc"), A(0, r'b', "abc"), A(0, r'c', "abc")]
        expectEqual("expect", "actual", expect, getRes(A(0, r'a', "abc"), A(0, r'b', "abc"), A(0, r'd', "abc")))
    }

    @TestCase
    public func case03(): Unit {
        var expect: Array<A> = [A(0, r'a', "abc"), A(0, r'b', "abc"), A(0, r'c', "abc")]
        expectEqual("expect", "actual", expect, getRes(A(0, r'a', "abc"), A(0, r'b', "abc"), A(0, r'c', "abc")))
    }
}

/* SCAN-IN
        Different elements (left - expect, right - actual):
            [0]: 0aabc != 1aabc
            [1]: 0babc != 1babc
            [2]: 0cabc != 1cabc*/
/* SCAN-IN
        Different elements (left - expect, right - actual):
            [2]: 0cabc != 0dabc*/
