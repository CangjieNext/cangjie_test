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
 *       public func body(body: Array<UInt8>): HttpRequestBuilder
 *       public func body(body: InputStream): HttpRequestBuilder
 */

package tests.request

import stdx.net.http.*
import std.io.*

@Test
class TestBody {
    @TestCase
    func rawBody(): Unit {
        let request = HttpRequestBuilder()
            .version(HTTP1_1)
            .url("http://www.example.com:8080/path")
            .body("raw body".toArray())
            .build()
        let expect = "GET /path HTTP/1.1\r\n\r\nbody size: 8\r\n"
        @Assert(request.toString(), expect)
    }

    @TestCase
    func httpBody(): Unit {
        let body = Body("http body".toArray())
        let request = HttpRequestBuilder().version(HTTP1_1).url("http://www.example.com:8080/path").body(body).build()
        let expect = "GET /path HTTP/1.1\r\n\r\nunknown body size\r\n"
        @Assert(request.toString(), expect)
    }

    @TestCase
    func httpBodyWithContentLength(): Unit {
        let body = Body("http body".toArray())
        let request = HttpRequestBuilder()
            .version(HTTP1_1)
            .url("http://www.example.com:8080/path")
            .header("content-length", "20")
            .body(body)
            .build()
        let expect = "GET /path HTTP/1.1\r\ncontent-length: 20\r\n\r\nunknown body size\r\n"
        @Assert(request.toString(), expect)
    }
}

class Body <: InputStream {
    var index = 0
    Body(let data: Array<UInt8>) {}
    public func read(arr: Array<UInt8>): Int64 {
        var readLen = arr.size
        if (data.size - index < arr.size) {
            readLen = data.size - index
        }
        data.copyTo(arr, 0, 0, readLen)
        index += readLen
        return readLen
    }
}
