/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

package unittest.mock.integration

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*
import std.collection.ArrayList

class Example {
    func f(_: Int64, _: Int64): String {
        "a"
    }
}

let m = mock<Example>()

@Test
class IT1 {
    @BeforeAll
    func beforeAll(): Unit {
        println("AAA1")
        @On(m.f(1, 2)).returns("").times(2)
    }

    @TestCase
    func shouldNotBeRun(): Unit {
    }

    @AfterAll
    func afterAll(): Unit {
        println("BBB1")
        throw Exception("foo")
    }
}

@Test
class IT2 {
    @BeforeAll
    func beforeAll(): Unit {
        println("AAA2")
    }

    @TestCase
    func shouldNotHaveAnyConfiguration(): Unit {
        m.f(1, 2)
    }

    @AfterAll
    func afterAll(): Unit {
        println("BBB2")
    }
}

@Test
class IT3 {
    @BeforeAll
    func beforeAll(): Unit {
        println("AAA3")
        @On(m.f(1, 2)).returns("bar")
    }

    @TestCase
    func canBeConfiguredAgain(): Unit {
        @Assert(m.f(1, 2) == "bar")
    }

    @AfterAll
    func afterAll(): Unit {
        println("BBB3")
    }
}

/* SCAN-IN
    Non-trivial stub not allowed
    stub m.f(1, 2) declared at stateful_stub_in_before_all3.cj:32 cannot specify non-trivial cardinality in initializer of class IT1.
    Consider moving this stub into test case body.
 */

/* SCAN-IN
AAA1
BBB1
AAA2
BBB2
AAA3
BBB3
 */

// ASSERT: scan [ FAILED ] CASE: shouldNotHaveAnyConfiguration
// ASSERT: scan [ PASSED ] CASE: canBeConfiguredAgain
// ASSERT: scan-1 No stubs were specified for method f.
// ASSERT: scan-not shouldNotBeRun
