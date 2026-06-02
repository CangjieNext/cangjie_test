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
        let a = Foo()
        let b = Foo()
        @Assert(a, b)
    }

    @TestCase
    func case2(): Unit {
        let a = FooDerived()
        let b = Foo()
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: `(a == b)`
       left: <value not printable>
      right: <value not printable>
 */

/* SCAN-IN
    Assert Failed: `(a == b)`
       left: FooDerived
      right: <value not printable>
 */
