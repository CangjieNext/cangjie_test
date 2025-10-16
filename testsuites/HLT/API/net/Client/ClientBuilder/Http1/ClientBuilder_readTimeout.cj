/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
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
import stdx.encoding.url.*

@Test
public class Test_readTimeout {
    @TestCase
    func default(): Unit {
        let client = ClientBuilder().build()
        @Expect(client.readTimeout, Duration.second * 15)
    }

    @TestCase
    func max(): Unit {
        let client = ClientBuilder().readTimeout(Duration.Max).build()
        @Expect(client.readTimeout, Duration.Max)
    }

    @TestCase
    func zero(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s
            .distributor
            .register(
                "/dd",
                {
                    ctx =>
                    ctx.responseBuilder.body("abc").header("hello", "value")
                    sleep(Duration.second)
                }
            )
        spawn {
            s.serve()
        }
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }
        let client = ClientBuilder().readTimeout(Duration.Zero).build()
        @Expect(client.readTimeout, Duration.second * 0)
        let e = @AssertThrows[HttpTimeoutException](client.get("http://127.0.0.1:${s.port}/dd"))
        @Expect(e.message, "Client1.1 read response timeout and the connection is closed.")
        client.close()
        s.close()
    }

    @TestCase
    func negative(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s
            .distributor
            .register(
                "/dd",
                {
                    ctx =>
                    ctx.responseBuilder.body("abc").header("hello", "value")
                    sleep(Duration.second)
                }
            )
        spawn {
            s.serve()
        }
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }
        let client = ClientBuilder().readTimeout(Duration.nanosecond * -1).build()
        @Expect(client.readTimeout, Duration.Zero)
        let e = @AssertThrows[HttpTimeoutException](client.get("http://127.0.0.1:${s.port}/dd"))
        @Expect(e.message, "Client1.1 read response timeout and the connection is closed.")
        client.close()
        s.close()
    }
}
