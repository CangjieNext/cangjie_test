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
 *      Test class ServerBuilder
 *          Exceptions can be accurately thrown when invalid parameters are entered.
 * Test API:
 *       public func maxRequestHeaderSize(size: Int64): ServerBuilder
 *       public func maxRequestBodySize(size: Int64): ServerBuilder
 */

package tests.server

import stdx.net.http.*
import stdx.net.tls
import stdx.crypto.kit
import std.net.*

@Test
class IllegalParaTest {
    var port = 0u16
    let listener = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0u16))
    var server = ServerBuilder().listener(listener).headerTableSize(10u32).build()

    @TestCase
    func negativeMaxHeaderSizeTest(): Unit {
        @Expect(server.headerTableSize, 10u32)
    }

    @TestCase
    func negativeMaxBodySizeTest(): Unit {
        server = ServerBuilder().listener(listener).maxHeaderListSize(10u32).build()
        @Expect(server.maxHeaderListSize, 10u32)
    }
}
