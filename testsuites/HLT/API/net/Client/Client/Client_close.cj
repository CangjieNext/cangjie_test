/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import stdx.net.tls
import std.collection.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import stdx.net.http.*
import stdx.encoding.url.*

@Test
public class Test_close {
    @TestCase
    func close_and_close(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s.distributor.register("/dd", {ctx => ctx.responseBuilder.header("hello", "value")})
        spawn {
            s.serve()
        }
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }
        var flag = false
        let client = ClientBuilder().build()
        let res = client.get("http://127.0.0.1:${s.port}/dd")
        @Expect(res.status, 200)
        client.close()
        try {
            let res1 = client.get("http://127.0.0.1:${s.port}/dd")
        } catch (e: HttpException) {
            flag = true
            @Expect(e.message.contains("This client has already closed"))
        }
        @Expect(flag, true)
        client.close()
    }

    @TestCase
    func close_and_change_config_of_client(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s.distributor.register("/dd", {ctx => ctx.responseBuilder.header("hello", "value")})
        spawn {
            s.serve()
        }
        while ((s.port == 0)) {
            sleep(Duration.millisecond)
        }
        var flag = false
        let client = ClientBuilder().build()
        client.close()
        client.logger.level = LogLevel.DEBUG
        try {
            let res1 = client.get("http://127.0.0.1:${s.port}/dd")
        } catch (e: HttpException) {
            flag = true
            @Expect(e.message.contains("This client has already closed"))
        }
    }
}
