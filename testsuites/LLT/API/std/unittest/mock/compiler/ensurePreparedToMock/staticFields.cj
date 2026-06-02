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
    public static let gkgggf = "some value"
    public static var gkgggf2 = "some value"
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        {
            =>
            let stubCall = @EnsurePreparedToMock {=> return (A.gkgggf)}
            ConfigureMock.stubFunction(stubCall, [], "A.gkgggf", "A.gkgggf", #"A.gkgggf"#, 27)
        }().returns("--- mocked value 1 ---")
        println(A.gkgggf)
    }

    @TestCase
    func case2(): Unit {
        {
            =>
            let stubCall = @EnsurePreparedToMock {=> return (A.gkgggf2)}
            ConfigureMock.stubFunction(stubCall, [], "A.gkgggf2", "A.gkgggf2", #"A.gkgggf2"#, 27)
        }().returns("--- mocked value 2 ---")
        println(A.gkgggf2)
        {
            =>
            let matcher0 = Matchers.any()
            let stubCall = @EnsurePreparedToMock {=> return (A.gkgggf2 = matcher0.value())}
            ConfigureMock.stubSetter(stubCall, {=> A.gkgggf2}, matcher0, "A", "g2", #"A.g2 = _"#, 36)
        }().doesNothing()
        A.gkgggf2 = "931"
        println("--- no setter invoked ---")
        println(A.gkgggf2)
    }

    @TestCase
    func case3(): Unit {
        A.gkgggf2 = "93" // previous stubs shouldn't be used here
        println(A.gkgggf2)
    }
}

/* SCAN-IN
--- mocked value 1 ---
--- mocked value 2 ---
--- no setter invoked ---
--- mocked value 2 ---
93
 */
