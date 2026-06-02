/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt --mock=on 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

class Foo<K, V> {
    public func bar(x: K, y: V): V {
        77 as V ?? throw Exception()
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let foo = Foo<String, Int64>()
        setSpyMode()
        let spiedFoo = unsafe { createSpy(dummyMockingCallHandler, foo) }
        @Assert(spiedFoo.bar("my str", 99), 77)
    }
}

/* SCAN-IN
-------- Called with CallBase --------
Actual call: bar("my str", "99")
Declared method: bar(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, generic.cj:12:17]: Generics-V
Declared function name: bar -> _CN7default3FooIG_G0_E3barHG_G0_
Outer decl name: Foo<std.core:String, Int64> -> _CN7default3FooIG_G0_E
Receiver: [doesn't implement ToString]
------------------------------
 */
