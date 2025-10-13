/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

open class Foo <: Equatable<Foo> {
    public operator override func ==(other: Foo): Bool {
        false;
    }

    public operator override func !=(other: Foo): Bool {
        true
    }
}

@Test
public class TestA {
    @TestCase
    func case1() {
        let a = ArrayList([1, 2, 4, 3])
        let b = ArrayList([1, 2, 4])
        @Assert(a, b)
    }

    @TestCase
    func case2() {
        let a: ArrayList<Array<Array<Int32>>> = ArrayList([])
        let b: ArrayList<Array<Array<Int32>>> = ArrayList([[]])
        @Assert(a, b)
    }

    @TestCase
    func case3() {
        let a = ArrayList(
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
        let b = ArrayList(
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
        @Assert(a, b)
    }

    @TestCase
    func case4() {
        let a: ArrayList<Array<Array<Int64>>> = ArrayList([[], [], [], [], [], [], []])
        let b: ArrayList<Array<Array<Int64>>> = ArrayList([[], [], [], [], [], [], [], []])
        @Assert(a, b)
    }

    @TestCase
    func case5(): Unit {
        let a = ArrayList([1, 2, 3])
        let b = ArrayList([3, 2, 1])
        @Assert(a, b)
    }

    @TestCase
    func case6(): Unit {
        let a = ArrayList([Foo()])
        let b = ArrayList([Foo()])
        @Assert(a, b)
    }

    @TestCase
    func case7(): Unit {
        let a = ArrayList.of("a", "bl", "ppqer", "test55", "test5")
        let b = ArrayList.of("a55", "b", "ppqzr", "test65", "test55")
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: 
        Different sizes: 4(a) != 3(b)
 */
/* SCAN-IN
    Assert Failed: 
        Different sizes: 0(a) != 1(b)
 */
/* SCAN-IN
    Assert Failed: 
        Different sizes: 264(a) != 265(b)
 */
/* SCAN-IN
    Assert Failed: 
        Different sizes: 7(a) != 8(b)
 */
/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]: 1 != 3
            [2]: 3 != 1
 */
/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]: <value not printable> != <value not printable>
 */
/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]: "a" != "a55"
            [1]: "bl" != "b"
            [2]: "ppqer" != "ppqzr"
            [3]:
                a: "test55"
                b: "test65"
                    ====!=
            [4]:
                a: "test·5"
                b: "test55"
                    ====+=
 */
