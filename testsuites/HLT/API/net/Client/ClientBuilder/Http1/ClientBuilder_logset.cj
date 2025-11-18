/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run_stdx %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan Using HTTP/1.1 client
// ASSERT: scan Client1_1 get conn new
// ASSERT: scan Client1.1 send request header
// ASSERT: scan Client1.1 send request body
// ASSERT: scan Client1.1 read response HTTP/1.1 200 OK
// ASSERT: scan-not TRACE
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.net.*
import std.collection.*
import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate

@Test
public class Test_loggerset {
    @TestCase
    func clientbuilder_debug(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.DEBUG
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/dd", {ctx => ctx.responseBuilder.body("hello")})
        spawn {server.serve()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().logger(logger).build()

        let request = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/dd").build()

        client.send(request)
    }

    @TestCase
    func client_debug(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/dd", {ctx => ctx.responseBuilder.body("hello")})
        spawn {server.serve()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG

        let request = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/dd").build()

        client.send(request)
    }
}
