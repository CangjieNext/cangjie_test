/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
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

var flag = 0

@Test
public class Test_close {
    @TestCase
    func close(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s
            .distributor
            .register(
                "/dd",
                {
                    ctx =>
                    ctx.responseBuilder.body("hello")
                    sleep(Duration.second * 2)
                    println("2 second after")
                }
            )
        spawn {
            s.serve()
        }
        while (s.port == 0) {
            sleep(Duration.millisecond)
        }

        let c = ClientBuilder().build()

        let req = HttpRequestBuilder().url("http://127.0.0.1:${s.port}/dd").build()

        spawn {
            c.send(req)
            flag = 1
        }
        while (flag == 0) {
            sleep(Duration.millisecond)
        }
        s.closeGracefully()
    }
}

// ASSERT: scan 2 second after
