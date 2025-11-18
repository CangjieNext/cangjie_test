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
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.runtime.*

let count = AtomicInt64(0)

@Test
public class Test_close {
    @TestCase
    func close(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s.distributor.register(
            "/dd",
            {
                ctx =>
                sleep(Duration.second * 5)
                count.fetchAdd(1)
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

        var b = spawn {
            try {
                c.send(req)
            } catch (e: SocketException) {
                @Expect(e.message.contains("connect"))
            }
        }
        sleep(Duration.second * 1)
        s.close()
        @Expect(count.load(), 0)
        b.get()
    }
}
