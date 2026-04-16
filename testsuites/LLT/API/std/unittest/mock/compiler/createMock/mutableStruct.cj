/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../helpers
// (CJNATIVE) EXEC: %compiler %pkg_opt -Woff=all -p helpers --mock=on %compile_lib_opt --output p.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt -Woff=all p.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.mock_test_util.*
import std.unittest.*

struct Options<T> {
    var x: T
    init(myX: T) {
        this.x = myX
    }

    mut func mutX(newX: T) {
        this.x = newX
    }
}

class Bar<T> {
    var options: Options<T>

    init(opt: Options<T>) {
        this.options = opt
    }
}

class Boo <: ToString {
    private let n: Int64
    init(n: Int64) {
        this.n = n
    }
    public func toString() {
        "Boo#" + n.toString()
    }
}

class Foo {
    private var pool: Bar<Boo>

    init(p: Bar<Boo>) {
        this.pool = p
    }

    public mut prop p: Boo {
        get() {
            println("p.get is invoked")
            pool.options.x
        }
        set(value) {
            println("p.set is invoked")
            pool.options.x = value
        }
    }

    public func callMut(newX: Boo) {
        println("callMut is invoked")
        pool.options.mutX(newX)
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let mockedBar = unsafe { createMock<Bar<Boo>>(dummyMockingCallHandler) }
        let foo = Foo(mockedBar)
        addMatcher(
            "_CN7default3BarIG_E22options$get$ToMock_BarHv",
            [1, "my str", 3],
            Options<Boo>(Boo(55))
        )
        println(foo.p.toString())
        println("==============================")
    }

    @TestCase
    func case2(): Unit {
        let mockedBar = unsafe { createMock<Bar<Boo>>(dummyMockingCallHandler) }
        let foo = Foo(mockedBar)
        addMatcher(
            "_CN7default3BarIG_E22options$get$ToMock_BarHv",
            [1, "my str", 3],
            Options<Boo>(Boo(55))
        )
        addMatcher(
            "_CN7default3BarIG_E22options$set$ToMock_BarHRNY_7OptionsIG_E",
            [1, "my str", 3],
            ()
        )
        foo.p = Boo(91)
        println("==============================")
    }

    @TestCase
    func case3(): Unit {
        let mockedBar = unsafe { createMock<Bar<Boo>>(dummyMockingCallHandler) }
        let foo = Foo(mockedBar)
        addMatcher(
            "_CN7default3BarIG_E22options$get$ToMock_BarHv",
            [1, "my str", 3],
            Options<Boo>(Boo(56))
        )
        addMatcher(
            "_CN7default3BarIG_E22options$set$ToMock_BarHRNY_7OptionsIG_E",
            [1, "my str", 3],
            ()
        )
        foo.callMut(Boo(46))
        println("==============================")
    }
}

/* SCAN-IN
p.get is invoked
Actual call: options$get()
Declared field getter: options()[NA, ND, AC, HS, mutableStruct.cj:28:9]: Struct-Options<Generics-T>
Declared function name: options$get -> _CN7default3BarIG_E22options$get$ToMock_BarHv
Outer decl name: Bar<default:Boo> -> _CN7default3BarIG_E
Receiver: [doesn't implement ToString]
------------------------------
Boo#55
==============================
p.set is invoked
Actual call: options$get()
Declared field getter: options()[NA, ND, AC, HS, mutableStruct.cj:28:9]: Struct-Options<Generics-T>
Declared function name: options$get -> _CN7default3BarIG_E22options$get$ToMock_BarHv
Outer decl name: Bar<default:Boo> -> _CN7default3BarIG_E
Receiver: [doesn't implement ToString]
------------------------------
Actual call: options$set([not ToString])
Declared field setter: options(newValue[1, P, ND])[NA, D, AC, NA, mutableStruct.cj:28:9]: Unit
Declared function name: options$set -> _CN7default3BarIG_E22options$set$ToMock_BarHRNY_7OptionsIG_E
Outer decl name: Bar<default:Boo> -> _CN7default3BarIG_E
Receiver: [doesn't implement ToString]
------------------------------
==============================
callMut is invoked
Actual call: options$get()
Declared field getter: options()[NA, ND, AC, HS, mutableStruct.cj:28:9]: Struct-Options<Generics-T>
Declared function name: options$get -> _CN7default3BarIG_E22options$get$ToMock_BarHv
Outer decl name: Bar<default:Boo> -> _CN7default3BarIG_E
Receiver: [doesn't implement ToString]
------------------------------
Actual call: options$set([not ToString])
Declared field setter: options(newValue[1, P, ND])[NA, D, AC, NA, mutableStruct.cj:28:9]: Unit
Declared function name: options$set -> _CN7default3BarIG_E22options$set$ToMock_BarHRNY_7OptionsIG_E
Outer decl name: Bar<default:Boo> -> _CN7default3BarIG_E
Receiver: [doesn't implement ToString]
------------------------------
==============================
 */
