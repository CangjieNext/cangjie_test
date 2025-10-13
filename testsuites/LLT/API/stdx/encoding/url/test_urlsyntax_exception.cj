/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC:%set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.encoding.url.*

@Test
class UrlSyntaxExceptionTest {
    @TestCase
    func ExceptionName(): Unit {
        let exception = UrlSyntaxException("Invalid url part.")
        @Expect(exception.toString() == "UrlSyntaxException: Invalid url part.")
    }

    @TestCase
    func ExceptionName_1(): Unit {
        let exception = UrlSyntaxException("Invalid url part.","reason","pos")
        @Expect(exception.toString() == "UrlSyntaxException: reason Input = Invalid url part. (at 'pos').")
    }
}
