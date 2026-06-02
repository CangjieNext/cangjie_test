/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * !!! THIS TEST CHECKS CURRENTLY WRONG BEHAVIOUR !!!
 *
 * The compiler currently loses thrown exception for open methods which return Nothing
 * That's why mocking doesn't touch such methods (neither generates accessors nor makes them open)
 * Fix the test after the original bug will be fixed
 */

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

public class Foo {
    public func foo(): Nothing {
        throw IllegalArgumentException("Original exception")
    }
    public prop p1: Nothing {
        get() {
            throw IllegalArgumentException("Original exception")
        }
    }
    public mut prop p2: Nothing {
        get() {
            throw IllegalArgumentException("Original exception")
        }
        set(x) {
            throw IllegalArgumentException("Original exception")
        }
    }
}

class Foo2 {
    func foo(): Nothing {
        throw IllegalArgumentException("Original exception")
    }
    prop p1: Nothing {
        get() {
            throw IllegalArgumentException("Original exception")
        }
    }
    mut prop p2: Nothing {
        get() {
            throw IllegalArgumentException("Original exception")
        }
        set(x) {
            throw IllegalArgumentException("Original exception")
        }
    }
}

func callFoo() {
    let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
    mockedFoo.foo()
}

func callFoo2() {
    let mockedFoo = unsafe { createMock<Foo2>(dummyMockingCallHandler) }
    mockedFoo.foo()
}

func callFooImProp() {
    let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
    mockedFoo.p1
}

func callFooMutProp() {
    let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
    mockedFoo.p2
}

func callFoo2ImProp() {
    let mockedFoo = unsafe { createMock<Foo2>(dummyMockingCallHandler) }
    mockedFoo.p1
}

func callFoo2MutProp() {
    let mockedFoo = unsafe { createMock<Foo2>(dummyMockingCallHandler) }
    mockedFoo.p2
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        @AssertThrows[NoMockMatchersFoundException](callFoo())
    }
    @TestCase
    func case2(): Unit {
        @AssertThrows[NoMockMatchersFoundException](callFoo2())
    }
    @TestCase
    func case3(): Unit {
        @AssertThrows[NoMockMatchersFoundException](callFooImProp())
    }
    @TestCase
    func case4(): Unit {
        @AssertThrows[NoMockMatchersFoundException](callFooMutProp())
    }
    @TestCase
    func case5(): Unit {
        @AssertThrows[NoMockMatchersFoundException](callFoo2ImProp())
    }
    @TestCase
    func case6(): Unit {
        @AssertThrows[NoMockMatchersFoundException](callFoo2MutProp())
    }
}
