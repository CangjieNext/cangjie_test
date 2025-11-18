/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../data
// DEPENDENCE: ../../../asan
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx %cmp_opt asan.%middle %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description:
 *      test upgrade method dealing with body
 * Test API:
 *      public func upgrade(ctx: HttpContext): StreamingSocket
 */

import stdx.net.http.*

@Test
class Test_Upgrade_Body {
    var port = 0u16
    var arrbody = Array<UInt8>(16 * 1024, repeat: 66)
    let client = ClientBuilder().build()

    // 请求，响应均含有body, 若请求不合规，body无法发出
    @TestCase
    func upgradeTest(): Unit {
        let request1 = HttpRequestBuilder().url("http://127.0.0.1:${port}/ok").body(arrbody).build()
        let request2 = HttpRequestBuilder()
            .url("http://127.0.0.1:${port}/ok")
            .method("CONNECT")
            .header("Upgrade", "abc")
            .body(arrbody)
            .build()
        try {
            client.upgrade(request1)
        } catch (e: HttpException) {
            @Expect(e.message.contains("request header must contain Upgrade header"))
        }
        try {
            client.upgrade(request2)
        } catch (e: HttpException) {
            @Expect(e.message.contains("CONNECT request is not supported by upgrade"))
        }
        client.close()
    }
}
