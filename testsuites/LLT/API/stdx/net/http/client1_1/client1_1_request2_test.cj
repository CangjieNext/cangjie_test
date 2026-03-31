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
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test Client1_1#request
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import asan.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*
import std.io.*

@Test
class TestClient1_1Request2 {
    // invalid port
    @TestCase
    func client1_1HttpRequest(): Unit {
        let client = ClientBuilder().build()
        try {
            var u = URL.parse("http://127.0.0.1:-20/a")

            let r = HttpRequestBuilder().url(u).build()
            try {
                client.send(r)
            } catch (e: HttpException) {
                @Expect(e.message, "Invalid url address or proxy address.")
            }
        } catch (e: UrlSyntaxException) {
            @Expect(e.message.contains("Port must contain digits only"))
        }
    }

    // invalid port
    @TestCase
    func client1_1HttpRequest2(): Unit {
        try {
            let client = ClientBuilder().httpProxy("http://127.0.0.1:-2").build()
            let u = URL.parse("http://1.1.1.1/a")

            let r = HttpRequestBuilder().url(u).build()
            try {
                client.send(r)
            } catch (e: HttpException) {
                @Expect(e.message, "Invalid url address or proxy address.")
            }
        } catch (e: UrlSyntaxException) {
            @Expect(e.message.contains("Port must contain digits only"))
        }
        println("request_test2_ok")
    }
}

/* SCAN-IN
request_test2_ok
 */
