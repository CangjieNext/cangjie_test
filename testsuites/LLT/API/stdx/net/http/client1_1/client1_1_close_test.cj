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
 *      Test Client1_1#close
 * Test API:
 *      public func close()
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
class TestClient1_1Close {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1ReceiveChunkedBody(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 10)

        let client = ClientBuilder().build()
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).build()
        // conn1
        let response = client.send(r)
        @Expect(response.toString().contains("HTTP/1.1 200 OK\r\ntransfer-encoding: chunked\r\n"))
        // another connection
        // conn2
        let fut2 = spawn {serverPacketCapture2()}
        sleep(Duration.millisecond * 10)
        let response2 = client.send(r)
        @Expect(response2.toString().contains("HTTP/1.1 200 OK\r\ntransfer-encoding: chunked\r\n"))

        // another connection
        // conn3
        let fut3 = spawn {serverPacketCapture3()}
        sleep(Duration.millisecond * 10)
        let response3 = client.send(r)
        @Expect(response3.toString().contains("HTTP/1.1 200 OK\r\ntransfer-encoding: chunked\r\n"))

        // another connection
        // conn4
        let fut4 = spawn {serverPacketCapture4()}
        sleep(Duration.millisecond * 10)
        let response4 = client.send(r)
        @Expect(response4.toString().contains("HTTP/1.1 200 OK\r\ntransfer-encoding: chunked\r\n"))

        // read response body from conn1
        var body = readAll(5, response)
        @Expect(body, "123456789012345612")
        // reuse this conn1
        // conn1 will be returned
        let response1_1 = client.send(r)
        @Expect(response1_1.toString().contains("HTTP/1.1 204 No Content\r\n"))

        // read part of response body from conn2
        // conn2 will not be returned
        let buf = Array<UInt8>(5, repeat: 0)
        var i = response2.body.read(buf)
        @Expect(i <= 5)

        // read response body from conn3
        // conn3 will be returned
        i = response3.body.read(buf)
        @Expect(i <= 5)

        // read part of response body from conn4
        // conn4 will not be returned
        i = response4.body.read(buf)
        @Expect(i <= 5)

        client.close()
        fut.get()
        fut2.get()
        fut3.get()
        fut4.get()
        serverSocket.close()
        println("ok")
        asanGC()
    }

    func serverPacketCapture() {
        serverSocket.bind()
        var server = serverSocket.accept()
        var buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 10)
        let _ = server.read(buf)
        server.write(
            "HTTP/1.1 200 ok\r\ntransfer-encoding: chunked\r\n\r\n10\r\n1234567890123456\r\n2\r\n12\r\n0\r\n\r\nHTTP/1.1 204 No Content\r\nConnection: close\r\n\r\n"
                .toArray())
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func serverPacketCapture2() {
        var server = serverSocket.accept()
        var buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 10)
        let _ = server.read(buf)
        server.write(
            "HTTP/1.1 200 ok\r\ntransfer-encoding: chunked\r\n\r\n10\r\n1234567890123456\r\n2\r\n12\r\n0\r\n\r\nHTTP/1.1 204 No Content\r\n\r\n"
                .toArray())
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func serverPacketCapture3() {
        var server = serverSocket.accept()
        var buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 10)
        let _ = server.read(buf)
        server.write("HTTP/1.1 200 ok\r\ntransfer-encoding: chunked\r\n\r\n5\r\n12345\r\n0\r\n\r\n".toArray())
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func serverPacketCapture4() {
        var server = serverSocket.accept()
        var buf = Array<UInt8>(500, repeat: 0)
        sleep(Duration.millisecond * 10)
        let _ = server.read(buf)
        server.write(
            "HTTP/1.1 200 ok\r\ntransfer-encoding: chunked\r\n\r\n10\r\n1234567890123456\r\n2\r\n12\r\n0\r\n\r\nHTTP/1.1 204 No Content\r\n\r\n"
                .toArray())
        sleep(Duration.millisecond * 100)
        server.close()
    }
}

/* SCAN-IN
ok
 */
