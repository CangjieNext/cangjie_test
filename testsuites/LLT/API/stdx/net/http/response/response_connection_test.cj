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
 *      Test The close parameter in HttpResponse can accurately indicate whether
 *      the connection is closed after the response is sent.
 * Test API:
 *          public prop close: Bool
 */

package tests.response

import stdx.net.http.*

@Test
class TestReaponseConnection {
    @TestCase
    func testResponseConnection1(): Unit {
        var output = "keep-alive"
        let headers = HttpHeaders()
        headers.add("content-type", " text/html; charset=UTF-8")
        headers.add("content-length", "12")
        headers.add("connection", "te, close")
        headers.add("te", "trailers, deflate;q=0.5")
        var response = HttpResponseBuilder()
            .version(HTTP1_1)
            .status(200)
            .addHeaders(headers)
            .body("close test 1")
            .build()
        println(response.toString())
        if (!response.isPersistent) {
            output = "close"
        }
        @Assert(output,"close")
    }

    @TestCase
    func testResponseConnection2(): Unit {
        var output = "keep-alive"
        let headers = HttpHeaders()
        headers.add("content-type", " text/html; charset=UTF-8")
        headers.add("content-length", "12")
        headers.add("connection", "keep-alive")
        var response = HttpResponseBuilder()
            .version(HTTP1_1)
            .status(200)
            .addHeaders(headers)
            .body("close test 2")
            .build()
        if (!response.isPersistent) {
            output = "close"
        }
        @Assert(output,"keep-alive")
    }

    @TestCase
    func testResponseConnection3(): Unit {
        var output = "keep-alive"
        let headers = HttpHeaders()
        headers.add("content-type", " text/html; charset=UTF-8")
        headers.add("content-length", "12")
        var response = HttpResponseBuilder()
            .version(HTTP1_1)
            .status(200)
            .addHeaders(headers)
            .body("close test 3")
            .build()
        if (!response.isPersistent) {
            output = "close"
        }
        @Assert(output,"keep-alive")
    }
}
