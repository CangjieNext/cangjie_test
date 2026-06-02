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
// DEPENDENCE: ./common.cj
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt ./common.cj -o common.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle common.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description: test handle frames with padding
 *
 */

package tests.client2_0

import stdx.net.http.*
import stdx.log.*
import stdx.net.tls.*
import std.net.*
import std.time.*
import std.sync.*
import {asan.*, tlsconfig.*, frameUtils.*}

@Test
class TestPadding {
    let server = ServerBuilder().addr("0.0.0.0").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testSendPadding(): Unit {
        startServer()
        let client = TcpSocket("127.0.0.1", server.port)
        client.connect()
        let tlsClient = TlsSocket.client(client, clientConfig: clientConfig())
        tlsClient.handshake()
        tlsClient.write(prism)
        tlsClient.write(settings)
        sleep(Duration.millisecond * 100)
        tlsClient.write(settingsAck)
        tlsClient.write(headersWithPadding)

        sleep(Duration.second)
        tlsClient.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("ok")
        })
        server.logger.level = LogLevel.TRACE
        spawn {
            server.serve()
        }
        sleep(Duration.second)
    }
}
/* SCAN-IN
Headers Frame [ Length: 53 Has Priority: false Padded: true EndHeader: true EndStream: false Stream id: 1 Pad Length: 10 ]
 */
