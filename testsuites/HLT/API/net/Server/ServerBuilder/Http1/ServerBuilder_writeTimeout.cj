/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run_stdx %output %run_utest_opt %run_args 2>&1 | compare %f
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit

func send_request(s: Server) {
    let client = ClientBuilder().build()

    let request = HttpRequestBuilder().url("http://127.0.0.1:${s.port}/hello").build()

    let response = client.send(request)
    client.close()
    return response
}

@Test
public class Test_writeTimeout {
    @TestCase
    func default(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        @Expect(server.writeTimeout, Duration.Max)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let _ = send_request(server)
        server.close()
    }

    @TestCase
    func max(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).writeTimeout(Duration.Max).build()
        @Expect(server.writeTimeout, Duration.Max)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let _ = send_request(server)
        server.close()
    }

    @TestCase
    func zero(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).writeTimeout(Duration.Zero).build()
        @Expect(server.writeTimeout, Duration.Zero)
        server
            .distributor
            .register("/hello",
                {
                    httpContext => httpContext.responseBuilder.header("foo1", "bar1").body("hello world" * (1000 * 1000))
                })
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        try {
            let _ = send_request(server)
        } catch (e: ConnectionException) {
            @Expect(e.message.contains("Socket is closed"), true)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Failed to connect"), true)
        }
        server.close()
    }

    @TestCase
    func negative(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).writeTimeout(Duration.nanosecond * -1).build()
        @Expect(server.writeTimeout, Duration.Zero)
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        try {
            let _ = send_request(server)
        } catch (e: ConnectionException) {
            @Expect(e.message.contains("Socket is closed"))
        } catch (e: SocketException) {
            @Expect(e.message.contains("Failed to connect"))
        }
        server.close()
    }
}

// ASSERT: scan write response timeout
