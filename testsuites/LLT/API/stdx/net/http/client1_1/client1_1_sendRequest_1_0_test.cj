/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test ConnNode#sendRequest
 * Test API:
 *      func sendRequest(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*

@Test
class TestConnNodeSendRequest10Excpetion {
    @TestCase
    func ConnNodeSendRequest10Excpetion(): Unit {
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG

        let u = URL.parse("http://127.0.0.1:80/a")
        let r = HttpRequestBuilder().version(HTTP1_0).url(u).build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "HTTP/1.0 request is not supported.")
        }
        println("send_request_1_0_test")
    }
}

/* SCAN-IN
send_request_1_0_test
 */
