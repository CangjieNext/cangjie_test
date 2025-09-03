/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit

@Test
public class Test_ServerBuilder_listener {
    @TestCase
    func only_listener(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 8085)
        let server = ServerBuilder().listener(serverSocket).build()
        @Expect(server.port, 8085)
        @Expect(server.addr, "0.0.0.0")
        server.close()
    }

    @TestCase
    func addr_port_and_listener(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 8085)
        let server = ServerBuilder().addr("127.0.0.1").port(0).listener(serverSocket).build()
        @Expect(server.port, 8085)
        @Expect(server.addr, "0.0.0.0")
        server.close()
    }

    @TestCase
    func listener_and_addr_port(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 8085)
        let server = ServerBuilder().listener(serverSocket).addr("127.0.0.1").port(0).build()
        @Expect(server.port, 8085)
        @Expect(server.addr, "0.0.0.0")
        server.close()
    }

    @TestCase
    func listener_overwrite(): Unit {
        let serverSocket1 = TcpServerSocket(bindAt: 8085)
        let serverSocket2 = TcpServerSocket(bindAt: 8086)
        let server = ServerBuilder().listener(serverSocket1).listener(serverSocket2).build()
        @Expect(server.port, 8086)
        @Expect(server.addr, "0.0.0.0")
        server.close()
    }
}
