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
import std.io.*

@Test
class TestConnNodeSendRequestCONNECT6 {
    @TestCase
    func ConnNodeSendRequestCONNECT6(): Unit {
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = "http://127.0.0.1:80/a"

        let header = HttpHeaders()
        header.add("content-Length", "20")
        try {
            client.connect(u, header: header)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "The CONNECT request cannot contain content.")
        }

        header.add("Transfer-Encoding", "chunked")
        try {
            client.connect(u, header: header)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "The content-length and transfer-encoding can not be set together.")
        }

        let header2 = HttpHeaders()
        header2.add("Transfer-Encoding", "chunked")
        try {
            client.connect(u, header: header2)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "The CONNECT request cannot contain content.")
        }

        client.close()
    }
}
