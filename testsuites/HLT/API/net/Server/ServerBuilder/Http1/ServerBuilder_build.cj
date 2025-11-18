/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*

@Test
public class Test_build {
    @TestCase
    func only_port(): Unit {
        var flag = false
        try {
            let server = ServerBuilder().port(0).build()
        } catch (e: IllegalArgumentException) {
            flag = true
            @Expect(e.message.contains("The IP address number is not set."))
        }
        @Expect(flag, true)
    }

    @TestCase
    func only_addr(): Unit {
        var flag = false
        try {
            let server = ServerBuilder().addr("127.0.0.1").build()
        } catch (e: IllegalArgumentException) {
            flag = true
            @Expect(e.message.contains("The port number is not set."))
        }
        @Expect(flag, true)
    }
}
