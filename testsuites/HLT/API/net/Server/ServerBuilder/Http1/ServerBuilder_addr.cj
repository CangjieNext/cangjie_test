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
public class Test_ServerBuilder_addr {
    @TestCase
    func case1(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        @Expect(server.addr, "127.0.0.1")
        server.close()
    }

    @TestCase
    func case2(): Unit {
        let server = ServerBuilder().addr("255.255.255.255").port(0).build()
        @Expect(server.addr, "255.255.255.255")
        server.close()
    }

    @TestCase
    func case3(): Unit {
        let server = ServerBuilder().addr("172.168.1.1").port(0).build()
        @Expect(server.addr, "172.168.1.1")
        server.close()
    }

    @TestCase
    func abnormal_01(): Unit {
        var flag = false
        try {
            let server = ServerBuilder().addr("").port(0).build()
        } catch (e: IllegalFormatException) {
            flag = true
            @Expect(e.message.contains("Unable to parse IP"))
        }
        @Expect(flag, true)
    }

    @TestCase
    func abnormal_02(): Unit {
        var flag = false
        try {
            let server = ServerBuilder().addr("#$%一二三").port(0).build()
        } catch (e: IllegalFormatException) {
            flag = true
            @Expect(e.message.contains("Missing IPv6 address"))
        }
        @Expect(flag, true)
    }

    @TestCase
    func abnormal_03(): Unit {
        var flag = false
        try {
            let server = ServerBuilder().addr("256.255.255.255").port(0).build()
        } catch (e: IllegalFormatException) {
            flag = true
            @Expect(e.message.contains("IPv4 field has value >255"))
        }
        @Expect(flag, true)
    }

    @TestCase
    func addr_overwrite(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").addr("127.0.0.1").port(0).build()
        @Expect(server.addr, "127.0.0.1")
        server.close()
    }
}
