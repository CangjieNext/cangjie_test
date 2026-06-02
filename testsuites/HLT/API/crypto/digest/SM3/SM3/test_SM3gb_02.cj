/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*
import stdx.encoding.hex.*

@Test
class Test_SM3_02 {
    @TestCase
    func test_digest_GB01(): Unit {
        let toArr: Array<Byte> = [0x61, 0x62, 0x63]
        var sm3Instance = SM3()
        var md: Array<Byte> = digest(sm3Instance, toArr)
        var result: String = toHexString(md)
        @Expect(result, "66c7f0f462eeedd9d1f2d46bdc10e4e24167c4875cf2f7a2297da02b8f4ba8e0")
    }

    @TestCase
    func test_digest_case02(): Unit {
        let toArr: Array<Byte> = [0x61, 0x62, 0x63, 0x64, 0x61, 0x62, 0x63, 0x64, 0x61, 0x62, 0x63, 0x64, 0x61, 0x62,
            0x63, 0x64, 0x61, 0x62, 0x63, 0x64, 0x61, 0x62, 0x63, 0x64, 0x61, 0x62, 0x63, 0x64, 0x61, 0x62, 0x63, 0x64,
            0x61, 0x62, 0x63, 0x64, 0x61, 0x62, 0x63, 0x64, 0x61, 0x62, 0x63, 0x64, 0x61, 0x62, 0x63, 0x64, 0x61, 0x62,
            0x63, 0x64, 0x61, 0x62, 0x63, 0x64, 0x61, 0x62, 0x63, 0x64, 0x61, 0x62, 0x63, 0x64]
        var sm3Instance = SM3()
        var md: Array<Byte> = digest(sm3Instance, toArr)
        var result2: String = toHexString(md)
        @Expect(result2, "debe9ff92275b8a138604889c18e5a4d6fdb70e5387e5765293dcba39c0c5732")
    }
}
