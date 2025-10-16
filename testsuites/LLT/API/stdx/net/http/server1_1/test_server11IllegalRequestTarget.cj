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
 *      Test class Server
 *          If the request target starts with "//", the request target is not considered valid.
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.log.*
import std.net.TcpSocket

@Test
class TestServer11IllegalRequestTarget {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16

    @TestCase
    func clAndTeTest(): Unit {
        startServer()
        sleep(Duration.second)
        port = server.port
        sendRequest()
        server.close()
    }

    func startServer() {
        server.logger.level = LogLevel.DEBUG
        server.distributor.register("/cookie", {_ => ()})
        sleep(Duration.millisecond * 100)
        spawn {
            server.serve()
        }
    }

    func sendRequest() {
        let client = TcpSocket("127.0.0.1", port)
        client.connect()

        let request = "GET //co//cookie HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length:18\r\nConnection: keep-alive\r\n\r\ntest mutilple host"
            .toArray()
        client.write(request)

        sleep(Duration.millisecond * 400)

        let arr = Array<UInt8>(1000, repeat: 0)
        let len = client.read(arr)
        let resp = String.fromUtf8(arr.slice(0, len))
        println(resp)
        @Expect(resp.contains("HTTP/1.1 400 Bad Request\r\n"))
        client.close()
    }
}

/* SCAN-IN
Invalid request target
 */
