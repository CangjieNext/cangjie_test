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
 *       public prop bodySize: Option<Int64>
 */

package tests.request

import std.collection.*
import std.io.*
import stdx.net.http.*

@Test
class TestBodySize {
    @TestCase
    func emptyBodyWithSizeZero(): Unit {
        let request = HttpRequestBuilder()
            .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
            .build()
        @Assert(request.bodySize, Some(0))
    }

    @TestCase
    func rawBodyWithSize(): Unit {
        let request = HttpRequestBuilder()
            .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
            .body("12345".toArray())
            .build()
        @Assert(request.bodySize, Some(5))
    }

    @TestCase
    func httpBodyWithSizeNone(): Unit {
        let request = HttpRequestBuilder()
            .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
            .body(BodyImpl())
            .build()
        @Assert(request.bodySize, None)
    }
}

class BodyImpl <: InputStream {
    public func read(buf: Array<Byte>): Int64 {
        return 0
    }
}
