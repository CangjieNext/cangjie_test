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
public class Test_ServerBuilder_port {
    @TestCase
    func case1(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        @Expect(server.port, 0)
        server.close()
    }

    @TestCase
    func case2(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(65535).build()
        @Expect(server.port, 65535)
        server.close()
    }

    @TestCase
    func case3(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(8080).build()
        @Expect(server.port, 8080)
        server.close()
    }

    @TestCase
    func port_overwrite(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).port(8080).build()
        @Expect(server.port, 8080)
        server.close()
    }
}
