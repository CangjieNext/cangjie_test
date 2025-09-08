/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt  -o %n.%suffix %f --test
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import stdx.crypto.common.*

@Test
class Test_crypto_exception {
    @TestCase
    func test_crypto_exception(): Unit {
        let exception = CryptoException()
        @Expect(exception.message, "")
        @Expect(exception.toString(), "CryptoException")
    }
}
