/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// DEPENDENCE: ../otherPackageToImport
// (CJNATIVE) EXEC: %compiler %cmp_opt %pkg_opt -Woff=all helpers --mock=on -o libpkg1.%middle %compile_lib_opt
// (CJNATIVE) EXEC: %compiler %cmp_opt %pkg_opt -Woff=all otherPackageToImport --mock=on -o libpkg2.%middle %compile_lib_opt
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all libpkg1.%middle libpkg2.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import otherPackageToImport.*
import std.mock_test_util.*
import std.unittest.testmacro.*

open class FooDerived <: FooOpen2 {
    public open func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
    public open func bar(): Int32 {
        1
    }

    public open func takeFooAndCallBar2(foo: FooOpen2) {
        foo.bar()
    }

    public open func takeFooAndCallProps2(foo: FooOpen2) {
        println("Return value: " + foo.p1)
        println("Return value: " + foo.p2)
        foo.p2 = "nn"
    }

    public prop p1: String {
        get() {
            println("original getter for `p1` in FooDerived was called");
            "my str"
        }
    }

    public mut prop p2: String {
        get() {
            println("original getter for `p2` in FooDerived was called");
            "my str"
        }
        set(newP2) {
            println("original setter for `p2` in FooDerived was called")
        }
    }
}

class FooDerived2 <: FooDerived {
    public func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
    public func bar(): Int32 {
        1
    }

    public func takeFooAndCallBar(foo: FooOpen2) {
        foo.bar()
    }
    public func takeFooAndCallBar2(foo: FooOpen2) {
        foo.bar()
    }
    func takeFooAndCallFoo(foo: FooOpen2) {
        foo.foo(PassedBar(), PassedAnotherBar())
    }
    public func takeFooAndCallProps(foo: FooOpen2) {
        println("Return value: " + foo.p1)
        println("Return value: " + foo.p2)
        foo.p2 = "nn"
    }
    public func takeFooAndCallProps2(foo: FooOpen2) {
        println("Return value: " + foo.p1)
        println("Return value: " + foo.p2)
        foo.p2 = "nn"
    }
}

@Test
public class TestA {
    public override func afterEach(): Unit {
        clearMatchers()
    }

    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<FooDerived>(dummyMockingCallHandler) }
        let foo: FooOpen2 = mockedFoo
        let d: Int32 = 54
        addMatcher(
            "_CN7default10FooDerived3barHv",
            [1, "my str", 3],
            d
        )
        addMatcher(
            "_CN20otherPackageToImport8FooOpen217takeFooAndCallBarHCNY_Y0_E",
            [1, "my str", 3],
            d
        )
        addMatcher(
            "_CN7default10FooDerived18takeFooAndCallBar2HCN20otherPackageToImport8FooOpen2E",
            [1, "my str", 3],
            d
        )
        addMatcher(
            "_CN20otherPackageToImport8FooOpen224takeFooAndCallFooDefaultHCNY_Y0_E",
            [1, "my str", 3],
            ()
        )
        mockedFoo.takeFooAndCallBar(foo)
        println("==============================")
        mockedFoo.takeFooAndCallBar2(foo)
        println("==============================")
        mockedFoo.takeFooAndCallFooDefault(foo)
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<FooDerived>(dummyMockingCallHandler) }
        let foo: FooOpen2 = mockedFoo
        addMatcher(
            "_CN7default10FooDerived2p1pgHv",
            [1, "my str", 3],
            "mocked str"
        )
        addMatcher(
            "_CN7default10FooDerived2p2pgHv",
            [1, "my str", 3],
            "mocked str 3"
        )
        addMatcher(
            "_CN7default10FooDerived2p2psHRNat6StringE",
            [1, "my str", 3],
            ()
        )
        addMatcher(
            "_CN7default10FooDerived20takeFooAndCallProps2HCN20otherPackageToImport8FooOpen2E",
            [1, "my str", 3],
            ()
        )
        addMatcher(
            "_CN20otherPackageToImport8FooOpen219takeFooAndCallPropsHCNY_Y0_E",
            [1, "my str", 3],
            ()
        )
        println("Return value: " + foo.p1)
        println("==============================")
        println("Return value: " + foo.p2)
        println("==============================")
        foo.p2 = "nn"
        println("==============================")
        mockedFoo.takeFooAndCallProps(foo)
        println("==============================")
        mockedFoo.takeFooAndCallProps2(foo)
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<FooDerived2>(dummyMockingCallHandler) }
        let foo: FooOpen2 = mockedFoo
        let d: Int32 = 54
        addMatcher(
            "_CN7default11FooDerived23barHv",
            [1, "my str", 3],
            d
        )
        addMatcher(
            "_CN7default11FooDerived217takeFooAndCallBarHCN20otherPackageToImport8FooOpen2E",
            [1, "my str", 3],
            d
        )
        addMatcher(
            "_CN7default11FooDerived218takeFooAndCallBar2HCN20otherPackageToImport8FooOpen2E",
            [1, "my str", 3],
            d
        )
        addMatcher(
            "_CN7default11FooDerived236takeFooAndCallFoo$ToMock_FooDerived2HCN20otherPackageToImport8FooOpen2E",
            [1, "my str", 3],
            ReturnedBar("22")
        )
        addMatcher(
            "_CN20otherPackageToImport8FooOpen224takeFooAndCallFooDefaultHCNY_Y0_E",
            [1, "my str", 3],
            ()
        )
        foo.takeFooAndCallBar(foo)
        println("==============================")
        mockedFoo.takeFooAndCallBar2(foo)
        println("==============================")
        mockedFoo.takeFooAndCallFoo(foo)
        println("==============================")
        foo.takeFooAndCallFooDefault(foo)
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createMock<FooDerived2>(dummyMockingCallHandler) }
        let foo: FooOpen2 = mockedFoo
        addMatcher(
            "_CN7default10FooDerived2p1pgHv",
            [1, "my str", 3],
            "mocked str 2"
        )
        addMatcher(
            "_CN7default10FooDerived2p2pgHv",
            [1, "my str", 3],
            "mocked str 3"
        )
        addMatcher(
            "_CN7default10FooDerived2p2psHRNat6StringE",
            [1, "my str", 3],
            ()
        )
        addMatcher(
            "_CN7default11FooDerived219takeFooAndCallPropsHCN20otherPackageToImport8FooOpen2E",
            [1, "my str", 3],
            ()
        )
        addMatcher(
            "_CN7default11FooDerived220takeFooAndCallProps2HCN20otherPackageToImport8FooOpen2E",
            [1, "my str", 3],
            ()
        )
        println("Return value: " + foo.p1)
        println("==============================")
        println("Return value: " + foo.p2)
        println("==============================")
        foo.p2 = "nn"
        println("==============================")
        foo.takeFooAndCallProps(foo)
        println("==============================")
        mockedFoo.takeFooAndCallProps2(foo)
    }
}

