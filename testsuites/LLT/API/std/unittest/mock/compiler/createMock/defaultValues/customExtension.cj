/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../helpers
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.mock_test_util.*
import std.unittest.*
import std.unittest.testmacro.*

class FooWithDefaultValue<K> <: ToString where K <: ToString {
    var x: K = 20 as K ?? throw Exception()
    public func toString(): String {
        x.toString()
    }
}

extend<K> FooWithDefaultValue<K> <: HasDefaultValueForStub<FooWithDefaultValue<K>> {
    public static func defaultValueForStub(): FooWithDefaultValue<K> {
        let a = FooWithDefaultValue<Int64>();
        a.x = 0
        a as FooWithDefaultValue<K> ?? throw Exception()
    }
}

class PassedBar <: ToString {
    public override func toString() {
        "This is Bar"
    }
}

class PassedAnotherBar <: ToString {
    public override func toString() {
        "This is AnotherBar"
    }
}

class Foo {
    public func foo1(x: PassedBar, y: PassedAnotherBar) {
        FooWithDefaultValue<Int64>()
    }
    public func foo2(): FooWithDefaultValue<Int64> {
        return FooWithDefaultValue<Int64>()
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        setReturnDefaultMode()
        println("Return value of foo1: `" + mockedFoo.foo1(PassedBar(), PassedAnotherBar()).toString() + "`")
        println("Return value of foo2: `" + mockedFoo.foo2().toString() + "`")
    }
}

/* SCAN-IN
-------- Called with ReturnDefault --------
Actual call: foo1("This is Bar", "This is AnotherBar")
Declared method: foo1(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, customExtension.cj:45:17]: Class-FooWithDefaultValue<Int64>
Declared function name: foo1 -> _CN7default3Foo4foo1HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo1: `0`
-------- Called with ReturnDefault --------
Actual call: foo2()
Declared method: foo2()[NA, D, AC, NA, customExtension.cj:48:17]: Class-FooWithDefaultValue<Int64>
Declared function name: foo2 -> _CN7default3Foo4foo2Hv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo2: `0`
 */
