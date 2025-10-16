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
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit

@Test
public class Test_loggerset {
    @TestCase
    func serverbuilder_debug(): Unit {
        let logger = SimpleLogger(Console.stdOut)
        logger.level = LogLevel.DEBUG
        let server = ServerBuilder().addr("127.0.0.1").logger(logger).port(0).build()
        server.distributor.register("/dd", {ctx => ctx.responseBuilder.body("hello")})
        spawn {server.serve()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()

        let request = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/dd").build()

        client.send(request)
    }

    @TestCase
    func server_debug(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.logger.level = LogLevel.DEBUG
        server.distributor.register("/dd", {ctx => ctx.responseBuilder.body("hello")})
        spawn {server.serve()}
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().build()

        let request = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/dd").build()

        client.send(request)
    }
}

// ASSERT: scan accept a client connection
// ASSERT: scan serve client connection begin
// ASSERT: scan-not TRACE
