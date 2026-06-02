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
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      MaxConcurrentStreams
 * Test API:
 *      func maxConcurrentStreams(UInt32): ServerBuilder
 */

import std.sync.*
import std.time.*
import std.fs.*
import stdx.log.*
import stdx.net.http.*
import stdx.net.tls.*
import stdx.crypto.x509.*
import {asan.*, tlsconfig.*}
import std.math.*

const maxStreams = 10u32
var server: Server = unsafe { zeroValue<Server>() }

func startServer(streams!: UInt32 = maxStreams): UInt16 {
    server = ServerBuilder().addr("0.0.0.0").port(0).maxConcurrentStreams(streams).tlsConfig(serverConfig()).build()

    server
        .distributor
        .register(
            "/hello",
            {
                _ =>
                server.logger.info("handle start")
                sleep(Duration.millisecond * 500)
                server.logger.info("handle done")
            }
        )

    spawn {server.serve()}
    sleep(Duration.millisecond)
    return server.port
}

@Test
class ServerStreamsLimitTest {
    @TestCase[serverStreamsLimit in [ maxStreams, UInt32.Max ]]
    func testServerStreamsLimitWhileRst(serverStreamsLimit: UInt32) {
        let port = startServer(streams: serverStreamsLimit)
        let cnt = AtomicInt64(0)

        // The response time out can cause the client send RstFrame to Server.
        let readTimeout = Duration.millisecond
        let client = ClientBuilder().readTimeout(readTimeout).tlsConfig(clientConfig()).build()

        // Use the normal read time out in request, to send normal request.
        let goodReq = HttpRequestBuilder()
            .url("https://127.0.0.1:${port}/hello")
            .readTimeout(10 * Duration.second)
            .build()

        // send rst frames 
        sendRstByTimeout(client, port, Int64(maxStreams))

        // send normal request
        for (_ in 0..maxStreams) {
            let rsp = client.send(goodReq)
            cnt.fetchAdd(1)
            @Expect(rsp.status == 200)
        }

        sleep(Duration.second)
        @Expect(cnt.load() == Int64(maxStreams))

        client.close()
        server.close()
        asanGC()
    }
}

func sendRstByTimeout(client: Client, port: UInt16, n: Int64): Unit {
    for (_ in 0..n) {
        try {
            client.get("https://127.0.0.1:${port}/hello")
        } catch (e: HttpTimeoutException) {}
    }
}
