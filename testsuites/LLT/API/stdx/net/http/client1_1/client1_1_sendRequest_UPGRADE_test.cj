/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test upgrade exception
 * Test API:
 *      public func upgrade(req: HttpRequest): (HttpResponse, ?StreamingSocket)
 */
package tests.client1_1

import stdx.net.http.*
import asan.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*
import std.io.*

@Test
class TestConnNodeSendRequestUPGRADE {
    @TestCase
    func ConnNodeSendRequestUPGRADE(): Unit {
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG

        let u = URL.parse("http://127.0.0.1:80/a")
        // send does not support upgrade
        let r = HttpRequestBuilder().url(u).header("upgrade", "websocekt").build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Request header Upgrade is only supported in method upgrade or upgradeFromClient.")
        }
        // upgrade request must have Upgrade
        let r2 = HttpRequestBuilder().url(u).build()
        try {
            client.upgrade(r2)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Request header must contain Upgrade header.")
        }
        // only HTTP/1.1 support upgrade
        let r3 = HttpRequestBuilder().url(u).header("upgrade", "websocekt").version(HTTP1_0).build()
        try {
            client.upgrade(r3)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Only HTTP/1.1 support upgrade.")
        }
        // TRACE with body
        let r4 = HttpRequestBuilder().trace().url(u).header("upgrade", "websocekt").body("ab".toArray()).build()
        try {
            client.upgrade(r4)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "TRACE request can not contain content.")
        }
        // CONNECT
        let r5 = HttpRequestBuilder().url(u).connect().header("upgrade", "websocekt").build()
        try {
            client.upgrade(r5)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "CONNECT request is not supported by upgrade.")
        }

        println("send_request_UPGRADE_test")
    }
}

/* SCAN-IN
send_request_UPGRADE_test
 */
