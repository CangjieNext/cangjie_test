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
        var client = ClientBuilder().httpProxy("http://127.0.0.1:80").build()
        @Assert(client.httpProxy, "http://127.0.0.1:80")
        client.close()
        Process.current.setEnv("http_proxy", "http://127.0.0.1:8080")
        client = ClientBuilder().build()
        @Assert(client.httpProxy, "http://127.0.0.1:8080")
    }

    @TestCase
    func httpsProxy(): Unit {
        var client = ClientBuilder().httpsProxy("http://127.0.0.1:443").build()
        @Assert(client.httpsProxy, "http://127.0.0.1:443")
        client.close()
        Process.current.setEnv("https_proxy", "http://127.0.0.1:8443")
        client = ClientBuilder().build()
        @Assert(client.httpsProxy, "http://127.0.0.1:8443")
    }

    @TestCase
    func noProxy(): Unit {
        var client = ClientBuilder().httpsProxy("http://127.0.0.1:443").noProxy().build()
        @Assert(client.httpsProxy, "")
        client.close()
        Process.current.setEnv("https_proxy", "http://127.0.0.1:8443")
        client = ClientBuilder().noProxy().build()
        @Assert(client.httpsProxy, "")
    }
}
