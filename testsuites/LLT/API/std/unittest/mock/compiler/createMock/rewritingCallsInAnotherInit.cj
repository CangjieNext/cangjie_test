/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers %compile_lib_opt --output p.%middle
// EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

class Foo {
    func test() {
        println("Original `Foo::test` was called");
        1
    }
}

class Bar {
    init(f: Foo) {
        f.test()
    }
    init() {}
    func foo() {
        println("Original `Bar::foo` was called")
        test()
    }
    func bar() {
        println("Original `Bar::bar` was called")
        this.test()
    }
    func test() {
        println("Original `Bar::test` was called")
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
            "_CN7default3Foo15test$ToMock_FooHv",
            [1, "my str", 3],
            33
        )
        Bar(mockedFoo)
    }

    @TestCase
    func case2(): Unit {
        let b = Bar()
        let spiedBar = unsafe { createSpy(dummyMockingCallHandler, b) }
        setSpyMode()
        spiedBar.foo()
        spiedBar.bar()
        spiedBar.test()
    }
}

/* SCAN-IN
Actual call: test()
Declared method: test()[NA, D, AC, NA, rewritingCallsInAnotherInit.cj:18:10]: Int64
Declared function name: test -> _CN7default3Foo15test$ToMock_FooHv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
-------- Called with CallBase --------
Actual call: foo()
Declared method: foo()[NA, D, AC, NA, rewritingCallsInAnotherInit.cj:29:10]: Unit
Declared function name: foo -> _CN7default3Bar14foo$ToMock_BarHv
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
Original `Bar::foo` was called
-------- Called with CallBase --------
Actual call: test()
Declared method: test()[NA, D, AC, NA, rewritingCallsInAnotherInit.cj:37:10]: Unit
Declared function name: test -> _CN7default3Bar15test$ToMock_BarHv
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
Original `Bar::test` was called
-------- Called with CallBase --------
Actual call: bar()
Declared method: bar()[NA, D, AC, NA, rewritingCallsInAnotherInit.cj:33:10]: Unit
Declared function name: bar -> _CN7default3Bar14bar$ToMock_BarHv
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
Original `Bar::bar` was called
-------- Called with CallBase --------
Actual call: test()
Declared method: test()[NA, D, AC, NA, rewritingCallsInAnotherInit.cj:37:10]: Unit
Declared function name: test -> _CN7default3Bar15test$ToMock_BarHv
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
Original `Bar::test` was called
-------- Called with CallBase --------
Actual call: test()
Declared method: test()[NA, D, AC, NA, rewritingCallsInAnotherInit.cj:37:10]: Unit
Declared function name: test -> _CN7default3Bar15test$ToMock_BarHv
Outer decl name: Bar -> _CN7default3BarE
Receiver: [doesn't implement ToString]
------------------------------
Original `Bar::test` was called
 */
