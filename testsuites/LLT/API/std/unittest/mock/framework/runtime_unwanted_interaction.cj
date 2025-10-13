/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (JET) LEVEL:2
// DEPENDENCE: ./utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt -Woff all --output p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

public class A {
    func foo(): Unit {}
    static func bar(): Unit {}
    static mut prop p: Unit {
        get() { () }
        set(_) { }
    }
    static var v: Unit = ()
}

func foo(): Unit {}

var v: Unit = ()

@Test
public class RuntimeUnwantedInteraction {
    let a = mock<A>()

    @TestCase
    func failAfterOneAllowed(): Unit {
        runtimeException<ExpectationFailedException>(
            [
                "Only 1 invocations allowed by stub a.foo() declared",
                "Previous invocations handled by this stub occured at"
            ]
        ) {
            @On(a.foo()).returns(()).once().then().fails()
            a.foo()
            a.foo()
        }
    }

    @TestCase
    func toplevelFunc(): Unit {
        runtimeException<ExpectationFailedException>(
            [
                "<?>.foo()",
                "Explicitly prohibited"
            ]
        ) {
            @On(foo()).fails()
            foo()
        }
    }

    @TestCase
    func toplevelVarGet(): Unit {
        runtimeException<ExpectationFailedException>(
            [
                "<?>.v()",
                "Explicitly prohibited"
            ]
        ) {
            @On(v).fails()
            v
        }
    }

    @TestCase
    func toplevelVarSet(): Unit {
        runtimeException<ExpectationFailedException>(
            [
                "<?>.v(...)",
                "Explicitly prohibited"
            ]
        ) {
            @On(v = _).fails()
            v = ()
        }
    }

    @TestCase
    func staticFunc(): Unit {
        runtimeException<ExpectationFailedException>(
            [
                "A.bar()",
                "Explicitly prohibited",
                "A.bar()"
            ]
        ) {
            @On(A.bar()).fails()
            A.bar()
        }
    }

    @TestCase
    func staticPropGet(): Unit {
        runtimeException<ExpectationFailedException>(
            [
                "A.p()",
                "Explicitly prohibited"
            ]
        ) {
            @On(A.p).fails()
            A.p
        }
    }

    @TestCase
    func staticPropSet(): Unit {
        runtimeException<ExpectationFailedException>(
            [
                "A.p(...)",
                "Explicitly prohibited"
            ]
        ) {
            @On(A.p = _).fails()
            A.p = ()
        }
    }

    @TestCase
    func staticVarGet(): Unit {
        runtimeException<ExpectationFailedException>(
            [
                "A.v()",
                "Explicitly prohibited"
            ]
        ) {
            @On(A.v).fails()
            A.v
        }
    }

    @TestCase
    func staticVarSet(): Unit {
        runtimeException<ExpectationFailedException>(
            [
                "A.v(...)",
                "Explicitly prohibited"
            ]
        ) {
            @On(A.v = _).fails()
            A.v = ()
        }
    }
}
