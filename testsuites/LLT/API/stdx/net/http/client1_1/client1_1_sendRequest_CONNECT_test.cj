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
 *      Test ConnNode#sendRequest
 * Test API:
 *      func sendRequest(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import {asan.*, tlsconfig.*}
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*
import std.io.*
import stdx.net.tls.*
import stdx.crypto.x509.*

@Test
class TestConnNodeSendRequestCONNECT {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func ConnNodeSendRequestCONNECT(): Unit {
        // start server
        spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = "http://127.0.0.1:${port}/a"

        let (_, socket) = client.connect(u)
        socket?.close()
        client.close()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 100)
        let i = server.read(buf)
        let read = String.fromUtf8(buf[0..i])
        @Expect(read.contains("CONNECT 127.0.0.1:${port} HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\n"))
        @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
        @Expect(read.contains("connection: keep-alive\r\n"))
        //
        server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
        server.close()
        serverSocket.close()
    }

    @TestCase
    func ConnNodeSendRequestCONNECT80(): Unit {
        // start server
        spawn {serverPacketCapture1()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = "http://127.0.0.1/a"

        try {
            let (_, socket) = client.connect(u)
            socket?.close()
        } catch (e: Exception) {
            println(e.message)
        }
        client.close()
    }
    func serverPacketCapture1() {
        let serverSocket1 = TcpServerSocket(bindAt: 80)
        try {
            serverSocket1.bind()
            let server = serverSocket1.accept()
            let buf = Array<UInt8>(500, repeat: 0)
            sleep(Duration.millisecond * 100)
            let i = server.read(buf)
            let read = String.fromUtf8(buf[0..i])
            @Expect(read.contains("CONNECT 127.0.0.1:80 HTTP/1.1\r\nhost: 127.0.0.1:80\r\n"))
            @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
            @Expect(read.contains("connection: keep-alive\r\n"))
            //
            server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
            server.close()
        } catch (e: Exception) {
            println(e.message)
        }
        serverSocket1.close()
    }

    @TestCase
    func ConnNodeSendRequestCONNECT443(): Unit {
        // start server
        spawn {serverPacketCapture2()}
        sleep(Duration.millisecond * 100)
        let cfg = clientConfig()
        let client = ClientBuilder().tlsConfig(cfg).build()
        client.logger.level = LogLevel.DEBUG
        let u = "https://127.0.0.1/a"

        try {
            let (_, socket) = client.connect(u)
            socket?.close()
        } catch (e: Exception) {
            println(e.message)
        }
        client.close()
        asanGC()
        println("send_request_CONNECT_test")
    }
    func serverPacketCapture2() {
        let serverSocket2 = TcpServerSocket(bindAt: 443)
        try {
            serverSocket2.bind()
            let cfg = serverConfig()
            let socket = serverSocket2.accept()
            let server = TlsSocket.server(socket, serverConfig: cfg)
            server.handshake()
            let buf = Array<UInt8>(500, repeat: 0)
            sleep(Duration.millisecond * 100)
            let i = server.read(buf)
            let read = String.fromUtf8(buf[0..i])
            @Expect(read.contains("CONNECT 127.0.0.1:443 HTTP/1.1\r\nhost: 127.0.0.1:443\r\n"))
            @Expect(read.contains("user-agent: CANGJIEUSERAGENT_1_1\r\n"))
            @Expect(read.contains("connection: keep-alive\r\n"))
            //
            server.write("HTTP/1.1 204 no content\r\nconnection: close\r\n\r\n".toArray())
            server.close()
            serverSocket2.close()
        } catch (e: Exception) {
            println(e.message)
        }
    }
}

/* SCAN-IN
send_request_CONNECT_test
 */
