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

public func st(x: String) {
    return "original value `st2`"
}

public func st(x: Int64) {
    return "original value `st1`"
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        {
            =>
            let matcher0 = Matchers.eq(1)
            let stubCall = @EnsurePreparedToMock {=> return (st(matcher0.value()))}
            ConfigureMock.stubFunction(stubCall, [matcher0.withDescription(#"eq(1)"#)], "st", "st", #"st(1)"#, 27)
        }().returns("--- mocked value 1 ---")
        {
            =>
            let matcher0 = Matchers.eq("aa")
            let stubCall = @EnsurePreparedToMock {=> return (st(matcher0.value()))}
            ConfigureMock.stubFunction(stubCall, [matcher0.withDescription(#"eq("aa")"#)], "st", "st", #"st("aa")"#, 27)
        }().returns("--- mocked value 2 ---")
        println(st(1))
        println(st("aa"))
    }
}

/* SCAN-IN
--- mocked value 1 ---
--- mocked value 2 ---
 */
