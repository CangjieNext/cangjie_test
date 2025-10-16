/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ./../bodyReadUtil
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt bodyReadUtil/read.cj -o read.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle read.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test Client1_1#receiveChunkedBody
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import {asan.*, bodyReadUtil.*}
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*

@Test
class TestClient1_1ReceiveChunkedBody {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1ReceiveChunkedBody(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 10)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).build()
        let response = client.send(r)
        @Expect(response.toString().contains("HTTP/1.1 200 OK\r\ntransfer-encoding: chunked\r\n"))
        // read response body
        let body = readAll(122, response)
        @Expect(body, "123456789012345612")
        @Expect(response.toString().contains("a: 2\r\nb: 3\r\n"))
        @Expect(!response.toString().contains("transfer-encoding: chunked\r\n"))
        @Expect(response.toString().contains("content-length: 18\r\n"))
        let body2 = readAll(122, response)
        @Expect(body2, "")
        // reuse this conn
        let response2 = client.send(r)
        @Expect(response2.toString().contains("HTTP/1.1 204 No Content\r\n"))
        client.close()
        fut.get()
        serverSocket.close()
    }

    func serverPacketCapture() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 10)
        server.read(buf)
        server.write(
            "HTTP/1.1 200 ok\r\ntransfer-encoding: chunked\r\nTrailer: a, b\r\n\r\n10\r\n1234567890123456\r\n2\r\n12\r\n0\r\na: 2\r\nb: 3\r\nc: 4\r\n\r\nHTTP/1.1 204 ok\r\n\r\n"
                .toArray())
        sleep(Duration.millisecond * 100)
        server.close()
    }

    let serverSocket2 = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1ReceiveChunkedBody2(): Unit {
        let fut = spawn {serverPacketCapture2()}
        sleep(Duration.millisecond * 10)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port2 = (serverSocket2.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port2}/a")
        let r = HttpRequestBuilder().url(u).build()
        let response = client.send(r)
        @Expect(response.toString().contains("HTTP/1.1 200 OK\r\n"))
        @Expect(response.toString().contains("transfer-encoding: chunked\r\n"))
        // read response body
        let buf = Array<UInt8>(5, repeat: 0)
        var i = response.body.read(buf)
        @Expect(i <= 5)
        i = response.body.read(buf)
        @Expect(i <= 5)
        i = response.body.read(buf)
        @Expect(i <= 5)
        i = response.body.read(buf)
        @Expect(i <= 3)
        // consume all
        readAll(5, response)
        i = response.body.read(buf)
        @Expect(i, 0)
        @Expect(response.toString().contains("content-length: 18\r\n"))
        @Expect(response.toString().contains("a: 2\r\nb: 3\r\n"))
        // reuse this conn
        let response2 = client.send(r)
        @Expect(response2.toString().contains("HTTP/1.1 204 No Content\r\n"))
        client.close()
        fut.get()
        serverSocket2.close()
    }

    func serverPacketCapture2() {
        serverSocket2.bind()
        let server = serverSocket2.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 10)
        server.read(buf)
        server.write(
            "HTTP/1.1 200 ok\r\ntrailer: A, b\r\ntransfer-encoding: chunked\r\n\r\n10\r\n1234567890123456\r\n2\r\n12\r\n0\r\na: 2\r\nb: 3\r\nc: 4\r\n\r\nHTTP/1.1 204 No Content\r\nconnection: close\r\n\r\n"
                .toArray())
        sleep(Duration.millisecond * 100)
        server.close()
    }

    let serverSocket3 = TcpServerSocket(bindAt: 0)
 
    @TestCase
    func client1_1ReceiveChunkedBodyAbort(): Unit {
        let serverHasException = Box<Bool>(false)
        let sc = SyncCounter(1)
        let fut = spawn {
            try {
                serverPacketCapture3()
                @Expect(false)
            } catch (e: SocketException) {
                serverHasException.value = true
                sc.dec()
            }
        }
        sleep(Duration.millisecond * 10)
 
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port3 = (serverSocket3.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port3}/a")
        let r = HttpRequestBuilder()
                                .url(u)
                                .build()
        let response = client.send(r)
        @Expect(response.toString().contains("HTTP/1.1 200 OK\r\n"))
        @Expect(response.toString().contains("transfer-encoding: chunked\r\n"))
        // close response body
        response.close()
        sc.waitUntilZero()
        @Expect(serverHasException.value, true)
 
        client.close()
        fut.get()
        serverSocket3.close()
        println("ok")
        asanGC()
    }
 
    func serverPacketCapture3() {
        serverSocket3.bind()
        let server = serverSocket3.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 10)
        server.read(buf)
        server.write("HTTP/1.1 200 ok\r\ntrailer: A, b\r\ntransfer-encoding: chunked\r\n\r\n10\r\n1234567890123456\r\n2\r\n12\r\n0\r\na: 2\r\nb: 3\r\nc: 4\r\n\r\nHTTP/1.1 204 No Content\r\nconnection: close\r\n\r\n".toArray())
        server.write("data".toArray().repeat(1000000))
        server.write("data".toArray().repeat(1000000))
        sleep(Duration.millisecond * 100)
        server.close()
    }
}

/* SCAN-IN
ok
 */
