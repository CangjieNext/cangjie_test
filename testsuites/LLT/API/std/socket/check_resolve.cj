/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.net.*

@Test
class Test_Resolve {
    @TestCase[x in [ "a..xx", "-.a.x", "a.-.x", ".a.x.a", 
 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", 
 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.xx" 
 ]]
    func test_resolve_fail(x: String): Unit {
        let ips = IPAddress.resolve(x)
        if (ips.size > 0) {
            @Assert(false)
        }
    }

    @TestCase
    func test_resolve_succ(): Unit {
        let ips = IPAddress.resolve("localhost")
        if (ips.size > 0) {
            @Expect(ips[0].toString(), "127.0.0.1")
        }
    }
}
