/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *       Test Server & ServerBuilder
 * Test API:
 *       public func afterBind(f: ()->Unit): Unit
 *       public func afterBind(f: ()->Unit): ServerBuilder
 */

package tests.server

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.net.tls
import std.sync.SyncCounter
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestAfterBind {
    @TestCase
    func registerByServer(): Unit {
        let on = SyncCounter(1)
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.afterBind({=> on.dec()})
        spawn {server.serve()}
        on.waitUntilZero()
        server.close()
    }

    @TestCase
    func registerByServerBuilder(): Unit {
        let on = SyncCounter(1)
        let server = ServerBuilder().addr("127.0.0.1").port(0).afterBind({=> on.dec()}).build()
        spawn {server.serve()}
        on.waitUntilZero()
        server.close()
    }
}
