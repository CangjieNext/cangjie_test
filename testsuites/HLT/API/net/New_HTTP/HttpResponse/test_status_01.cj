/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test status function
 * Test API: public func status(status: UInt16): HttpResponseBuilder
 */

import stdx.net.http.*

@Test
class Test_HttpResponse_Status_01 {
    // test illegal status code
    @TestCase
    func test_status_01(): Unit {
        for (i in 0..100) {
            try {
                var res = HttpResponseBuilder().status(UInt16(i)).build()
                @Expect(1, 2)
            } catch (e: HttpException) {
            }
        }
        for (i in 600..65535) {
            try {
                var res = HttpResponseBuilder().status(UInt16(i)).build()
                @Expect(1, 2)
            } catch (e: HttpException) {
            }
        }
    }

    // test legal status code
    @TestCase
    func test_status_02(): Unit {
        for (i in 100..600) {
            var res = HttpResponseBuilder().status(UInt16(i)).build()
            @Expect(res.status, UInt16(i))
        }
    }

    // test default status code
    @TestCase
    func test_status_03(): Unit {
        var res = HttpResponseBuilder().build()
        @Expect(res.status, UInt16(200))
    }
}
