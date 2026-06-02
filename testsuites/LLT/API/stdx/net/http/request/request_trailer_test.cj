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
 *       Test HttpRequestBuilder
 * Test API:
 *       public func setTrailers(trailers: HttpHeaders): HttpRequestBuilder
 *       public func addTrailers(trailers: HttpHeaders): HttpRequestBuilder
 *       public func trailer(name: String, value: String): HttpRequestBuilder
 */

package tests.request

import std.collection.*
import stdx.net.http.*

@Test
class TestTrailer {
    @TestCase
    func addTrailerWithHeader(): Unit {
        let request = HttpRequestBuilder()
            .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
            .header("trailer", "t1, t2")
            .trailer("t1", "v1, v2")
            .trailer("t2", "v3")
            .build()
        let headers = request.headers
        let trailers = request.trailers
        @Assert(headers.getFirst("trailer"), Some("t1, t2"))
        @Assert(trailers.getFirst("t1"), Some("v1, v2"))
        @Assert(trailers.getFirst("t2"), Some("v3"))
    }

    @TestCase
    func setTrailerWithHeader(): Unit {
        let tt = HttpHeaders()
        tt.add("t2", "v3")
        let request = HttpRequestBuilder()
            .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
            .header("trailer", "t1, t2")
            .trailer("t1", "v1, v2")
            .setTrailers(tt)
            .build()
        let headers = request.headers
        let trailers = request.trailers
        @Assert(headers.getFirst("trailer"), Some("t1, t2"))
        @Assert(trailers.getFirst("t1"), None)
        @Assert(trailers.getFirst("t2"), Some("v3"))
    }
}
