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
 *      Test HttpHeaders clone in HttpRequest clone.
 *      Operation on the first HttpHeaders should not make change on the second, which is cloned from the first.
 * Test API:
 *      public init(request: HttpRequest)
 */

package tests.headers

import std.collection.*
import std.io.*
import stdx.net.http.*

@Test
class TestHeadersClone {
    @TestCase
    func testHeadersClone() {
        let h1 = HttpHeaders()
        h1.add("1", "a")
        h1.add("1", "aa")
        h1.add("2", "b")
        h1.add("3", "c")
        h1.add("4", "d")
        let req1 = HttpRequestBuilder().setHeaders(h1).build()
        let req2 = HttpRequestBuilder(req1).build()
        let h2 = req2.headers
        h1.add("1", "aaa") // modify ArrayList in HeaderValue
        h1.add("2", "bb") // construct an ArrayList in HeaderValue
        h1.del("3") // delete a field line
        h1.set("4", "dd") // modify _single in HeaderValue
        h1.add("5", "e") // add a field line

        for ((k, vs) in h1) {
            for (v in vs) {
                println("${k}: ${v}")
            }
        }
        println("-------------------------------")
        for ((k, vs) in h2) {
            for (v in vs) {
                println("${k}: ${v}")
            }
        }
    }
}

/* SCAN-IN
1: a
1: aa
1: aaa
2: b
2: bb
5: e
4: dd
-------------------------------
1: a
1: aa
2: b
3: c
4: d
 */
