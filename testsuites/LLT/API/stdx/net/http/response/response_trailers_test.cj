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
 *      Test in HttpResponseBuilder, multiple operations on trailers can implement their expected functions.
 * Test API:
 *          public func trailer(name: String, value: String): HttpResponseBuilder
 *          public func addTrailers (trailers: HttpHeaders): HttpResponseBuilder
 *          public func setTrailers (trailers: HttpHeaders): HttpResponseBuilder
 */

package tests.response

import stdx.net.http.*
import std.collection.ArrayList

@Test
class TestReaponseTrailers {
    @TestCase
    func testResponseTrailers1(): Unit {
        let trailers = HttpHeaders()
        trailers.add("bond", "GG bond")
        trailers.add("language", "cangjie")
        let response = HttpResponseBuilder()
            .version(HTTP1_1)
            .status(200)
            .header("Transfer-Encoding", "chunked")
            .header("Trailer", "bond, language")
            .body("11\r\nhello world\r\n0\r\n")
            .addTrailers(trailers)
            .build()
        let respTrailers = response.trailers
        @Assert(respTrailers.getFirst("bond"), Some("GG bond"))
        @Assert(respTrailers.getFirst("language"), Some("cangjie"))

        let resp = response.toString()
        @Expect(resp.contains("bond: GG bond"))
        @Expect(resp.contains("language: cangjie"))
    }

    @TestCase
    func testResponseTrailers2(): Unit {
        let response = HttpRequestBuilder()
            .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
            .header("trailer", "t1, t2")
            .trailer("t1", "v1, v2")
            .trailer("t2", "v3")
            .build()
        let headers = response.headers
        let trailers = response.trailers
        @Assert(headers.getFirst("trailer"), Some("t1, t2"))
        @Assert(trailers.getFirst("t1"), Some("v1, v2"))
        @Assert(trailers.getFirst("t2"), Some("v3"))
    }

    @TestCase
    func testResponseTrailers3(): Unit {
        let trailers = HttpHeaders()
        trailers.add("bond", "GG bond")
        trailers.add("language", "cangjie")
        let response = HttpResponseBuilder()
            .version(HTTP1_1)
            .status(200)
            .header("Transfer-Encoding", "chunked")
            .header("Trailer", "bond, language")
            .body("11\r\nhello world\r\n0\r\n")
            .trailer("bond", "FF bond")
            .trailer("language", "go")
            .setTrailers(trailers)
            .build()
        let respTrailers = response.trailers
        @Assert(respTrailers.getFirst("bond"), Some("GG bond"))
        @Assert(respTrailers.getFirst("language"), Some("cangjie"))

        let resp = response.toString()
        @Expect(resp.contains("bond: GG bond"))
        @Expect(resp.contains("language: cangjie"))
    }
}
