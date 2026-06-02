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

class ReturnedBar <: ToString {
    private let x: String
    init(x: String) {
        this.x = x
    }
    public override func toString() {
        "This is ReturnedBar (${x})"
    }
}

class Foo {
    func foo1(x: String): ReturnedBar {
        ReturnedBar("original")
    }
}

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        addMatcher(
            "_CN7default3Foo15foo1$ToMock_FooHRNat6StringE",
            ["my str 1"],
            ReturnedBar("1")
        )
        println("Return value: " + mockedFoo.foo1("my str 1").toString())
        println("==============================")
    }
}

/* SCAN-IN
Actual call: foo1("my str 1")
Declared method: foo1(x[1, P, ND])[NA, ND, AC, NA, packagePrivate.cj:28:10]: Class-ReturnedBar
Declared function name: foo1 -> _CN7default3Foo15foo1$ToMock_FooHRNat6StringE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value: This is ReturnedBar (1)
==============================
 */
