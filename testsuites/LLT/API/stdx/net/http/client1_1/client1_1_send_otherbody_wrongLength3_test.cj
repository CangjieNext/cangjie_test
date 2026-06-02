/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test Client1_1#sendhttpbody
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import asan.*
import stdx.encoding.url.*
import std.net.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*
import std.time.*
import stdx.log.*
import std.io.*

@Test
class TestClient1_1SendHttpBody3 {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let client = ClientBuilder().build()

    @TestCase
    func client1_1SendHttpBodyWithOutContentLength(): Unit {
        client.logger.level = LogLevel.DEBUG
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.second)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let body = HttpBodyImplPropLengthLarger()
        let r = HttpRequestBuilder().url(u).body(body).build()

        client.send(r)
        fut.get()
    }
    func serverPacketCapture(): Bool {
        serverSocket.bind()
        let server = serverSocket.accept()
        sleep(Duration.millisecond * 500)
        let buf = Array<UInt8>(500, repeat: 0)
        let i = server.read(buf)
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]).contains("content-length: 50\r\n"))
        server.write("HTTP/1.1 204 ok\r\nconnection: close\r\n\r\n".toArray())
        server.close()
        return true
    }

    @TestCase
    func client1_1SendHttpBodyWithSmallContentLength(): Unit {
        let fut = spawn {serverPacketCapture2()}
        sleep(Duration.second)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let body = HttpBodyImplPropLengthLarger()
        let r = HttpRequestBuilder().url(u).header("content-length", "27").body(body).build()

        client.send(r)
        client.close()
        fut.get()
        println("ok")
        asanGC()
    }
    func serverPacketCapture2(): Bool {
        let server = serverSocket.accept()
        sleep(Duration.millisecond * 500)
        let buf = Array<UInt8>(500, repeat: 0)
        let i = server.read(buf)
        @Expect(String.fromUtf8(buf[..i]).contains("content-length: 27\r\n"))
        @Expect(String.fromUtf8(buf[..i]).contains("\r\n012345678012345678012345678"))
        server.write("HTTP/1.1 204 ok\r\nconnection: close\r\n\r\n".toArray())
        server.close()
        serverSocket.close()
        return true
    }
}

class HttpBodyImplPropLengthLarger <: InputStream & Seekable {
    let buffer: Array<Byte>
    init() {
        let builder = StringBuilder()
        for (_ in 0..5) {
            builder.append("012345678")
        }
        let size = builder.size
        buffer = unsafe { builder.toString().rawData().slice(0, size) }
    }

    var point = 0
    public func read(buf: Array<Byte>): Int64 {
        if (point == buffer.size) {
            return 0
        }
        if ((point + buf.size) > buffer.size) {
            buf[0..(buffer.size - point)] = buffer[point..buffer.size]
            var last = (buffer.size - point)
            point += last
            return last
        }
        buf[0..buf.size] = buffer[point..point + buf.size]
        point += buf.size
        return buf.size
    }

    public prop length: Int64 {
        get() {
            50
        }
    }

    public func seek(_: SeekPosition): Int64 {
        0
    }
}

/* SCAN-IN
ok
 */
