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

open class Foo <: Equatable<Foo> {
    public operator override func ==(other: Foo): Bool {
        false;
    }

    public operator override func !=(other: Foo): Bool {
        true
    }
}

class FooDerived <: Foo & ToString & Equatable<FooDerived> {
    public func toString() {
        "FooDerived"
    }
    public operator override func ==(other: FooDerived): Bool {
        false;
    }

    public operator override func !=(other: FooDerived): Bool {
        true
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let a = [Foo()]
        let b = [Foo()]
        @Assert(a, b)
    }

    @TestCase
    func case2(): Unit {
        let a = [[Foo()]]
        let b = [[Foo()]]
        @Assert(a, b)
    }

    @TestCase
    func case3(): Unit {
        let x: Int64 = 22
        let a: Array<Foo> = [Foo()]
        let b: Array<Foo> = [FooDerived()]
        @Assert(a, b)
    }

    @TestCase
    func case4(): Unit {
        let a: Array<Array<Foo>> = [[Foo(), Foo(), Foo(), Foo(), Foo(), Foo(), Foo(), Foo()]]
        let b: Array<Array<Foo>> = [[Foo(), Foo(), Foo(), FooDerived(), Foo(), Foo(), FooDerived()]]
        @Assert(a, b)
    }

    @TestCase
    func case5(): Unit {
        let a = [[(Foo())]]
        let b = [[(Foo())]]
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]:
                Different elements (left - a[0], right - b[0]):
                    [0]: <value not printable> != <value not printable>
 */

/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]: <value not printable> != FooDerived
 */

/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]:
                Different sizes: 8(a[0]) != 7(b[0])
                Different elements (left - a[0], right - b[0]):
                    [0]: <value not printable> != <value not printable>
                    [1]: <value not printable> != <value not printable>
                    [2]: <value not printable> != <value not printable>
                    [3]: <value not printable> != FooDerived
                    [4]: <value not printable> != <value not printable>
                    [5]: <value not printable> != <value not printable>
                    [6]: <value not printable> != FooDerived
 */

/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]:
                Different elements (left - a[0], right - b[0]):
                    [0]: <value not printable> != <value not printable>
 */
