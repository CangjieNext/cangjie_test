/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run_stdx %output %run_utest_opt %run_args 2>&1 | compare %f
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit

func send_request(s: Server) {
    let client = ClientBuilder().build()
    s.distributor.register(
        "/dd",
        {
            ctx =>
            sleep(Duration.millisecond * 10)
            ctx.responseBuilder.header("hello", "value")
        }
    )
    let request = HttpRequestBuilder().url("http://127.0.0.1:${s.port}/dd").body("hello").build()
    let response = client.send(request)
    return response
}

@Test
public class Test_readTimeout {
    @TestCase
    func default(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        @Expect(server.readTimeout, Duration.Max)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let response = send_request(server)
        @Expect(response.status, 200)
        server.close()
    }

    @TestCase
    func max(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).readTimeout(Duration.Max).build()
        @Expect(server.readTimeout, Duration.Max)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let response = send_request(server)
        @Expect(response.status, 200)
        server.close()
    }

    @TestCase
    func zero(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).readTimeout(Duration.Zero).build()
        @Expect(server.readTimeout, Duration.Zero)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        try {
            let response = send_request(server)
        } catch (e: ConnectionException) {
            @Expect(e.message.contains("socket closed"), true)
        }
        server.close()
    }

    @TestCase
    func negative(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).readTimeout(Duration.nanosecond * -1).build()
        @Expect(server.readTimeout, Duration.Zero)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        try {
            let response = send_request(server)
        } catch (e: ConnectionException) {
            @Expect(e.message.contains("socket closed"), true)
        }
        server.close()
    }
}

// ASSERT: scan read request timeout
