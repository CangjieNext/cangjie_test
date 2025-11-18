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
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit

var f = flag()

@Test
public class Test_onShutdown {
    @TestCase
    func overwrite(): Unit {
        f.a = 0
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .onShutdown({=> f.a = 1})
            .onShutdown({=> f.a = 2})
            .build()
        server.close()
        @Expect(f.a, 2)
    }

    @TestCase
    func close_by_closeGracefully(): Unit {
        f.a = 0
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .onShutdown({=> f.a = 3})
            .onShutdown({=> f.a = 4})
            .build()
        server.closeGracefully()
        @Expect(f.a, 4)
    }

    @TestCase
    func multiple_close(): Unit {
        f.a = 0
        let server = ServerBuilder().addr("127.0.0.1").port(0).onShutdown({=> f.a++}).build()
        server.closeGracefully()
        server.close()
        server.closeGracefully()
        server.close()
        @Expect(f.a, 1)
    }
}

class flag {
    var a: Int = 0
}
