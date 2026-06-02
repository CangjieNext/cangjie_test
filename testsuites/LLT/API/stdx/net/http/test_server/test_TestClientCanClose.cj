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
 * Can the HTTP/1.1 client close persistent connection via Connection:close?
 */
package tests.go_server

import stdx.net.http.*
import stdx.net.tls.*
import std.net.TcpSocket
import std.unittest.*
import std.unittest.testmacro.*

@Test
class ClientCanClose {
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
        server.distributor.register("/contentTest", {_ => count++})
        spawn {
            server.serve()
        }
    }

    func sendContentRequest() {
        // connect
        var client = TcpSocket("127.0.0.1", port)
        client.connect()

        var input = "GET /contentTest HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 5\r\nConnection: close\r\n\r\nhelloGET /contentTest HTTP/1.0\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 5\r\nConnection: keep-alive\r\n\r\nhello"
        client.write(input.toArray())
        sleep(Duration.millisecond * 100)
        client.write(input.toArray())
        sleep(Duration.millisecond * 100)
        @Expect(count, 1)
        client.close()
    }
}
