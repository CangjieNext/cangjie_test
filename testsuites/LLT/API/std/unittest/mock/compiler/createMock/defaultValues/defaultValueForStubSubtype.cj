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

open class FooWithDefaultValue2 {}

class Foo2 <: FooWithDefaultValue2 {}

extend FooWithDefaultValue2 <: HasDefaultValueForStub<FooWithDefaultValue2> {
    public static func defaultValueForStub(): Foo2 {
        Foo2()
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
    public func foo3(x: PassedBar, y: PassedAnotherBar) {
        FooWithDefaultValue2()
    }
    public func foo4(): FooWithDefaultValue2 {
        return FooWithDefaultValue2()
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        setReturnDefaultMode()
        try {
            mockedFoo.foo3(PassedBar(), PassedAnotherBar())
        } catch (e: NoDefaultValueForMockException) {
            println(e.message)
        }
        try {
            mockedFoo.foo4()
        } catch (e: NoDefaultValueForMockException) {
            println(e.message)
        }
    }
}

/* SCAN-IN
-------- Called with ReturnDefault --------
Actual call: foo3("This is Bar", "This is AnotherBar")
Declared method: foo3(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, defaultValueForStubSubtype.cj:40:17]: Class-FooWithDefaultValue2
Declared function name: foo3 -> _CN7default3Foo4foo3HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
-------- Called with ReturnDefault --------
Actual call: foo4()
Declared method: foo4()[NA, D, AC, NA, defaultValueForStubSubtype.cj:43:17]: Class-FooWithDefaultValue2
Declared function name: foo4 -> _CN7default3Foo4foo4Hv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
 */
