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
 *       Test HttpRequestBuilder
 * Test API:
 *       public func priority(urg: Int64, inc: Bool): HttpRequestBuilder
 */

package tests.request

import stdx.net.http.*

@Test
class TestTrailer {
    @TestCase
    func requestSetPriorityUrg1(): Unit {
        try {
            let _ = HttpRequestBuilder()
                .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
                .priority(-1, true)
                .build()
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Illegal header, priority urgency should be in range [0, 7].")
        }
    }

    @TestCase
    func requestSetPriorityUrg2(): Unit {
        try {
            let _ = HttpRequestBuilder()
                .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
                .priority(8, true)
                .build()
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Illegal header, priority urgency should be in range [0, 7].")
        }
    }

    @TestCase
    func requestSetPriorityInc(): Unit {
        let _ = HttpRequestBuilder()
            .url("http://www.example.com:8080/path?name1=value1&name1=value2&name2=value3")
            .priority(2, false)
            .build()
        println("ok")
    }
}
/* SCAN-IN
ok
 */
