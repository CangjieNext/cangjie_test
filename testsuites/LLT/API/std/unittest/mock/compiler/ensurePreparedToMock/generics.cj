/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt --mock=on 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

public class A {
    public static func st<T>(x: T) {
        return "original value `st`"
    }
}

public func st2<T>(x: T) {
    return "original value `st2`"
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        {
            =>
            let matcher0 = Matchers.any()
            let stubCall = @EnsurePreparedToMock {=> return (A.st<Int64>(matcher0.value()))}
            ConfigureMock.stubFunction(stubCall, [matcher0.withDescription(#"any()"#)], "A.st", "A.st",
                #"A.st<Int64>(_, _)"#, 27)
        }().returns("--- mocked value 1 ---")
        println(A.st(22))
    }
    @TestCase
    func case2(): Unit {
        {
            =>
            let matcher0 = Matchers.any()
            let stubCall = @EnsurePreparedToMock {=> return (st2<String>(matcher0.value()))}
            ConfigureMock.stubFunction(stubCall, [matcher0.withDescription(#"any()"#)], "st2", "st2",
                #"st2<String>(_, _)"#, 27)
        }().returns("--- mocked value 2 ---")
        println(st2("ff"))
    }
}

/* SCAN-IN
--- mocked value 1 ---
--- mocked value 2 ---
 */
