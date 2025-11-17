/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files

// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
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

@Test
class TestClient1_1HTTPs2 {
    let server = TcpServerSocket(bindAt: 0)

    @TestCase
    func testHTTPs2(): Unit {
        let fut = spawn {
            startServer()
        }
        sleep(Duration.second)
        let port = (server.localAddress as IPSocketAddress)?.port ?? 0
        var cfg = TlsClientConfig()
        let client = ClientBuilder().tlsConfig(cfg).build()
        client.logger.level = LogLevel.DEBUG
        // send a https request to plain server
        var u = URL.parse("https://127.0.0.1:${port}/a")
        var r = HttpRequestBuilder().url(u).build()
        try {
            client.send(r)
            @Expect(1, 2)
        } catch (e: TlsException) {
            println(e.message)
        }

        u = URL.parse("http://127.0.0.1:${port}/a")
        r = HttpRequestBuilder().url(u).build()
        client.send(r)

        client.close()
        fut.get()
        server.close()
        println("ok")
    }

    func startServer() {
        server.bind()
        let socket = server.accept()
        socket.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        socket.close()

        let socket2 = server.accept()
        socket2.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        socket2.close()
    }
}

/* SCAN-IN
ok
 */
