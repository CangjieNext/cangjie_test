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
 *       Test HttpHeaders#createDefault
 * Test API:
 *       func add(name: String, value: String): Unit
 *       func set(name: String, values: ArrayList<String>): Unit
 *       func get(name: String): ?ArrayList<String>
 *       func del(name: String): Unit
 *       static func createDefault(): HttpHeaders
 *
 *       for-each HttpHeaders
 */

package tests.headers

import stdx.net.http.HttpHeaders
import std.collection.ArrayList

@Test
class TestHttpHeaders {
    @TestCase
    func httpHeaders(): Unit {
        let headers = HttpHeaders()

        headers.add("k1", "v1")
        headers.add("k1", "v2")
        headers.add("k2", "v3")

        headers.set("k3", "v4")
        headers.add("k3", "v5")

        println(headers.get("k1").toArray())

        headers.del("k1")

        for ((k, v) in headers) {
            println("key: ${k}, values: ${v.toArray()}")
        }
    }
}

/* SCAN-IN
[v1, v2]
key: k2, values: [v3]
key: k3, values: [v4, v5]
 */
