/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *       Test HttpHeaders set illegal headers
 * Test API:
 *       func set(name: String, values: ArrayList<String>): Unit
 */

package tests.headers

import stdx.net.http.*
import std.collection.ArrayList

@Test
class TestIllegalHeaders {
    @TestCase
    func httpHeaders(): Unit {
        let headers = HttpHeaders()
        var passCase = 0

        try {
            headers.set("bond:", "GG bond")
        } catch (e: HttpException) {
            passCase++
        }

        try {
            headers.set("bond", "GG \rbond")
        } catch (e: HttpException) {
            passCase++
        }

        try {
            headers.add("", "GG bond")
        } catch (e: HttpException) {
            passCase++
        }

        try {
            headers.set("", "GG bond")
        } catch (e: HttpException) {
            passCase++
        }

        println(passCase)
    }
}

/* SCAN-IN
4
 */
