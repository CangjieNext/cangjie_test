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
 *      HttpResponse.body 对大响应体按需读取：不在构造阶段把整个正文收进内存
 * Test API:
 *      public prop body: InputStream
 */

package tests.body

import stdx.net.http.*
import std.net.*
import std.time.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestNormalBodyLargeRead {
    let serverSocket = TcpServerSocket(bindAt: 0)

    // 服务端先发出响应头与一小段正文，然后停顿 2 秒才补齐剩余部分。
    // 若实现在返回响应前就把整个正文读满，客户端会被这段停顿阻塞；
    // 按需读取则应立即返回、由调用方自己决定何时继续读。
    func serverDeliverPartialFirst() {
        serverSocket.bind()
        let server = serverSocket.accept()
        let buf = Array<UInt8>(1024, repeat: 0)
        server.read(buf)
        let total = 1024 * 1024
        server.write("HTTP/1.1 200 ok\r\nContent-Length: ${total}\r\n\r\n".toArray())
        server.write(Array<UInt8>(4096, repeat: UInt8(7)))
        sleep(Duration.second * 2)                       // 剩余正文延后 2 秒
        var sent = 4096
        let chunk = Array<UInt8>(64 * 1024, repeat: UInt8(7))
        while (sent < total) {
            let n = if (total - sent > chunk.size) { chunk.size } else { total - sent }
            server.write(chunk[..n])
            sent += n
        }
        server.close()
    }

    @TestCase
    func testResponseReturnsBeforeBodyComplete(): Unit {
        let fut = spawn { serverDeliverPartialFirst() }
        sleep(Duration.millisecond * 100)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let client = ClientBuilder().build()
        let start = DateTime.now()
        let resp = client.get("http://127.0.0.1:${port}/large")
        let elapsed = DateTime.now() - start
        @Expect(resp.status, 200)
        // 收到响应头即返回：不应被"剩余正文还没到"阻塞（旧实现会等满 2 秒）
        @Expect(elapsed.toMilliseconds() < 1500, true)
        // 正文仍可正常读全（按需读取不改变读取结果的正确性）
        var received = 0
        let buf = Array<UInt8>(64 * 1024, repeat: 0)
        var len = resp.body.read(buf)
        while (len != 0) {
            received += len
            len = resp.body.read(buf)
        }
        @Expect(received, 1024 * 1024)
        fut.get()
        client.close()
    }
}
