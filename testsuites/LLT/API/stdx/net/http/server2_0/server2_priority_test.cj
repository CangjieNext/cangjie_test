/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ../config
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      1. Server will correctly parse priority header field in request and set queuePriority
 *      2. Server will process requests according to urgency, when queue in thread pool is full
 *
 * Test API: public class HttpRequest {
 *      public func priority(urg: Int64, inc: Bool): HttpRequestBuilder
 * }
 */
package tests.server2_0

import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import std.time.*
import stdx.log.*
import std.sync.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import {asan.*, tlsconfig.*}

@Test
class TestPriority {
    var server: ?Server = None

    @TestCase
    func requestWithPriority(): Unit {
        startServer()

        let client = ClientBuilder().tlsConfig(clientConfig()).build()

        let request = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${(server?.port).getOrThrow()}/requestWithPriority")
            .header("priority", "u=0,i")
            .build()
        let response = client.send(request)

        let buf = Array<UInt8>(10, repeat: 0)
        try {
            var readLen = response.body.read(buf)
            while (readLen > 0) {
                readLen = response.body.read(buf)
            }
        } catch (e: Exception) {
            println("read response body failed: ${e}")
        }

        client.close()
        server?.close()
    }

    @TestCase
    func requestsByPriority(): Unit {
        startServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).build()

        let blockRequest = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${(server?.port).getOrThrow()}/blockForAWhile")
            .build()

        let str = StringBuilder()
        let fList = ArrayList<Future<Unit>>()

        spawn {
            client.send(blockRequest)
            client.send(blockRequest)
            client.send(blockRequest)
        }
        sleep(Duration.millisecond * 100)
        send(client, 7, fList, str, true)
        send(client, 6, fList, str, true)
        send(client, 5, fList, str, true)
        send(client, 4, fList, str, true)
        send(client, 3, fList, str, true)
        send(client, 2, fList, str, true)
        send(client, 1, fList, str, true)
        send(client, 0, fList, str, true)

        for (f in fList) {
            f.get()
        }

        @Assert(str.toString() != "76543210", true)

        client.close()
        server?.close()
    }

    @TestCase
    func requestsByPriorityInHead(): Unit {
        startServer()
        let client = ClientBuilder().tlsConfig(clientConfig()).build()

        let blockRequest = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${(server?.port).getOrThrow()}/blockForAWhile")
            .build()

        let str = StringBuilder()
        let fList = ArrayList<Future<Unit>>()

        spawn {
            client.send(blockRequest)
            client.send(blockRequest)
            client.send(blockRequest)
        }
        sleep(Duration.millisecond * 100)
        send(client, 7, fList, str, false)
        send(client, 6, fList, str, false)
        send(client, 5, fList, str, false)
        send(client, 4, fList, str, false)
        send(client, 3, fList, str, false)
        send(client, 2, fList, str, false)
        send(client, 1, fList, str, false)
        send(client, 0, fList, str, false)

        for (f in fList) {
            f.get()
        }

        @Assert(str.toString() != "76543210", true)

        client.close()
        server?.close()

        asanGC()
    }

    func startServer() {
        let poolCfg = ServicePoolConfig(capacity: 4, queueCapacity: 1)
        server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).servicePoolConfig(poolCfg).build()
        server?.logger.level = LogLevel.DEBUG
        server?.distributor.register("requestWithPriority", {ctx => ctx.responseBuilder.body("Hello")})
        server?.distributor.register("blockForAWhile", {_ => sleep(Duration.second * 2)})

        spawn {
            server?.serve()
        }
        sleep(Duration.millisecond * 100)
    }

    func buildRequest(pr: Int64, byHead: Bool): HttpRequest {
        let req = HttpRequestBuilder()
            .version(HTTP2_0)
            .url("https://127.0.0.1:${(server?.port).getOrThrow()}/requestWithPriority")
        if (byHead) {
            req.header("priority", "u=${pr}")
            req.priority(0, true)
        } else {
            req.priority(pr, true)
        }
        return req.build()
    }

    func send(client: Client, urg: Int64, fList: ArrayList<Future<Unit>>, str: StringBuilder, byHead: Bool) {
        let f = spawn {
            let _ = client.send(buildRequest(urg, byHead))
            let _ = str.append("${urg}")
        }
        fList.add(f)
    }
}

//ASSERT:scan stream 1, set queuePriority = 7
