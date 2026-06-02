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
    public static func st() {
        return "original value `st`"
    }
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        {
            =>
            let stubCall = @EnsurePreparedToMock {=> return (A.st())}
            ConfigureMock.stubFunction(stubCall, [], "A.st", "A.st", #"A.st()"#, 27)
        }().returns("--- mocked value 1 ---")
        println(A.st())
    }
}

/* SCAN-IN
--- mocked value 1 ---
 */
