/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description: test proxy
 *
 * Test API:
 *
 */

package tests.client

import stdx.net.http.*
import stdx.log.*
import std.unittest.*
import std.unittest.testmacro.*
import std.process.*

@Test
class TestClientProxy {
    @TestCase
    func httpProxy(): Unit {
        try {
            ClientBuilder().httpProxy("127.0.0.1:80").build()
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Proxy must have http scheme.")
        }
        Process.current.setEnv("http_proxy", "https://127.0.0.1:8080")
        try {
            ClientBuilder().build()
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Proxy must have http scheme.")
        }
        Process.current.setEnv("http_proxy", "")
    }

    @TestCase
    func httpsProxy(): Unit {
        try {
            ClientBuilder().httpsProxy("wss://127.0.0.1:443").build()
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Proxy must have http scheme.")
        }
    }

    @TestCase
    func illegalProxy(): Unit {
        let client = ClientBuilder().httpProxy("ws://127.0.0.1:443").noProxy().build()
        @Assert(client.httpProxy, "")
    }
}
