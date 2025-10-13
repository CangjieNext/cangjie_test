/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.log.*
import stdx.logger.*
import std.console.Console
import std.net.*
import std.time.*
import std.sync.*
import std.unittest.*
import std.unittest.testmacro.*
import std.math.*
import std.convert.Parsable

var flag = false

@Test
class Test_ClientConnector {
    var server = unsafe { zeroValue<Server>() }

    @TestCase
    func connector(): Unit {
        startServer()
        var client = ClientBuilder().connector(TcpConnector).build()
        let resp = client.get("http://127.0.0.1:${server.port}/")
        let buf_true = Array<UInt8>(20, repeat: 0)
        resp.body.read(buf_true)
        @Expect(flag, true)
        @Expect(resp.status, 200)
        @Expect(String.fromUtf8(buf_true).contains("TcpConnector"), true)
        client.close()
        server.close()
    }

    let TcpConnector = {
        sa: SocketAddress =>
        let socket = TcpSocket(sa)
        socket.connect()
        flag = true
        return socket
    }

    func startServer() {
        server = ServerBuilder().addr("127.0.0.1").port(0).build()

        server.distributor.register("/", {
            ctx => ctx.responseBuilder.body("TcpConnector")
        })
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
    }
}
