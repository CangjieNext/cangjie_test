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
 * Test description: Test url function
 * Test API: public func url(rawUrl: String): HttpRequestBuilder
 *           public func url(url: URL): HttpRequestBuilder
 */

import stdx.net.http.*
import stdx.encoding.url.*

@Test
class Test_HttpRequestBuilder_Url_01 {
    //合法方法, 仅一次
    @TestCase
    func test_url_01(): Unit {
        var req1 = HttpRequestBuilder().url("http://127.0.0.1:8080/index").build()
        var req2 = HttpRequestBuilder().url(URL.parse("http://127.0.0.1:8080/index")).build()
        @Expect(req1.url.toString(), req2.url.toString())
    }

    //默认方法：""
    @TestCase
    func test_url_02(): Unit {
        var req1 = HttpRequestBuilder().build()
        @Expect(req1.url.toString(), "")
    }

    //字符串非法
    @TestCase
    func test_url_03(): Unit {
        var urls = ["http://127.0.0.1:8080/i\r", "http://127.0.0.1:8080/i\0"]
        for (url in urls) {
            try {
                var req1 = HttpRequestBuilder().url(url).build()
                @Expect(1, 2)
            } catch (e: UrlSyntaxException) {
            }
        }
    }

    //合法方法多次: 覆盖前值
    @TestCase
    func test_url_04(): Unit {
        var req1 = HttpRequestBuilder().url("http://127.0.0.1:8080/index").url("http://127.0.0.1:8080/hello").build()
        @Expect(req1.url.toString(), "http://127.0.0.1:8080/hello")
    }
}
