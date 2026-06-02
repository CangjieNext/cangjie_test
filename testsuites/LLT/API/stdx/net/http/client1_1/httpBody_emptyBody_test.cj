/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test HttpEmptyBody
 * Test API:
 *      public func read(_: Array<Byte>): Int64
 *      public prop length: Int64
 */

package tests.client1_1

import stdx.net.http.*
import asan.*
import std.io.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestRawBody {
    @TestCase
    func rawBody(): Unit {
        let request = HttpRequestBuilder().url("http://www.example.com:8080/path").build()
        let buf = Array<UInt8>(10, repeat: 0)
        let i = request.body.read(buf)
        @Expect(sizeOf(request.body), 0)
        @Expect(i, 0)
    }
}

func sizeOf(inputStream: InputStream): ?Int64 {
    match (inputStream) {
        case s: Seekable =>
            if (s.remainLength >= 0) {
                return s.remainLength
            }
            return None
        case _ => return None
    }
}
