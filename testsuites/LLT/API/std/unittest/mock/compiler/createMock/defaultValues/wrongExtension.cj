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

public interface MyHasDefaultValueForStub<T> {
    static func defaultValueForStub(): T
}

class FooWithDefaultValue {}

extend FooWithDefaultValue <: HasDefaultValueForStub<Foo> {
    public static func defaultValueForStub(): Foo {
        Foo()
    }
}

class FooWithDefaultValue2 {}

extend FooWithDefaultValue2 <: MyHasDefaultValueForStub<FooWithDefaultValue2> {
    public static func defaultValueForStub(): FooWithDefaultValue2 {
        FooWithDefaultValue2()
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
        FooWithDefaultValue()
    }
    public func foo2(): FooWithDefaultValue {
        return FooWithDefaultValue()
    }
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
            mockedFoo.foo1(PassedBar(), PassedAnotherBar())
        } catch (e: NoDefaultValueForMockException) {
            println(e.message)
        }
        try {
            mockedFoo.foo2()
        } catch (e: NoDefaultValueForMockException) {
            println(e.message)
        }
    }

    @TestCase
    func case2(): Unit {
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

main() {
    0
}

/* SCAN-IN
-------- Called with ReturnDefault --------
Actual call: foo1("This is Bar", "This is AnotherBar")
Declared method: foo1(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, wrongExtension.cj:50:17]: Class-FooWithDefaultValue
Declared function name: foo1 -> _CN7default3Foo4foo1HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
No provided default value for a return type `Class-FooWithDefaultValue`. Make sure such type implements `HasDefaultValueForStub<Class-FooWithDefaultValue>` interface
-------- Called with ReturnDefault --------
Actual call: foo2()
Declared method: foo2()[NA, ND, AC, NA, wrongExtension.cj:53:17]: Class-FooWithDefaultValue
Declared function name: foo2 -> _CN7default3Foo4foo2Hv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
No provided default value for a return type `Class-FooWithDefaultValue`. Make sure such type implements `HasDefaultValueForStub<Class-FooWithDefaultValue>` interface
-------- Called with ReturnDefault --------
Actual call: foo3("This is Bar", "This is AnotherBar")
Declared method: foo3(x[1, P, ND], y[2, P, ND])[NA, ND, AC, NA, wrongExtension.cj:56:17]: Class-FooWithDefaultValue2
Declared function name: foo3 -> _CN7default3Foo4foo3HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
No provided default value for a return type `Class-FooWithDefaultValue2`. Make sure such type implements `HasDefaultValueForStub<Class-FooWithDefaultValue2>` interface
-------- Called with ReturnDefault --------
Actual call: foo4()
Declared method: foo4()[NA, ND, AC, NA, wrongExtension.cj:59:17]: Class-FooWithDefaultValue2
Declared function name: foo4 -> _CN7default3Foo4foo4Hv
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
No provided default value for a return type `Class-FooWithDefaultValue2`. Make sure such type implements `HasDefaultValueForStub<Class-FooWithDefaultValue2>` interface
*/
