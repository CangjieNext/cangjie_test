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
 * Can Serve(net.Listener, Handler) correctly parse two segments of packets received?
 *
 */

package tests.go_server

import stdx.net.http.*
import stdx.net.tls.*
import std.collection.ArrayList
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class ConsumingBodyOnNextConn {
    var count = 0
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func messageTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        sendContentRequest()
        sleep(Duration.millisecond * 100)
        server.close()
    }

    func startServer() {
        server.distributor.register("/contentTest", handler)
        spawn {
            server.serve()
        }
    }

    func handler(ctx: HttpContext): Unit {
        let bodyBuf = Array<UInt8>(10, repeat: 0)
        let allBody = ArrayList<UInt8>()
        var readLen = ctx.request.body.read(bodyBuf)
        while (readLen > 0) {
            allBody.add(all: bodyBuf[..readLen])
            readLen = ctx.request.body.read(bodyBuf)
        }
        if (count == 0) {
            @Expect(String.fromUtf8(allBody.toArray()), "test prase request")
            @Expect(ctx.request.method, "POST")
            @Expect(ctx.request.url.toString(), "/contentTest")
            count++
        }
        if (count == 1) {
            @Expect(String.fromUtf8(allBody.toArray()), "test prase request")
            @Expect(ctx.request.method, "POST")
            @Expect(ctx.request.url.toString(), "/contentTest")
        } else {
            @Expect(1, 2)
        }
    }

    func sendContentRequest() {
        // connect
        var client = TcpSocket("127.0.0.1", port)
        client.connect()

        // write preface and initial settings
        let preface = "POST /contentTest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 18\r\nConnection: keep-alive\r\n\r\ntest prase requestPOST /contentTest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 18\r\nConnection: keep-alive\r\n\r\ntest prase request"
            .toArray()
        client.write(preface)

        sleep(Duration.millisecond * 100)

        client.close()
    }
}
