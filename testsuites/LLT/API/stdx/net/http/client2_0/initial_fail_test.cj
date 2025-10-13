/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *
 * Test API:
 *
 */

package tests.client2_0

import stdx.net.http.*
import stdx.crypto.kit
import stdx.log.*
import std.io.*
import std.time.*
import std.net.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.encoding.url.*
import asan.*

@Test
class TestFail {
    @TestCase
    func testConnect(): Unit {
        let client = ClientBuilder().build()
        let u = URL.parse("ws://127.0.0.1:80/")
        try {
            WebSocket.upgradeFromClient(client, u, version: HTTP2_0)
        } catch (e: HttpException) {
            @Assert(e.message, "HTTP/2 is not enabled.")
        }
    }
}
