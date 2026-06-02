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
 *       Test HttpRequest
 * Test API:
 *       public override func toString(): String
 */

package tests.request

import stdx.net.http.{HttpRequestBuilder, Protocol}

@Test
class TestToString1 {
    @TestCase
    func setTrailerWithHeader(): Unit {
        let expectStr = "GET /path HTTP/1.1\r\nhost: www.example.com\r\n\r\nbody size: 5\r\nbar: foo\r\n\r\n"
        let request = HttpRequestBuilder()
            .version(HTTP1_1)
            .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
            .header("host", "www.example.com")
            .trailer("bar", "foo")
            .body("hello")
            .build()
        @Assert(request.toString(), expectStr)
    }

    @TestCase
    func requestMethodConnect1(): Unit {
        let expectStr = "CONNECT www.example.com:8080 HTTP/1.1\r\nhost: www.example.com\r\n\r\nbody size: 5\r\nbar: foo\r\n\r\n"
        let request = HttpRequestBuilder()
            .method("CONNECT")
            .version(HTTP1_1)
            .url("http://www.example.com:8080")
            .header("host", "www.example.com")
            .trailer("bar", "foo")
            .body("hello")
            .build()
        @Assert(request.toString(), expectStr)
    }

    @TestCase
    func requestMethodConnect2(): Unit {
        let expectStr = "CONNECT www.example.com HTTP/1.1\r\nhost: www.example.com\r\n\r\nbody size: 5\r\nbar: foo\r\n\r\n"
        let request = HttpRequestBuilder()
            .method("CONNECT")
            .version(HTTP1_1)
            .url("http://www.example.com")
            .header("host", "www.example.com")
            .trailer("bar", "foo")
            .body("hello")
            .build()
        @Assert(request.toString(), expectStr)
    }
}
