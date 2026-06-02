/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

/*
 * Test description:
 *      test basic function
 * Test API:
 *      public static func resolve(domain: String, port: UInt16): ?SocketAddress
 */

import std.net.*

@Test
class Test_SocketAddress_Resolve_Port {
    func case01(x: UInt16): Unit {
        var addr = IPAddress.resolve("localhost")
        @Expect(addr.size > 0)
        @Expect(addr[0].toString(), "127.0.0.1")
    }
}
