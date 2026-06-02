/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// DEPENDENCE: ./line_number_utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt -p line_number_utils --mock=on %compile_lib_opt --output p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import line_number_utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

class A {
    func a(): String {
        return "original"
    }

    func b(i: Int64): String {
        return "original"
    }
}

@Test
public class SuppressedRuntimeFailure {
    @TestCase
    func corruptedLogPostcheck(): Unit {
        exceptionOnSessionClose<MockFrameworkException>(
            [
                "Invocation log contains errors",
                "Original error:",
                "Unhandled invocation"
            ]
        ) {
            let a = mock<A>()
            suppress {a.a()}
        }

        exceptionOnSessionClose<MockFrameworkException>(
            [
                "Invocation log contains errors",
                "Original error:",
                "Unhandled invocation",
                "None of the following stubs matched"
            ]
        ) {
            let a = mock<A>()
            @On(a.b(10)).returns("b").anyTimes()
            suppress {a.b(5)}
        }

        exceptionOnSessionClose<MockFrameworkException>(
            [
                "Invocation log contains errors",
                "Original error:",
                "Unwanted interaction"
            ]
        ) {
            let a = mock<A>()
            @On(a.b(10)).fails()
            suppress {a.b(10)}
        }

        exceptionOnSessionClose<MockFrameworkException>(
            [
                "Invocation log contains errors",
                "Original error:",
                "Too many invocations"
            ]
        ) {
            let a = mock<A>()
            @On(a.a()).returns("b").times(2)
            a.a()
            a.a()
            suppress {a.a()}
        }
    }

    @TestCase
    func verifyCorruptedLog(): Unit {
        runtimeException<MockFrameworkException>(
            [
                "Invocation log contains errors",
                "Original error:",
                "Unhandled invocation"
            ]
        ) {
            let a = mock<A>()
            suppress {a.a()}
            Verify.ordered(@Called(a.a()))
        }

        runtimeException<MockFrameworkException>(
            [
                "Invocation log contains errors",
                "Original error:",
                "Unhandled invocation",
                "None of the following stubs matched"
            ]
        ) {
            let a = mock<A>()
            @On(a.b(10)).returns("b").anyTimes()
            suppress {a.b(5)}
            Verify.that(@Called(a.b(5)))
        }

        runtimeException<MockFrameworkException>(
            [
                "Invocation log contains errors",
                "Original error:",
                "Unwanted interaction"
            ]
        ) {
            let a = mock<A>()
            @On(a.b(10)).fails()
            suppress {a.b(10)}
            Verify.unordered(@Called(a.b(5)))
        }
    }
}

func suppress(body: () -> Unit) {
    try {
        body()
    } catch (e: Exception) {
        // do nothing
    }
}
