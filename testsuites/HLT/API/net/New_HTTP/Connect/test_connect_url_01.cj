/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description:
 *      test illegal url in concurrenct scenes
 * Test API:
 *      public func connect(url: String, headers!: HttpHeaders = HttpHeaders(), version!: Protocol=HTTP1_1)
 *                           : (HttpResponse, ?StreamingSocket)
 */

import stdx.net.http.*
import stdx.encoding.url.*
import std.net.*

@Test
class Test_Connect_Url {
    @TestCase
    func connect_01(): Unit {
        let client = ClientBuilder().build()
        try {
            client.connect("\\")
            @Expect(1, 2)
        } catch (e: UrlSyntaxException) {
        }
    }

    @TestCase
    func connect_02(): Unit {
        let client = ClientBuilder().build()
        var str = unsafe { String.fromUtf8Unchecked([129u8]) }
        try {
            client.connect(str)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
        }
    }
}
