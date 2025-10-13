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
    public func foo1(x: PassedBar, y: PassedAnotherBar): Option<Foo> {
        Foo()
    }
    public func foo2(x: Unit) {
        return if (true) {
            Foo()
        } else {
            Option<Foo>.None
        }
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<Foo>(dummyMockingCallHandler) }
        setReturnDefaultMode()

        let result1 = match (mockedFoo.foo1(PassedBar(), PassedAnotherBar())) {
            case None => "None"
            case _ => "Some"
        }
        println("Return value of foo1: `" + result1 + "`")
        let result2 = match (mockedFoo.foo2(())) {
            case None => "None"
            case _ => "Some"
        }
        println("Return value of foo2: `" + result2 + "`")
    }
}

/* SCAN-IN
-------- Called with ReturnDefault --------
Actual call: foo1("This is Bar", "This is AnotherBar")
Declared method: foo1(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, option.cj:29:17]: Enum-Option<Class-Foo>
Declared function name: foo1 -> _CN7default3Foo4foo1HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo1: `None`
-------- Called with ReturnDefault --------
Actual call: foo2("()")
Declared method: foo2(x[1, P, ND])[NA, D, AC, NA, option.cj:32:17]: Enum-Option<Class-Foo>
Declared function name: foo2 -> _CN7default3Foo4foo2Hu
Outer decl name: Foo -> _CN7default3FooE
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo2: `None`
 */
