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
 *      Test Client1_1#reconnect connection when server close it, try (connNumInPool + 1) times
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import asan.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.collection.*
import stdx.log.*
import std.io.*

@Test
class TestClient1_1HttpBodyWithLargerContentLength2 {
    let serverSocket = TcpServerSocket(bindAt: 0)

    let mtx = ReentrantMutex()
    let body = HttpBodyImpl3()
    let openServerCount = AtomicUInt32(0)
    @TestCase
    func client1_1HttpBodyWithLargerContentLength2(): Unit {
        let fut = spawn {serverPacketCapture1()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")

        for (_ in 0..10) {
            spawn {
                let r = HttpRequestBuilder().url(u).build()
                let response = client.send(r)
                @Expect(response.toString().contains("HTTP/1.1 204 No Content\r\n"))
            }
        }

        sleep(Duration.second * 2)

        let r = HttpRequestBuilder().url(u).body(body).header("Content-Length", "49").build()
        client.send(r)
        sleep(Duration.second)
        // close all connection
        let rclose = HttpRequestBuilder().url(u).header("connection", "close").build()
        for (_ in 0..9) {
            client.send(rclose)
        }
        serverSocket.close()
        client.close()
        fut.get()
        @Expect(openServerCount.load(), 0)
        println("okk")
        asanGC()
    }

    func serverPacketCapture1() {
        serverSocket.bind()
        let serverList = ArrayList<TcpSocket>()
        while (true) {
            try {
                let server = serverSocket.accept()
                spawn {
                    serve(server, serverList)
                }
            } catch (e: SocketException) {
                println("caught")
                break
            }
        }
        @Expect(serverList.size, 10)
    }

    func serve(server: TcpSocket, serverList: ArrayList<TcpSocket>) {
        mtx.lock()
        serverList.add(server)
        openServerCount.fetchAdd(1)
        mtx.unlock()
        let buf = Array<UInt8>(205, repeat: 0)
        var i = 0
        var req = ""
        try {
            do {
                sleep(Duration.millisecond * 200)
                i = server.read(buf)
                req = String.fromUtf8(buf[0..i])
                println(req)
                if (!req.contains("content-length: 49")) {
                    sleep(Duration.millisecond * 500)
                    server.write("HTTP/1.1 204 ok\r\n\r\n".toArray())
                } else {
                    server.write("HTTP/1.1 204 ok\r\n\r\n".toArray())
                    break
                }
            } while (!req.contains("connection: close\r\n"))
        } catch (e: Exception) {
        } finally {
            server.close()
            openServerCount.fetchSub(1)
        }
    }
}

class HttpBodyImpl3 <: InputStream {
    let buffer: Array<Byte>
    init() {
        let builder = StringBuilder()
        builder.append("012345678")
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

// ASSERT: scan ok
// ASSERT: scan caught
