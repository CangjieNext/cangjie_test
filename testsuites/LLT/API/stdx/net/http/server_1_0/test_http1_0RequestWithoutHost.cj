/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan GET /hello HTTP/1.0
// ASSERT: scan HTTP/1.1 200 OK

/*
 * Test description:
 *      Test class Server
 *          If HTTP/1.0 message received, while request header without `Host`.
 *       public func serve(): Unit
 */

import std.net.*
import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import std.sync.*
import std.time.*
import stdx.log.*

@Test
class TestHttp1_0RequestWithoutHost {
    @TestCase
    func test(): Unit {
        let port = startServer("/hello", "Hello Cangjie")

        let sock = TcpSocket("127.0.0.1", port)
        sock.connect()
        sock.write("GET /hello HTTP/1.0\r\nConnection: close\r\n\r\n".toArray())
        let buffer = Array<Byte>(256, repeat: 0)
        let len = sock.read(buffer)
        println("Rsp: ${String.fromUtf8(buffer[..len])}")
    }

    func startServer(path: String, body: String): UInt16 {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register(path, {ctx => ctx.responseBuilder.body(body)})
        server.logger.level = LogLevel.DEBUG
        spawn {server.serve()}
        sleep(Duration.millisecond * 100)
        return server.port
    }
}
