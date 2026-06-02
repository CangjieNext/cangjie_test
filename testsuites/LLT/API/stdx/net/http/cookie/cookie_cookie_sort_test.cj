/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *       Test Cookie#path
 *       the user agent should sort the cookie-list in the following order:
 *       1  Cookies with longer paths are listed before cookies with shorter paths.
 *       2  Among cookies that have equal-length path fields, cookies with earlier
 *          creation-times are listed before cookies with later creation-times.
 *       RFC 6265  5.4.2.
 * Test API:
 *       Cookie :: init()
 *       CookieJar :: public func getCookies(url: URL): ArrayList<Cookie>
 */

package tests.cookie

import stdx.net.http.*
import std.net.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import stdx.log.*
import stdx.encoding.url.*
import std.sync.*

@Test
class TestCookiePathLengthSort {
    let serverSocket = TcpServerSocket(bindAt: 0)

    @TestCase
    func cookiePathLength(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a/b/c/d/e/f/g")
        var r = HttpRequestBuilder().url(u).build()
        client.send(r)
        r = HttpRequestBuilder().url(u).build()
        client.send(r)
        r = HttpRequestBuilder().url(u).build()
        client.send(r)
        r = HttpRequestBuilder().url(u).build()
        client.send(r)
        r = HttpRequestBuilder().url(u).build()
        client.send(r)
        r = HttpRequestBuilder().url(u).build()
        client.send(r)
        client.close()
        fut.get()

        println("ok")
    }
    func serverPacketCapture() {
        serverSocket.bind()
        var server = serverSocket.accept()
        sleep(Duration.millisecond * 100)
        server.write("HTTP/1.1 204 ok\r\nconnection: close\r\nSet-Cookie: 1=1; path=/a\r\n\r\n".toArray())
        server.close()

        server = serverSocket.accept()
        sleep(Duration.millisecond * 100)
        let buf = Array<UInt8>(500, repeat: 0)
        let i = server.read(buf)
        println(String.fromUtf8(buf[..i]))
        @Expect(String.fromUtf8(buf[..i]).contains("cookie: 1=1\r\n"))
        server.write("HTTP/1.1 204 ok\r\nSet-Cookie: 2=2; path=/a/b\r\n\r\n".toArray())
        let i2 = server.read(buf)
        println(String.fromUtf8(buf[..i2]))
        @Expect(String.fromUtf8(buf[..i2]).contains("cookie: 2=2; 1=1\r\n"))
        server.write("HTTP/1.1 204 ok\r\nSet-Cookie: 1=2; path=/a/b/c\r\n\r\n".toArray())
        let i3 = server.read(buf)
        println(String.fromUtf8(buf[..i3]))
        @Expect(String.fromUtf8(buf[..i3]).contains("cookie: 1=2; 2=2; 1=1\r\n"))
        server.write("HTTP/1.1 204 ok\r\nSet-Cookie: 3=3\r\n\r\n".toArray())
        let i4 = server.read(buf)
        println(String.fromUtf8(buf[..i4]))
        @Expect(String.fromUtf8(buf[..i4]).contains("cookie: 3=3; 1=2; 2=2; 1=1\r\n"))
        server.write("HTTP/1.1 204 ok\r\nSet-Cookie: 4=4\r\n\r\n".toArray())
        let i5 = server.read(buf)
        println(String.fromUtf8(buf[..i5]))
        @Expect(String.fromUtf8(buf[..i5]).contains("cookie: 3=3; 4=4; 1=2; 2=2; 1=1\r\n"))
        server.write("HTTP/1.1 204 ok\r\nConnection: close\r\n\r\n".toArray())
        server.close()

        serverSocket.close()
    }
}

/* SCAN-IN
ok
 */
