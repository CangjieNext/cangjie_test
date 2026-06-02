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
 *      HttpRawBody#read
 * Test API:
 *       public func read(buf: Array<Byte>): Int64
 */

package tests.body

import stdx.net.http.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestHttpRawBodyRead {
    @TestCase
    func testHttpRawBodyRead(): Unit {
        let req = HttpRequestBuilder().body("hello").build()
        let buf = Array<UInt8>(500, repeat: 0)
        var i = req.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "hello")
        i = req.body.read(buf)
        @Expect(i, 0)
    }

    @TestCase
    func testHttpRawBodyRead2(): Unit {
        let req = HttpRequestBuilder().body("helloolleh").build()
        let buf = Array<UInt8>(5, repeat: 0)
        var i = req.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "hello")
        i = req.body.read(buf)
        @Expect(String.fromUtf8(buf[..i]), "olleh")
        i = req.body.read(buf)
        @Expect(i, 0)
    }
}
