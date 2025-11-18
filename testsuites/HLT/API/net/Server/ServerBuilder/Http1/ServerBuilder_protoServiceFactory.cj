/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run_stdx %output %run_utest_opt %run_args 2>&1 | compare %f
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.math.*
import std.convert.Parsable

class IProtocolServiceFactory <: ProtocolServiceFactory {
    public func create(p: Protocol, s: StreamingSocket): ProtocolService {
        s.write("HTTP/1.1 200 ok\r\ncontent-length: 22\r\n\r\nHello IProtocolService".toArray())
        return IProtocolService()
    }
}

class IProtocolService <: ProtocolService {
    public func serve(): Unit {
        sleep(Duration.second * 3)
    }

    public func close(): Unit {
        println("ProtocolServiceFactory close")
    }

    public func closeGracefully(): Unit {
        println("ProtocolServiceFactory closeGracefully")
    }
}

@Test
public class Test_protoServerFactory {
    @TestCase
    func close_by_close(): Unit {
        let myProtocol = IProtocolServiceFactory()
        let server = ServerBuilder().addr("127.0.0.1").port(0).protocolServiceFactory(myProtocol).build()
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let client = ClientBuilder().build()

        let res = client.get("http://127.0.0.1:${server.port}/")
        let buf = Array<UInt8>(22, repeat: 0)
        res.body.read(buf)
        @Expect(res.status, 200)
        @Expect(String.fromUtf8(buf),"Hello IProtocolService")
        server.close()
        client.close()
    }

    @TestCase
    func close_by_closeGracefully(): Unit {
        let myProtocol = IProtocolServiceFactory()
        let server = ServerBuilder().addr("127.0.0.1").port(0).protocolServiceFactory(myProtocol).build()
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let client = ClientBuilder().build()

        let res = client.get("http://127.0.0.1:${server.port}/")
        let buf = Array<UInt8>(22, repeat: 0)
        res.body.read(buf)
        @Expect(res.status, 200)
        @Expect(String.fromUtf8(buf),"Hello IProtocolService")
        server.closeGracefully()
        client.close()
    }
}

// ASSERT: scan ProtocolServiceFactory close
// ASSERT: scan ProtocolServiceFactory closeGracefully
