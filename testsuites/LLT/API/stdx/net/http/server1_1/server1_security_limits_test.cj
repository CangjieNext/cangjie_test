/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *       Test HTTP security limits (M-5)
 *       Test whether the server returns a 431 response after receiving a request
 *       whose header count exceeds the limit (DEFAULT_MAX_HEADER_COUNT = 100).
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.log.*
import std.net.TcpSocket

@Test
class TestHttpSecurityLimits {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    // M-5: Server header count limit test
    @TestCase
    func test_M5_server_header_count_limit(): Unit {
        startServer()
        server.logger.level = LogLevel.WARN
        server.distributor.register("/test", {_ => ()})
        port = server.port

        // Send request with more than 100 headers (DEFAULT_MAX_HEADER_COUNT)
        let client = TcpSocket("127.0.0.1", port)
        client.connect()

        var request = "GET /test HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\n"
        // Add 105 headers to exceed the limit of 100
        for (i in 0..105) {
            request += "X-Header-${i}: value${i}\r\n"
        }
        request += "\r\n"
        
        client.write(request.toArray())
        sleep(Duration.millisecond * 300)

        let arr = Array<UInt8>(2000, repeat: 0)
        let len = client.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        
        // Should return 431 Request Header Fields Too Large
        @Expect(resp.contains("431"))
        
        client.close()
    }

    // Test that normal requests still work within limits
    @TestCase
    func test_normal_requests_within_limits(): Unit {
        port = server.port
        server.distributor.register("/normal", {req => 
            let resp = HttpResponseBuilder()
                .status(200)
                .body("Hello World")
                .build()
            resp
        })

        // Send normal request with reasonable headers
        let client = TcpSocket("127.0.0.1", port)
        client.connect()

        let request = "GET /normal HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nX-Custom: value\r\n\r\n"
        client.write(request.toArray())
        sleep(Duration.millisecond * 200)

        let arr = Array<UInt8>(1000, repeat: 0)
        let len = client.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        
        // Should succeed
        @Expect(resp.contains("HTTP/1.1 200 OK"))
        
        client.close()
        server.close()
    }

    func startServer(): Unit {
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 200)
    }
}

// ASSERT:scan Header count out of limit
