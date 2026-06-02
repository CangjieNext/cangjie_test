/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

var i = 0

open class Foo <: Equatable<Foo> & ToString {
    public operator override func ==(other: Foo): Bool {
        false;
    }

    public operator override func !=(other: Foo): Bool {
        true
    }
    public open override func toString() {
        i++;
        "Foo #${i}"
    }
}

open class FooDerived <: Foo & Equatable<FooDerived> & ToString {
    public operator override func ==(other: FooDerived): Bool {
        false;
    }

    public operator override func !=(other: FooDerived): Bool {
        true
    }
    public override func toString() {
        i++;
        "FooDerived #${i}"
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
    Assert Failed: `({COLOR=YELLOW}a{/COLOR} == {COLOR=YELLOW}b{/COLOR})`
       left: Foo #1
      right: Foo #2
 */

/* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}a{/COLOR} == {COLOR=YELLOW}b{/COLOR})`
       left: FooDerived #3
      right: Foo #4
 */
