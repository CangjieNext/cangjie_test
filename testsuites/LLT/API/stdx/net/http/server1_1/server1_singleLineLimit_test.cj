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
 *          When a header exceeds the limit of a single line, the log information is correct.
 * Test API:
 *       public func serve(): Unit
 */

package tests.server1_1

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.log.*
import std.net.TcpSocket

@Test
class TestServer11SingleLineLimit {
    let server = ServerBuilder().addr("127.0.0.1").port(0).build()
    var port = 0u16
    let singleLineSize = 8 * 1000 * 1024 + 1

    @TestCase
    func singleHeaderLimitTest(): Unit {
        startServer()
        sleep(Duration.millisecond * 500)
        port = server.port
        sendRequest()
        sleep(Duration.second)
        server.close()
    }

    func startServer() {
        server.logger.level = LogLevel.DEBUG
        server.distributor.register("/singleHeader", {_ => ()})
        spawn {
            server.serve()
        }
        sleep(Duration.millisecond * 100)
    }

    func sendRequest() {
        var client = TcpSocket("127.0.0.1", port)
        client.connect()

        // write preface and initial settings
        let request1 = "GET /singleHeader HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nContent-Length: 24\r\nConnection: keep-alive\r\n"
            .toArray()
        client.write(request1)
        let request2 = ("a" * singleLineSize).toArray()
        client.write(request2)

        sleep(Duration.millisecond * 100)
        let buf = Array<UInt8>(500, repeat: 0)
        while (client.read(buf) != 0) {}
        client.close()
    }
}

/* SCAN-IN
Single header size out of limit 8192000.
 */
