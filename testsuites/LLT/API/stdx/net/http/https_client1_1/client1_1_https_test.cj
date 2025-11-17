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
package tests.client1_1

import stdx.net.tls.*
import stdx.crypto.x509.*
import std.net.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*
import stdx.encoding.url.*
import stdx.log.*
import {asan.*, tlsconfig.*}

@Test
class TestClient1_1HTTPs {
    let server = TcpServerSocket(bindAt: 0)

    @TestCase
    func testHTTPs(): Unit {
        let fut = spawn {
            startServer()
        }
        sleep(Duration.second)
        let port = (server.localAddress as IPSocketAddress)?.port ?? 0
        var cfg = clientConfig()
        cfg.alpnProtocolsList = ["http/1.1"]
        let client = ClientBuilder().readTimeout(Duration.second).tlsConfig(cfg).build()
        client.logger.level = LogLevel.DEBUG
        // send a http request
        var u = URL.parse("http://127.0.0.1:${port}/a")
        var r = HttpRequestBuilder().url(u).build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: ConnectionException) {
            @Expect(e.message, "Socket is closed.")
        }

        u = URL.parse("https://127.0.0.1:${port}/a")
        r = HttpRequestBuilder().url(u).build()
        client.send(r)
        client.close()
        server.close()
        fut.get()
        asanGC()
        println("ok")
    }

    func startServer() {
        server.bind()
        let socket = server.accept()
        var tmpCfg = serverConfig()
        tmpCfg.supportedAlpnProtocols = ["http/1.1"]
        let cfg = tmpCfg
        let tlsSocket = TlsSocket.server(socket, serverConfig: cfg)
        try {
            tlsSocket.handshake()
            @Expect(1, 2)
        } catch (e: TlsException) {
            tlsSocket.close()
            @Expect(e.message, "TLS handshake failed (server): http request (156)")
        }
        do {
            let socket2 = try {
                server.accept()
            } catch (_) {
                break
            }
            spawn {
                try (tlsSocket2 = TlsSocket.server(socket2, serverConfig: cfg)) {
                    tlsSocket2.handshake()
                    tlsSocket2.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
                }
            }
        } while (true)
    }
}

/* SCAN-IN
ok
 */
