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
package tests.client1_1

import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import std.net.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*
import std.convert.Parsable
import stdx.encoding.url.*
import stdx.log.*
import {asan.*, tlsconfig.*}

@Test
class TestClientConnector {
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(serverConfig()).build()

    @TestCase
    func testConnector(): Unit {
        startServer()
        let connector = {
            sa: SocketAddress =>
            let socket = TcpSocket(sa)
            let cfg = clientConfig()
            socket.connect()
            let tlssocket = TlsSocket.client(socket, clientConfig: cfg)
            tlssocket.handshake()
            println("handshake")
            return tlssocket
        }
        let client = ClientBuilder().tlsConfig(clientConfig()).connector(connector).build()
        client.logger.level = LogLevel.TRACE
        let req = HttpRequestBuilder().url("https://127.0.0.1:${server.port}").version(HTTP2_0).build()
        client.send(req)
        client.close()
        server.close()
        asanGC()
    }

    func startServer(): Unit {
        spawn {
            server.serve()
        }
        server.logger.level = LogLevel.TRACE
        sleep(Duration.second)
    }
}
