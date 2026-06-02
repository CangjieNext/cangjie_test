/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./../../asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt asan.%middle -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: regex (.*)ERROR(.*) CASE: case01
// ASSERT: regex (.*)FAIL(.*) CASE: case02
// ASSERT: regex-not (.*)FAIL(.*) CASE: case03

import std.unittest.*
import std.unittest.testmacro.*
import asan.*

class Temp {
    var a = 3
}

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
        var arr: Array<A> = [A(0, r'a', "abc"), A(0, r'b', "abc"), A(0, r'c', "abc")]
        var index = Temp()
        var expect: A = arr[0]
        var actual: A = arr[index.a]
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
            [2]: 0cabc != 0dabc*/
