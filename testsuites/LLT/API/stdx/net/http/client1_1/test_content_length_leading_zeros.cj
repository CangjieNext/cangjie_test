/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of Cangjie project, licensed under Apache-2.0
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
 *      Test Content-Length header with leading zeros
 * Test API:
 *      Content-Length validation rejects leading zeros (except "0")
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
class TestContentLengthWithLeadingZeros {
    let client = ClientBuilder().build()

    @TestCase
    func testContentLengthWithLeadingZeros(): Unit {
        // Test that Content-Length header with leading zeros is rejected
        // This tests that leading zeros are not allowed (except "0")
        sleep(Duration.millisecond * 100)
        let u = URL.parse("http://127.0.0.1:80/test")
        
        // Leading zeros should NOT be allowed in Content-Length
        let r = HttpRequestBuilder()
            .url(u)
            .header("Content-Length", "00012")
            .body("test content")
            .build()
        
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "The content-length has leading zeros.")
        }
        
        println("testContentLengthWithLeadingZeros_ok")
    }
    
    @TestCase
    func testContentLengthZero(): Unit {
        // Test that Content-Length header allows "0" (special case)
        // This tests that "0" is the only allowed value starting with '0'
        sleep(Duration.millisecond * 100)
        let u = URL.parse("http://127.0.0.1:80/test")
        
        // "0" should be allowed in Content-Length
        // But we can't test successful connection without server, so we test format validation
        let r = HttpRequestBuilder()
            .url(u)
            .header("Content-Length", "0")
            .build()
        
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: Exception) {
            // If format is valid, we should get connection error, not format error
            @Expect(e.message.contains("Connection refused"), true)
        }
        
        println("testContentLengthZero_ok")
    }
    
    @TestCase
    func testInvalidContentLengthWithLeadingZeros(): Unit {
        // Test that invalid Content-Length with leading zeros is rejected
        // This tests that fix doesn't break validation
        sleep(Duration.millisecond * 100)
        let u = URL.parse("http://127.0.0.1:80/test")
        
        // Invalid: has leading zeros but not "0"
        let r = HttpRequestBuilder()
            .url(u)
            .header("Content-Length", "0012")
            .body("test content")
            .build()
        
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "The content-length has leading zeros.")
        }
        
        println("testInvalidContentLengthWithLeadingZeros_ok")
    }
}
/* SCAN-IN
testContentLengthWithLeadingZeros_ok
testContentLengthZero_ok
testInvalidContentLengthWithLeadingZeros_ok
 */
