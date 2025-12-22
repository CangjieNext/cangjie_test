/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.crypto.kit.DefaultCryptoKit
import stdx.crypto.common.*

@Test
class Test_GetGlobalCryptoKit_01 {
    @TestCase
    func test_01(): Unit {
        getGlobalCryptoKit()
        @Assert(getGlobalCryptoKit() is DefaultCryptoKit)
    }

    @TestCase
    func test_02(): Unit {
        setGlobalCryptoKit(DefaultCryptoKit())
        @Assert(getGlobalCryptoKit() is DefaultCryptoKit)
    }
}
