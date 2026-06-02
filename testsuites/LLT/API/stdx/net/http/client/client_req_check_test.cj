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
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *
 * Test API:
 *
 */

package tests.client

import stdx.net.http.*
import std.net.*
import stdx.encoding.base64.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import asan.*

@Test
class TestRequestCheck {
    let socketServer = TcpServerSocket(bindAt: 0)
    var port: UInt16 = 0
    var data = ""
    let client = ClientBuilder().build()

    public override func beforeAll(): Unit {
        socketServer.bind()
        port = (socketServer.localAddress as IPSocketAddress)?.port ?? 0
    }
    @TestCase
    func schemeCheck(): Unit {
        let req = HttpRequestBuilder().url("pulsar://127.0.0.1/hd1").body("hello").build()
        try {
            client.send(req)
        } catch (e: HttpException) {
            @Assert(e.message.contains("Not HTTP protocol scheme: pulsar"))
        }
    }

    @TestCase
    func hostCheck(): Unit {
        let req = HttpRequestBuilder().url("http:///hd1").body("hello").build()
        try {
            client.send(req)
        } catch (e: HttpException) {
            @Assert(e.message.contains("No host in request URL"))
        }
    }

    @TestCase
    func testUserInfo(): Unit {
        spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().build()
        client.get("http://zsh:12345678@127.0.0.1:${port}/a")
        sleep(Duration.second)
        @Expect(!data.isEmpty())
        var opt = fromBase64String(data) ?? Array<UInt8>()
        @Assert(String.fromUtf8(opt), "zsh:12345678")
        client.close()
        asanGC()
    }

    func serverPacketCapture() {
        var socket = socketServer.accept()
        var buf = Array<UInt8>(1024, repeat: 0)
        socket.read(buf)
        let response = String.fromUtf8(buf)
        let strs = response.split("\r\n")
        for (str in strs) {
            if (str.startsWith("authorization")) {
                data = str.split(" ")[2]
                break
            }
        }
        socket.write("HTTP/1.1 200 ok\r\nContent-Length: 10\r\na: b\r\nb: c\r\n\r\n".toArray())
        socket.close()
        socketServer.close()
    }
}