/* SCAN-IN
Actual call: takeFooAndCallBar([not ToString])
Declared method: takeFooAndCallBar(foo[1, P, ND])[A, D, AC, NA, FooAbstractAndOpenClass.cj:39:22]: Int32
Declared function name: takeFooAndCallBar -> _CN20otherPackageToImport8FooOpen217takeFooAndCallBarHCNY_Y0_E
Outer decl name: FooOpen2 -> _CN20otherPackageToImport8FooOpen2E
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: takeFooAndCallBar2([not ToString])
Declared method: takeFooAndCallBar2(foo[1, P, ND])[NA, D, AC, NA, accessingViaAbstractClass.cj:27:22]: Int32
Declared function name: takeFooAndCallBar2 -> _CN7default10FooDerived18takeFooAndCallBar2HCN20otherPackageToImport8FooOpen2E
Outer decl name: FooDerived -> _CN7default10FooDerivedE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: takeFooAndCallFooDefault([not ToString])
Declared method: takeFooAndCallFooDefault(foo[1, P, ND])[A, D, AC, NA, FooAbstractAndOpenClass.cj:44:17]: Unit
Declared function name: takeFooAndCallFooDefault -> _CN20otherPackageToImport8FooOpen224takeFooAndCallFooDefaultHCNY_Y0_E
Outer decl name: FooOpen2 -> _CN20otherPackageToImport8FooOpen2E
Receiver: [doesn't implement ToString]
------------------------------
Actual call: $p1get()
Declared prop getter: p1()[NA, D, AC, DHS, accessingViaAbstractClass.cj:38:9]: Struct-String
Declared function name: $p1get -> _CN7default10FooDerived2p1pgHv
Outer decl name: FooDerived -> _CN7default10FooDerivedE
Receiver: [doesn't implement ToString]
------------------------------
Return value: mocked str
==============================
Actual call: $p2get()
Declared prop getter: p2()[NA, D, AC, HS, accessingViaAbstractClass.cj:45:9]: Struct-String
Declared function name: $p2get -> _CN7default10FooDerived2p2pgHv
Outer decl name: FooDerived -> _CN7default10FooDerivedE
Receiver: [doesn't implement ToString]
------------------------------
Return value: mocked str 3
==============================
Actual call: $p2set("nn")
Declared prop setter: p2(newP2[1, P, ND])[NA, D, AC, NA, accessingViaAbstractClass.cj:49:9]: Unit
Declared function name: $p2set -> _CN7default10FooDerived2p2psHRNat6StringE
Outer decl name: FooDerived -> _CN7default10FooDerivedE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: takeFooAndCallProps([not ToString])
Declared method: takeFooAndCallProps(foo[1, P, ND])[A, D, AC, NA, FooAbstractAndOpenClass.cj:65:22]: Unit
Declared function name: takeFooAndCallProps -> _CN20otherPackageToImport8FooOpen219takeFooAndCallPropsHCNY_Y0_E
Outer decl name: FooOpen2 -> _CN20otherPackageToImport8FooOpen2E
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: takeFooAndCallProps2([not ToString])
Declared method: takeFooAndCallProps2(foo[1, P, ND])[NA, D, AC, NA, accessingViaAbstractClass.cj:31:22]: Unit
Declared function name: takeFooAndCallProps2 -> _CN7default10FooDerived20takeFooAndCallProps2HCN20otherPackageToImport8FooOpen2E
Outer decl name: FooDerived -> _CN7default10FooDerivedE
Receiver: [doesn't implement ToString]
------------------------------
Actual call: takeFooAndCallBar([not ToString])
Declared method: takeFooAndCallBar(foo[1, P, ND])[NA, D, AC, NA, accessingViaAbstractClass.cj:63:17]: Int32
Declared function name: takeFooAndCallBar -> _CN7default11FooDerived217takeFooAndCallBarHCN20otherPackageToImport8FooOpen2E
Outer decl name: FooDerived2 -> _CN7default11FooDerived2E
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: takeFooAndCallBar2([not ToString])
Declared method: takeFooAndCallBar2(foo[1, P, ND])[NA, D, AC, NA, accessingViaAbstractClass.cj:66:17]: Int32
Declared function name: takeFooAndCallBar2 -> _CN7default11FooDerived218takeFooAndCallBar2HCN20otherPackageToImport8FooOpen2E
Outer decl name: FooDerived2 -> _CN7default11FooDerived2E
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: takeFooAndCallFoo([not ToString])
Declared method: takeFooAndCallFoo(foo[1, P, ND])[NA, ND, AC, NA, accessingViaAbstractClass.cj:69:10]: Class-ReturnedBar
Declared function name: takeFooAndCallFoo -> _CN7default11FooDerived236takeFooAndCallFoo$ToMock_FooDerived2HCN20otherPackageToImport8FooOpen2E
Outer decl name: FooDerived2 -> _CN7default11FooDerived2E
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: takeFooAndCallFooDefault([not ToString])
Declared method: takeFooAndCallFooDefault(foo[1, P, ND])[A, D, AC, NA, FooAbstractAndOpenClass.cj:44:17]: Unit
Declared function name: takeFooAndCallFooDefault -> _CN20otherPackageToImport8FooOpen224takeFooAndCallFooDefaultHCNY_Y0_E
Outer decl name: FooOpen2 -> _CN20otherPackageToImport8FooOpen2E
Receiver: [doesn't implement ToString]
------------------------------
Actual call: $p1get()
Declared prop getter: p1()[NA, D, AC, DHS, accessingViaAbstractClass.cj:38:9]: Struct-String
Declared function name: $p1get -> _CN7default10FooDerived2p1pgHv
Outer decl name: FooDerived -> _CN7default10FooDerivedE
Receiver: [doesn't implement ToString]
------------------------------
Return value: mocked str 2
==============================
Actual call: $p2get()
Declared prop getter: p2()[NA, D, AC, HS, accessingViaAbstractClass.cj:45:9]: Struct-String
Declared function name: $p2get -> _CN7default10FooDerived2p2pgHv
Outer decl name: FooDerived -> _CN7default10FooDerivedE
Receiver: [doesn't implement ToString]
------------------------------
Return value: mocked str 3
==============================
Actual call: $p2set("nn")
Declared prop setter: p2(newP2[1, P, ND])[NA, D, AC, NA, accessingViaAbstractClass.cj:49:9]: Unit
Declared function name: $p2set -> _CN7default10FooDerived2p2psHRNat6StringE
Outer decl name: FooDerived -> _CN7default10FooDerivedE
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: takeFooAndCallProps([not ToString])
Declared method: takeFooAndCallProps(foo[1, P, ND])[NA, D, AC, NA, accessingViaAbstractClass.cj:72:17]: Unit
Declared function name: takeFooAndCallProps -> _CN7default11FooDerived219takeFooAndCallPropsHCN20otherPackageToImport8FooOpen2E
Outer decl name: FooDerived2 -> _CN7default11FooDerived2E
Receiver: [doesn't implement ToString]
------------------------------
==============================
Actual call: takeFooAndCallProps2([not ToString])
Declared method: takeFooAndCallProps2(foo[1, P, ND])[NA, D, AC, NA, accessingViaAbstractClass.cj:77:17]: Unit
Declared function name: takeFooAndCallProps2 -> _CN7default11FooDerived220takeFooAndCallProps2HCN20otherPackageToImport8FooOpen2E
Outer decl name: FooDerived2 -> _CN7default11FooDerived2E
Receiver: [doesn't implement ToString]
------------------------------
 */
