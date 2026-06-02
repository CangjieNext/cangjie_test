/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/**
 * Test description:
 *      In the HttpResponseBuilder, the status parameter can be set correctly.
 *      When the input parameter is not in the range of 100 to 599, an exception is thrown.
 * Test API:
 *      public class HttpResponseBuilder
 *          public func status(status: UInt16): HttpResponseBuilder
 *
 * Test API:
 *      public class HttpResponse
 *          public prop status: UInt16
 */

package tests.response

import stdx.net.http.*

@Test
class TestReaponseStatus {
    @TestCase
    func testResponseStatus1(): Unit {
        let headers = HttpHeaders()
        headers.add("content-type", " text/html; charset=UTF-8")
        headers.add("content-length", "12")
        var response = HttpResponseBuilder().version(HTTP1_1).addHeaders(headers).body("status test 1").build()
        let expect = "HTTP/1.1 200 OK\r\ncontent-type: text/html; charset=UTF-8\r\ncontent-length: 12\r\n\r\nbody size: 13\r\n"
        @Expect(response.toString(), expect)
        @Expect(response.status, UInt16(200))
    }

    @TestCase
    func testResponseStatus2(): Unit {
        var response = HttpResponseBuilder().version(HTTP1_1).status(204).build()
        let expect = "HTTP/1.1 204 No Content\r\n\r\n"
        @Expect(response.toString(), expect)
        @Expect(response.status, UInt16(204))
    }

    @TestCase
    func testResponseStatus3(): Unit {
        let headers = HttpHeaders()
        headers.add("content-type", " text/html; charset=UTF-8")
        headers.add("content-length", "12")
        try {
            var _ = HttpResponseBuilder()
                .version(HTTP1_1)
                .status(666)
                .addHeaders(headers)
                .body("status test 2")
                .build()
            throw Exception("status test fail")
        } catch (e: HttpException) {
            let expect = "HttpException: Valid status codes are within the range of 100 to 599."
            @Expect(e.toString(), expect)
        }
    }

    @TestCase
    func testResponseStatus4(): Unit {
        let headers = HttpHeaders()
        headers.add("content-type", " text/html; charset=UTF-8")
        headers.add("content-length", "12")
        try {
            var _ = HttpResponseBuilder().version(HTTP1_1).status(18).addHeaders(headers).body("status test 2").build()
            throw Exception("status test fail")
        } catch (e: HttpException) {
            let expect = "HttpException: Valid status codes are within the range of 100 to 599."
            @Expect(e.toString(), expect)
        }
    }
}
