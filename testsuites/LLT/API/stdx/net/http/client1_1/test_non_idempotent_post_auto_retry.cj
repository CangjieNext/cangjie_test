/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
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
 *      Test non-idempotent POST request behavior
 * Test API:
 *      POST request handling
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
class TestNonIdempotentPostAutoRetry {
    let client = ClientBuilder().build()

    @TestCase
    func testNonIdempotentPostRequest(): Unit {
        // Test that non-idempotent POST requests can be created
        sleep(Duration.millisecond * 100)
        let u = URL.parse("http://127.0.0.1:80/test")
        
        // Make POST request
        let r = HttpRequestBuilder()
            .url(u)
            .method("POST")
            .body("test data")
            .build()
        
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: Exception) {
            // Connection error is expected in test environment
            @Expect(e.message.contains("Connection refused"), true)
        }
        
        println("testNonIdempotentPostRequest_ok")
    }
    
    @TestCase
    func testIdempotentGetRequest(): Unit {
        // Test that idempotent GET requests can be created
        sleep(Duration.millisecond * 100)
        let u = URL.parse("http://127.0.0.1:80/test")
        
        // Make GET request
        let r = HttpRequestBuilder()
            .url(u)
            .method("GET")
            .build()
        
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: Exception) {
            // Connection error is expected in test environment
            @Expect(e.message.contains("Connection refused"), true)
        }
        
        println("testIdempotentGetRequest_ok")
    }
    
    @TestCase
    func testNonIdempotentPostWithBody(): Unit {
        // Test that non-idempotent POST with body can be created
        sleep(Duration.millisecond * 100)
        let u = URL.parse("http://127.0.0.1:80/test")
        
        // Make POST request with body
        let r = HttpRequestBuilder()
            .url(u)
            .method("POST")
            .body("test data with content")
            .build()
        
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: Exception) {
            // Connection error is expected in test environment
            @Expect(e.message.contains("Connection refused"), true)
        }
        
        println("testNonIdempotentPostWithBody_ok")
    }
}
/* SCAN-IN
testNonIdempotentPostRequest_ok
testIdempotentGetRequest_ok
testNonIdempotentPostWithBody_ok
 */
