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
 *      Test Client1_1#Cookie
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*

@Test
class TestClient1_1TraceCookie {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func client1_1TraceCookie(): Unit {
        serverSocket.bind()
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 10)
        // client TRACE
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        var u = URL.parse("http://127.0.0.1:${port}/a/b/c")
        var r = HttpRequestBuilder().url(u).trace().build()
        client.send(r)
        client.close()
        // another client GET
        let client2 = ClientBuilder().build()
        client2.logger.level = LogLevel.DEBUG
        r = HttpRequestBuilder().url(u).build()
        client2.send(r)
        client2.close()
        fut.get()
        serverSocket.close()
    }
    func serverPacketCapture() {
        let buf = Array<UInt8>(500, repeat: 0)
        // TRACE redirect
        let server = serverSocket.accept()
        server.read(buf)
        let cookie1 = Cookie("1", "1", maxAge: 4, domain: "127.0.0.1", path: "/a/b/")
        let setCookie1 = cookie1.toSetCookieString()
        let cookie2 = Cookie("2", "2", maxAge: 2, path: "/a/")
        let setCookie2 = cookie2.toSetCookieString()
        server.write(
            "HTTP/1.1 308 ok\r\nSet-Cookie: ${setCookie1}\r\nSet-Cookie: ${setCookie2}\r\nConnection: close\r\nContent-Length: 0\r\nLocation: /a/b/c/\r\n\r\n"
                .toArray())
        // TRACE cannot contain cookie
        let server2 = serverSocket.accept()
        let i2 = server2.read(buf)
        @Expect(String.fromUtf8(buf[..i2]).contains("cookie"), false)
        server2.write("HTTP/1.1 204 ok\r\nConnection: close\r\n\r\n".toArray())
        server.close()
        server2.close()

        // GET redirect
        let server3 = serverSocket.accept()
        server3.read(buf)
        server3.write(
            "HTTP/1.1 308 ok\r\nSet-Cookie: ${setCookie1}\r\nSet-Cookie: ${setCookie2}\r\nConnection: close\r\nContent-Length: 0\r\nLocation: /a/b/c/\r\n\r\n"
                .toArray())
        // GET contain cookie
        let server4 = serverSocket.accept()
        let i4 = server4.read(buf)
        @Expect(String.fromUtf8(buf[..i4]).contains("cookie"))
        server4.write("HTTP/1.1 204 ok\r\nConnection: close\r\n\r\n".toArray())
        server3.close()
        server4.close()
    }
}
