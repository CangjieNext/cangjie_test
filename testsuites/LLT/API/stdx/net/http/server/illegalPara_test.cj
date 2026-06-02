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
 *       public func initialWindowSize(size: UInt32): ServerBuilder
 *       public func maxFrameSize(size: UInt32): ServerBuilder
 */

package tests.server

import stdx.net.http.*
import std.net.*

@Test
class IllegalParaTest {
    var port = 0u16
    let listener = TcpServerSocket(bindAt: IPSocketAddress("127.0.0.1", 0u16))

    @TestCase
    func negativeMaxHeaderSizeTest(): Unit {
        try {
            let _ = ServerBuilder().listener(listener).maxRequestHeaderSize(-1).build()
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Headers size shouldn't be negative"))
        }
    }

    @TestCase
    func negativeMaxBodySizeTest(): Unit {
        try {
            let _ = ServerBuilder().listener(listener).maxRequestBodySize(-1).build()
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Body size shouldn't be negative"))
        }
    }

    @TestCase
    func overInitialWindowSizeTest(): Unit {
        try {
            let _ = ServerBuilder().listener(listener).initialWindowSize(UInt32(2 ** 31)).build()
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Initial window size should not exceed 2^31-1"))
        }
    }

    @TestCase
    func overmaxFrameSizeTest(): Unit {
        try {
            let _ = ServerBuilder().listener(listener).maxFrameSize(2 ^ 24).build()
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Max frame size should not be under 2^14 or over 2^24-1"))
        }
    }
}
