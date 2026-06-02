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
 *      enum Protocol
 * Test API:
 *      static func fromString(str: String): Protocol
 */

package tests.enumtest

import stdx.net.http.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestProtocol {
    @TestCase
    func testProtocol(): Unit {
        let protocol2 = HTTP2_0
        let protocolWeb = UnknownProtocol("websocket")
        let str = protocolWeb.toString()
        @Expect(str, "websocket")
        @Expect(protocol2, HTTP2_0)

        let protocolWeb2 = UnknownProtocol("websocket")
        let protocolWeb3 = UnknownProtocol("websocket3")
        if (protocolWeb != protocolWeb2) {
            @Expect(1, 2)
        }

        if (protocolWeb == protocolWeb3) {
            @Expect(1, 2)
        }
    }
}
