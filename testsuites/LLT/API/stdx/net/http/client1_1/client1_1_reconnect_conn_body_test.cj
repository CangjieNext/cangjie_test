/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test Client1_1#reconnect connection when server close it.
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import std.time.*
import std.sync.*
import stdx.log.*
import std.io.*

@Test
class TestClient1_1reconnectConnException {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1reconnectConn(): Unit {
        let fut = spawn {serverPacketCapture1()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        var r = HttpRequestBuilder().url(u).body(HttpBodyImpl()).header("content-length", "5000").build()
        client.send(r)
        r = HttpRequestBuilder().url(u).body(HttpBodyImpl()).header("content-length", "5000").build()
        let rsp = client.send(r)
        @Expect(rsp.toString().contains("HTTP/1.1 204"))
        client.close()
        fut.get()
    }

    func serverPacketCapture1() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(500, repeat: 0)
        var i = server.read(buf)
        server.write("HTTP/1.1 204 ok\r\n\r\n".toArray())
        server.close()

        let server2 = serverSocket.accept()
        i = server2.read(buf)
        var len = i
        while (len < 5000) {
            i = server2.read(buf)
            len += i
        }
        server2.write("HTTP/1.1 204 ok\r\n\r\n".toArray())
        server2.close()
        serverSocket.close()
    }
}

class HttpBodyImpl <: InputStream {
    let buffer: Array<Byte>
    init() {
        let builder = StringBuilder()
        for (_ in 0..500) {
            builder.append("0123456789")
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
}
