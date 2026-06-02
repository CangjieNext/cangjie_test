/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f
// ASSERT: scan array index is out of bounds

import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion

func ssssssssssssssssssssssss(): Int64 {
    return 12
}

@Test
public class TestCCC {
    @TestCase
    func sayhi2(): Unit {
        print("hi2")
        let s = Array<Int64>()
        s[1]
        print("hi2")
    }

    @TestCase
    func sayhi3(): Unit {
        @Expect(ssssssssssssssssssssssss(), 11)
        @Expect([1,2,3], [1,2])
        print("hi3")
    }

    @Bench[10]
    @TestCase
    func ttt(): Unit {
        var s = "0"
        for (i in 1..1000) {
            s = s + i.toString()
        }
    }
}

@Test
class TestA {
    @TestCase
    public func case01(): Unit {
        var arr: Array<A> = [A(0, r'a', "abc"), A(0, r'b', "abc"), A(0, r'c', "abc")]
        var expect: A = arr[0]
        var actual: A = arr[3]
        expectEqual("expect", "actual", expect, actual)
    }

    @TestCase
    @Skip
    public func case04(): Unit {
        var arr: Array<A> = [A(0, r'a', "abc"), A(0, r'b', "abc"), A(0, r'c', "abc")]
        var expect: A = arr[0]
        var actual: A = arr[3]
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
func ttt(): Unit {
    var s = "0"
    for (i in 1..10000) {
        s = s + i.toString()
    }
}
