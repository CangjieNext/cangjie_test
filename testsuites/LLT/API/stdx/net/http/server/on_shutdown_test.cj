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
 *       Test Server & ServerBuilder
 * Test API:
 *       public func onShutdown(f: ()->Unit): Unit
 *       public func onShutdown(f: ()->Unit): ServerBuilder
 */

package tests.server

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestServeOnShutDown {
    @TestCase
    func registerByServerCloseByClose(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.onShutdown({=> println("register by server, close by #close")})
        server.close()
    }

    @TestCase
    func registerByServerBuilderCloseByClose(): Unit {
        ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .onShutdown({=> println("register by server builder, close by #close")})
            .build()
            .close()
    }

    @TestCase
    func registerByServerReplacedByServerCloseByClose(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.onShutdown({=> println("register by server, close by #close")})
        server.onShutdown({=> println("replaced server by server, close by #close")})
        server.close()
    }

    @TestCase
    func registerByServerBuilderReplacedByServerCloseByClose(): Unit {
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .onShutdown({=> println("register by server builder, close by #close")})
            .build()
        server.onShutdown({=> println("replaced serve builder by server, close by #close")})
        server.close()
    }

    @TestCase
    func registerByServerCloseByCloseGracefully(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.onShutdown({=> println("register by server, close by #closeGracefully")})
        server.close()
    }

    @TestCase
    func registerByServerBuilderCloseByCloseGracefully(): Unit {
        ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .onShutdown({=> println("register by server builder, close by #closeGracefully")})
            .build()
            .close()
    }

    @TestCase
    func registerByServerReplacedByServerCloseByCloseGracefully(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.onShutdown({=> println("register by server, close by #closeGracefully")})
        server.onShutdown({=> println("replaced server by server, close by #closeGracefully")})
        server.close()
    }

    @TestCase
    func registerByServerBuilderReplacedByServerCloseByCloseGracefully(): Unit {
        let server = ServerBuilder()
            .addr("127.0.0.1")
            .port(0)
            .onShutdown({=> println("register by server builder, close by #closeGracefully")})
            .build()
        server.onShutdown({=> println("replaced serve builder by server, close by #closeGracefully")})
        server.close()
    }
}

/* SCAN-IN
register by server, close by #close
register by server builder, close by #close
replaced server by server, close by #close
replaced serve builder by server, close by #close
register by server, close by #closeGracefully
register by server builder, close by #closeGracefully
replaced server by server, close by #closeGracefully
replaced serve builder by server, close by #closeGracefully
 */
