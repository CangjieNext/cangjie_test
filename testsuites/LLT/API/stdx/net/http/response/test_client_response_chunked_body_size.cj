/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
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
 *      test client's response.bodySize of a chunked response: None before the
 *      body is fully read, equals the decoded length after the body is fully
 *      read (consistent with the content-length header added at that time),
 *      and stays None when the connection is broken before the last-chunk.
 * Test API:
 *      public prop bodySize
 */

package tests.response

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit

import stdx.log.*
import asan.*
import std.net.*
import std.collection.*
import std.io.*

@Test
class TestClientResponseChunkedBodySize {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func chunkedBodySizeAfterFullyReadTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        let client = ClientBuilder().build()
        let rsp = client.get("http://127.0.0.1:${port}/contentChunk")
        @Expect(rsp.bodySize, None)
        // body读取完毕后，bodySize为实际解码长度
        let buf = Array<Byte>(20000, repeat: 0)
        var readLen = 0
        var len = rsp.body.read(buf)
        while (len > 0) {
            readLen += len
            len = rsp.body.read(buf)
        }
        @Expect(readLen, 16000)
        @Expect(rsp.bodySize, Some(16000))
        // 与读取完毕时补写的content-length头一致，transfer-encoding头已被移除
        @Expect(ArrayList<String>(rsp.headers.get("content-length")), ArrayList<String>(["16000"]))
        @Expect(ArrayList<String>(rsp.headers.get("transfer-encoding")), ArrayList<String>([]))
        client.close()
        server.close()
    }

    @TestCase
    func chunkedBodySizeNoneWhenBrokenTest(): Unit {
        let rawServer = TcpServerSocket(bindAt: 0)
        rawServer.bind()
        let rawPort = (rawServer.localAddress as IPSocketAddress)?.port ?? 0u16
        spawn {
            startRawServer(rawServer)
        }
        let client = ClientBuilder().build()
        let rsp = client.get("http://127.0.0.1:${rawPort}/test")
        @Expect(rsp.bodySize, None)
        // 连接在last-chunk前断开，body未读完
        let buf = Array<Byte>(100, repeat: 0)
        try {
            while (rsp.body.read(buf) > 0) {}
        } catch (_: Exception) {
        }
        @Expect(rsp.bodySize, None)
        client.close()
        rawServer.close()
    }

    func startServer() {
        server.distributor.register("/contentChunk", handler1)
        spawn {
            server.serve()
        }
    }

    func startRawServer(rawServer: TcpServerSocket) {
        let socket = rawServer.accept()
        // 读取并丢弃请求头
        let buf = Array<Byte>(4096, repeat: 0)
        var request = StringBuilder()
        var count = 0
        while (count < 10) {
            let n = socket.read(buf)
            if (n <= 0) {
                break
            }
            request.append(String.fromUtf8(buf[..n]))
            if (request.toString().contains("\r\n\r\n")) {
                break
            }
            count += 1
        }
        // 发送不含last-chunk的chunked响应后断开连接
        socket.write("HTTP/1.1 200 OK\r\ntransfer-encoding: chunked\r\n\r\n5\r\nhel".toArray())
        socket.close()
    }

    func handler1(ctx: HttpContext): Unit {
        let arr = Array<UInt8>(16 * 1000, repeat: 13)
        ctx.responseBuilder.header("Transfer-Encoding", "chunked").body(arr)
    }
}
