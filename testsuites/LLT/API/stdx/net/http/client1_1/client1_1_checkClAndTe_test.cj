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
 *      Test Client1_1#checkRequest1_1
 * Test API:
 *      func checkClAndTe(headers: HttpHeaders): (?Int64, Bool)
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
class TestClient1_1CheckClAndTe {
    let client = ClientBuilder().build()

    @TestCase
    func client1_1CheckClAndTe(): Unit {
        sleep(Duration.millisecond * 100)
        let u = URL.parse("http://127.0.0.1:80/a")
        // chunked is not the last value of Transfer-Encoding field
        let r = HttpRequestBuilder()
            .url(u)
            .header("transfer-encoding", "chunked")
            .header("transfer-encoding", "foo")
            .build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "The last value of transfer-encoding must be chunked.")
        }
        // chunked has been set more than once
        let r2 = HttpRequestBuilder()
            .url(u)
            .header("transfer-encoding", "chunked")
            .header("transfer-encoding", "chunked")
            .build()
        try {
            client.send(r2)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Chunked should not be set more than once.")
        }
        // invalid Content-Length value
        let r3 = HttpRequestBuilder().url(u).header("Content-Length", "chunked").build()
        try {
            client.send(r3)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "The content-length invalid.")
        }
        // conflict Content-Length value
        let r4 = HttpRequestBuilder().url(u).header("Content-Length", "12").header("Content-Length", "13").build()
        try {
            client.send(r4)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "The content-length should not has different values.")
        }

        println("checkClAndTe_test_ok")
    }
}
/* SCAN-IN
checkClAndTe_test_ok
 */
