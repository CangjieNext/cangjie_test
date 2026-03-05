/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt
// ASSERT: scan pass01 pass02

import cangjie_stdx::compress
import cangjie_stdx::crypto
import cangjie_stdx::encoding
import cangjie_stdx::net
import cangjie_stdx::serialization
import cangjie_stdx::log
import cangjie_stdx::logger
import std.crypto as stdcrypto
import std.database

@Test
class TopPackageTest {
    // 无实际业务功能，编译通过即可
    @TestCase
    func testImportTopPackage(): Unit {
        @Expect(true)
    }
}
