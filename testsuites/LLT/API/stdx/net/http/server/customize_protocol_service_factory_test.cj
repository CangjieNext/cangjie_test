/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *       Test ServerBuilder、ProtocolServiceFactory、ProtocolService
 * Test API:
 *       public func protocolServiceFactory(factory: ProtocolServiceFactory): ServerBuilder
 */

package tests.server

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*
import std.time.*
import std.net.*

@Test
class TestCustomizeProtocolServiceFactory {
    @TestCase
    func testCustomize(): Unit {
        let server = startServerByIProtocolService()
        let client = ClientBuilder().build()
        let rsp = client.get("http://127.0.0.1:${server.port}")
        let buf = Array<Byte>(128, repeat: 0)
        while (rsp.body.read(buf) != 0) {
            println(String.fromUtf8(buf))
        }

        server.close()
        client.close()
    }
}

func startServerByIProtocolService() {
    let server = ServerBuilder().addr("127.0.0.1").port(0).protocolServiceFactory(IProtocolServiceFactory()).build()
    spawn {
        server.serve()
    }
    sleep(Duration.millisecond * 200)
    return server
}

class IProtocolServiceFactory <: ProtocolServiceFactory {
    public func create(p: Protocol, socket: StreamingSocket): ProtocolService {
        return IProtocolService(socket)
    }
}

class IProtocolService <: ProtocolService {
    let conn: StreamingSocket
    init(conn: StreamingSocket) {
        this.conn = conn
    }
    protected func serve() {
        conn.write("HTTP/1.1 200 ok\r\ncontent-length: 22\r\n\r\nHello IProtocolService".toArray())
        conn.close()
    }
}

/* SCAN-IN
Hello IProtocolService
 */
