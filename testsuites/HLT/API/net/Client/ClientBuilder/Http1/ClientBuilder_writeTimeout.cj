/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %export cjHeapSize=4GB && %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import stdx.encoding.url.*

@Test
public class Test_writeTimeout {
    @TestCase
    func default(): Unit {
        let client = ClientBuilder().build()
        @Expect(client.writeTimeout, Duration.second * 15)
    }

    @TestCase
    func max(): Unit {
        let client = ClientBuilder().writeTimeout(Duration.Max).build()
        @Expect(client.writeTimeout, Duration.Max)
    }

    @TestCase
    @Skip // writeTimeout 结果受环境影响波动大
    func zero(): Unit {
        let body = "s" * 1024 * 1024 * 150
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s
            .distributor
            .register(
                "/dd",
                {
                    ctx =>
                    ctx.request.body.read(Array<UInt8>(5, repeat: 0))
                    ctx.responseBuilder.body("ok")
                    sleep(Duration.second)
                }
            )
        spawn {
            s.serve()
        }
        sleep(Duration.second)
        let client = ClientBuilder().writeTimeout(Duration.Zero).build()
        @Expect(client.writeTimeout, Duration.second * 0)
        let request = HttpRequestBuilder()
            .body(body)
            .url("http://127.0.0.1:${s.port}/dd")
            .header("expect", "100-continue")
            .build()
        let e = @AssertThrows[HttpTimeoutException](client.send(request))
        @Expect(e.message.contains("Client1.1 write request timeout and the connection is closed"))
        client.close()
        s.close()
    }

    @TestCase
    @Skip // writeTimeout 结果受环境影响波动大
    func negative(): Unit {
        let body = "s" * 1024 * 1024 * 150
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s
            .distributor
            .register(
                "/dd",
                {
                    ctx =>
                    ctx.request.body.read(Array<UInt8>(5, repeat: 0))
                    ctx.responseBuilder.body("ok")
                    sleep(Duration.second)
                }
            )
        spawn {
            s.serve()
        }
        sleep(Duration.second)
        let client = ClientBuilder().writeTimeout(Duration.nanosecond * -1).build()
        @Expect(client.writeTimeout, Duration.Zero)
        let request = HttpRequestBuilder().body(body).url("http://127.0.0.1:${s.port}/dd").build()
        let e = @AssertThrows[HttpTimeoutException](client.send(request))
        @Expect(e.message.contains("Client1.1 write request timeout and the connection is closed"))
        client.close()
        s.close()
    }
}
