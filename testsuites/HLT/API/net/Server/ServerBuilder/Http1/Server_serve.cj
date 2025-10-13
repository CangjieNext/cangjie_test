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

func response(s: Server): HttpResponse {
    let request = HttpRequestBuilder().url("http://127.0.0.1:${s.port}/dd").build()
    let client = ClientBuilder().build()
    let response = client.send(request)
    return response
}

func serve() {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()

    server.distributor.register("/dd", {ctx => ctx.responseBuilder.body("hello")})
    return server
}

@Test
public class Test_serve {
    @TestCase
    func serve_success(): Unit {
        let s = serve()
        spawn {
            s.serve()
        }
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }
        let res = response(s)
        @Expect(res.toString().contains("HTTP/1.1 200 OK"), true)
        s.close()
    }

    @TestCase
    func multi_serve(): Unit {
        var flag = false
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        spawn {
            s.serve()
        }
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }
        try {
            s.serve()
        } catch (e: Exception) {
            flag = true
            @Expect(e.message, "The socket is already bound")
        }
        s.close()
        @Expect(flag, true)
    }

    @TestCase
    func close_and_restart(): Unit {
        var flag = false
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        spawn {
            s.serve()
        }
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }
        s.close()
        try {
            s.serve()
        } catch (e: SocketException) {
            flag = true
            @Expect(e.message, "Socket is already closed")
        }
        @Expect(flag, true)
    }

    @TestCase
    func close_and_get_addr(): Unit {
        var flag = false
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        spawn {
            s.serve()
        }
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }
        s.close()
        try {
            let a = s.addr
        } catch (e: SocketException) {
            flag = true
            @Expect(e.message, "Socket is already closed")
        }
        @Expect(flag, true)
    }

    @TestCase
    func close_and_register(): Unit {
        let s = ServerBuilder().addr("127.0.0.0").port(12345).build()
        spawn {
            s.serve()
        }
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }
        s.close()

        let s1 = ServerBuilder().addr("127.0.0.0").port(12345).build()
        spawn {
            s1.serve()
        }
        @Expect(s1.port, 12345)
        @Expect(s1.addr, "127.0.0.0")
    }
}
