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
import std.collection.*
import std.unittest.testmacro.*

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

class Bar1 <: Hashable & Equatable<Bar1> {
    public override func hashCode(): Int64 {
        0
    }
    public operator override func ==(other: Bar1): Bool {
        true
    }

    public operator override func !=(other: Bar1): Bool {
        true
    }
}

class Bar2<K> <: Hashable & Equatable<Bar2<K>> {
    public override func hashCode(): Int64 {
        0
    }
    public operator override func ==(other: Bar2<K>): Bool {
        true
    }

    public operator override func !=(other: Bar2<K>): Bool {
        true
    }
}

class Foo1 {
    public func foo1(x: PassedBar, y: PassedAnotherBar): Array<Bar1> {
        [Bar1()]
    }
    public func foo2(): Array<Bar2<Array<Bar1>>> {
        return [Bar2()]
    }
}

class Foo2 {
    public func foo1(x: PassedBar, y: PassedAnotherBar): ArrayList<Bar1> {
        ArrayList.of(Bar1())
    }
    public func foo2(): ArrayList<ArrayList<Array<Bar1>>> {
        return ArrayList(ArrayList([]))
    }
}

class Foo3 {
    public func foo1(x: PassedBar, y: PassedAnotherBar): HashSet<Bar1> {
        HashSet(Bar1())
    }
    public func foo2(): HashSet<Bar2<HashSet<Bar1>>> {
        return HashSet(Bar2())
    }
}

class Foo4 {
    public func foo1(x: PassedBar, y: PassedAnotherBar): HashMap<Bar1, HashSet<Bar1>> {
        HashMap((Bar1(), HashSet(Bar1())))
    }
    public func foo2(): HashMap<Bar1, HashMap<Bar1, Bar1>> {
        return HashMap((Bar1(), HashMap((Bar1(), Bar1()))))
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let mockedFoo = unsafe { createMock<Foo1>(dummyMockingCallHandler) }
        setReturnDefaultMode()

        let x1 = mockedFoo.foo1(PassedBar(), PassedAnotherBar())
        let result1 = if (x1.size == 0) {
            "[Empty]"
        } else {
            "[Not empty]"
        }
        println("Return value of foo1: `" + result1 + "`")
        let x2 = mockedFoo.foo2()
        let result2 = if (x2.size == 0) {
            "[Empty]"
        } else {
            "[Not empty]"
        }
        println("Return value of foo2: `" + result2 + "`")
    }

    @TestCase
    func case2(): Unit {
        let mockedFoo = unsafe { createMock<Foo2>(dummyMockingCallHandler) }
        setReturnDefaultMode()

        let x1 = mockedFoo.foo1(PassedBar(), PassedAnotherBar())
        let result1 = if (x1.size == 0) {
            "[Empty]"
        } else {
            "[Not empty]"
        }
        println("Return value of foo1: `" + result1 + "`")
        let x2 = mockedFoo.foo2()
        let result2 = if (x2.size == 0) {
            "[Empty]"
        } else {
            "[Not empty]"
        }
        println("Return value of foo2: `" + result2 + "`")
    }

    @TestCase
    func case3(): Unit {
        let mockedFoo = unsafe { createMock<Foo3>(dummyMockingCallHandler) }
        setReturnDefaultMode()

        let x1 = mockedFoo.foo1(PassedBar(), PassedAnotherBar())
        let result1 = if (x1.size == 0) {
            "[Empty]"
        } else {
            "[Not empty]"
        }
        println("Return value of foo1: `" + result1 + "`")
        let x2 = mockedFoo.foo2()
        let result2 = if (x2.size == 0) {
            "[Empty]"
        } else {
            "[Not empty]"
        }
        println("Return value of foo2: `" + result2 + "`")
    }

    @TestCase
    func case4(): Unit {
        let mockedFoo = unsafe { createMock<Foo4>(dummyMockingCallHandler) }
        setReturnDefaultMode()

        let x1 = mockedFoo.foo1(PassedBar(), PassedAnotherBar())
        let result1 = if (x1.size == 0) {
            "[Empty]"
        } else {
            "[Not empty]"
        }
        println("Return value of foo1: `" + result1 + "`")
        let x2 = mockedFoo.foo2()
        let result2 = if (x2.size == 0) {
            "[Empty]"
        } else {
            "[Not empty]"
        }
        println("Return value of foo2: `" + result2 + "`")
    }
}

/* SCAN-IN
-------- Called with ReturnDefault --------
Actual call: foo1("This is Bar", "This is AnotherBar")
Declared method: foo1(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, collections.cj:57:17]: Struct-Array<Class-Bar1>
Declared function name: foo1 -> _CN7default4Foo14foo1HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo1 -> _CN7default4Foo1E
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo1: `[Empty]`
-------- Called with ReturnDefault --------
Actual call: foo2()
Declared method: foo2()[NA, D, AC, NA, collections.cj:60:17]: Struct-Array<Class-Bar2<Struct-Array<Class-Bar1>>>
Declared function name: foo2 -> _CN7default4Foo14foo2Hv
Outer decl name: Foo1 -> _CN7default4Foo1E
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo2: `[Empty]`
-------- Called with ReturnDefault --------
Actual call: foo1("This is Bar", "This is AnotherBar")
Declared method: foo1(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, collections.cj:66:17]: Class-ArrayList<Class-Bar1>
Declared function name: foo1 -> _CN7default4Foo24foo1HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo2 -> _CN7default4Foo2E
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo1: `[Empty]`
-------- Called with ReturnDefault --------
Actual call: foo2()
Declared method: foo2()[NA, D, AC, NA, collections.cj:69:17]: Class-ArrayList<Class-ArrayList<Struct-Array<Class-Bar1>>>
Declared function name: foo2 -> _CN7default4Foo24foo2Hv
Outer decl name: Foo2 -> _CN7default4Foo2E
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo2: `[Empty]`
-------- Called with ReturnDefault --------
Actual call: foo1("This is Bar", "This is AnotherBar")
Declared method: foo1(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, collections.cj:75:17]: Class-HashSet<Class-Bar1>
Declared function name: foo1 -> _CN7default4Foo34foo1HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo3 -> _CN7default4Foo3E
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo1: `[Empty]`
-------- Called with ReturnDefault --------
Actual call: foo2()
Declared method: foo2()[NA, D, AC, NA, collections.cj:78:17]: Class-HashSet<Class-Bar2<Class-HashSet<Class-Bar1>>>
Declared function name: foo2 -> _CN7default4Foo34foo2Hv
Outer decl name: Foo3 -> _CN7default4Foo3E
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo2: `[Empty]`
-------- Called with ReturnDefault --------
Actual call: foo1("This is Bar", "This is AnotherBar")
Declared method: foo1(x[1, P, ND], y[2, P, ND])[NA, D, AC, NA, collections.cj:84:17]: Class-HashMap<Class-Bar1, Class-HashSet<Class-Bar1>>
Declared function name: foo1 -> _CN7default4Foo44foo1HCNY_9PassedBarECNY_16PassedAnotherBarE
Outer decl name: Foo4 -> _CN7default4Foo4E
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo1: `[Empty]`
-------- Called with ReturnDefault --------
Actual call: foo2()
Declared method: foo2()[NA, D, AC, NA, collections.cj:87:17]: Class-HashMap<Class-Bar1, Class-HashMap<Class-Bar1, Class-Bar1>>
Declared function name: foo2 -> _CN7default4Foo44foo2Hv
Outer decl name: Foo4 -> _CN7default4Foo4E
Receiver: [doesn't implement ToString]
------------------------------
Return value of foo2: `[Empty]`
 */
