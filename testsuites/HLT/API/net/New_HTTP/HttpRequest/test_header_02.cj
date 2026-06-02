/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args
/*
 * Test description: Test negative header function
 * Test API: public func header(key: String, value: String): HttpRequestBuilder
 *           public func addHeaders(headers: HttpHeaders): HttpRequestBuilder
 *           public func setHeaders(headers: HttpHeaders): HttpRequestBuilder
 */

import stdx.net.http.*

@Test
class Test_HttpRequestBuilder_Header_02 {
    //非法token
    @TestCase
    func test_header_01(): Unit {
        var names = [" E", "E ", " A ", "123\0", "abc\r", "", "仓颉", ":", ",", ";"]
        for (name in names) {
            try {
                var req1 = HttpRequestBuilder().header(name, "123").build()
                @Expect(1, 2)
            } catch (e: HttpException) {
            }
        }
    }

    //value: 非法字符
    @TestCase
    func test_header_02(): Unit {
        try {
            var req1 = HttpRequestBuilder().header("1234", "123\0").build()
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            var req1 = HttpRequestBuilder().header("1234", "123\r4").build()
            @Expect(1, 3)
        } catch (e: HttpException) {
        }
        try {
            var req1 = HttpRequestBuilder().header("1234", "123\n4").build()
            @Expect(1, 4)
        } catch (e: HttpException) {
        }
    }
}
