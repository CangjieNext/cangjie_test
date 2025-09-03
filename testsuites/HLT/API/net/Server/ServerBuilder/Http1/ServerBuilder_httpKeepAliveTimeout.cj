/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
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
    spawn {
        s.serve()
    }
    while (s.port == 0) {
        sleep(Duration.millisecond)
    }
    let c = ClientBuilder().build()

    let request = HttpRequestBuilder()
        .header("Connection", "keep-alive")
        .method("GET")
        .url("http://127.0.0.1:${s.port}/dd")
        .build()

    let res = c.send(request)
    return res
}

@Test
public class Test_httpKeepAliveTimeout {
    @TestCase
    func default(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        @Expect(server.httpKeepAliveTimeout, Duration.Max)
        server.close()
    }

    @TestCase
    func min(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).httpKeepAliveTimeout(Duration.second * -1).build()
        @Expect(server.httpKeepAliveTimeout, Duration.Zero)
        server.close()
    }

    @TestCase
    func zero(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).httpKeepAliveTimeout(Duration.Zero).build()
        server.distributor.register("/dd", {ctx => ctx.responseBuilder.body("hello")})
        @Expect(server.httpKeepAliveTimeout, Duration.Zero)

        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let c = ClientBuilder().build()

        let request = HttpRequestBuilder()
            .header("Connection", "keep-alive")
            .method("GET")
            .url("http://127.0.0.1:${server.port}/dd")
            .build()

        c.send(request)
        c.send(request)
        server.close()
    }
}
