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
    public static prop g: String {
        get() {
            "some value"
        }
    }
    public mut static prop g2: String {
        get() {
            "some value 2"
        }
        set(v) {
            println("--- original setter ---")
        }
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        {
            =>
            let stubCall = @EnsurePreparedToMock {=> return (A.g)}
            ConfigureMock.stubFunction(stubCall, [], "A.g", "A.g", #"A.g"#, 27)
        }().returns("--- mocked value 1 ---")
        println(A.g)
    }
    @TestCase
    func case2(): Unit {
        {
            =>
            let stubCall = @EnsurePreparedToMock {=> return (A.g2)}
            ConfigureMock.stubFunction(stubCall, [], "A.g2", "A.g2", #"A.g2"#, 27)
        }().returns("--- mocked value 2 ---")
        println(A.g2)
        {
            =>
            let matcher0 = Matchers.any()
            let stubCall = @EnsurePreparedToMock {=> return (A.g2 = matcher0.value())}
            ConfigureMock.stubSetter(stubCall, {=> A.g2}, matcher0, "A", "g2", #"A.g2 = _"#, 36)
        }().doesNothing()
        A.g2 = "93"
        println("--- no setter invoked ---")
    }

    @TestCase
    func case3(): Unit {
        A.g2 = "93" // previous stubs shouldn't be used here
    }
}

/* SCAN-IN
--- mocked value 1 ---
--- mocked value 2 ---
--- no setter invoked ---
--- original setter ---
 */
