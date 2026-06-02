/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/**
 * Test description:
 *      Test HttpHeaders
 * Test API:
 *          public func add(name: String, value: String): Unit
 */

package tests.headers

import stdx.net.http.*

@Test
class TestHttpHeadersValueAdd {
    @TestCase
    func httpHeaders(): Unit {
        let headers = HttpHeaders()
        try {
            headers.add("", "foo")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }

        try {
            headers.add(",", "foo")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }

        println("ok")
    }
}
/* SCAN-IN
ok
 */
