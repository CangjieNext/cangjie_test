/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

class Foo {
    public func foo(x: String, y: Int32): Int64 {
        println("original `foo` was called with args: x = ${x} and y = ${y}")
        77
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let foo = Foo()
        let spiedFoo = unsafe { createSpy<Foo>(dummyMockingCallHandler, foo) }
        setSpyMode()
        println("returned value: ${spiedFoo.foo("my str", 99)}")
        println("==============================")
    }
}

/* SCAN-IN
-------- Called with CallBase --------
Actual call: foo("my str", "99")
Declared method: foo(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, basic.cj:18:17]: Int64
Declared function name: foo -> _CN7default3Foo3fooHRNat6StringEi
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
original `foo` was called with args: x = my str and y = 99
returned value: 77
==============================
 */
