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
 *       Test CookieJar#parseSetCookieHeader
 * Test API:
 *       static func parseSetCookieHeader(response: HttpResponse): ArrayList<Cookie>
 */

package tests.cookie

import stdx.net.http.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestCookieJarParseSetCookieHeader2 {
    let httpRequest = HttpRequestBuilder()
        .url(URL.parse("https://example.com/hello/a"))
        .method("GET")
        .version(HTTP1_1)
        .build()
    @TestCase
    func parseSetCookieHeaderWithoutSetCookie(): Unit {
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)
        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())
        @Expect(resultCookies.isEmpty(), true)
        println("ok")
    }

    @TestCase
    func parseSetCookieHeaderWithoutSemicolon(): Unit {
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)
        httpResponseBuilder.header("Set-Cookie", "3P_JAR=2023-03-24-04")
        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())
        @Expect(resultCookies[0].toSetCookieString(), "3P_JAR=2023-03-24-04")
    }

    @TestCase
    func parseSetCookieHeaderWithoutSemicolon2(): Unit {
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)
        httpResponseBuilder.header("Set-Cookie", "")
        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())
        @Expect(resultCookies.isEmpty())
    }

    @TestCase
    func parseSetCookieHeaderInvalid(): Unit {
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)
        httpResponseBuilder.header("Set-Cookie", ";a")
        httpResponseBuilder.header("Set-Cookie", "a;")
        httpResponseBuilder.header("Set-Cookie", "=a;")
        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())
        @Expect(resultCookies.isEmpty())
    }

    @TestCase
    func parseSetCookieHeaderNameValue(): Unit {
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)
        httpResponseBuilder.header("Set-Cookie", "a=b;") // a=b
        httpResponseBuilder.header("Set-Cookie", "a=b") // a=b
        httpResponseBuilder.header("Set-Cookie", "a=\"b\"") // a="b"
        httpResponseBuilder.header("Set-Cookie", "a=\"b")
        httpResponseBuilder.header("Set-Cookie", "a=,b;")
        httpResponseBuilder.header("Set-Cookie", "a= b c")
        httpResponseBuilder.header("Set-Cookie", "a= b ") // a=b
        httpResponseBuilder.header("Set-Cookie", " ! = b ") // !=b
        httpResponseBuilder.header("Set-Cookie", " [] = b ") // a=b
        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())
        let resultBuilder = StringBuilder()
        for (resultCookie in resultCookies) {
            resultBuilder.append(resultCookie.toSetCookieString())
        }
        @Expect(resultBuilder.toString(), "a=ba=ba=\"b\"a=b!=b")
    }

    @TestCase
    func parseSetCookieHeaderExpires(): Unit {
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)
        httpResponseBuilder.header("Set-Cookie", "a=b; ; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  expIRes =Sun, 23 Apr 2023 04:12:34 UTC; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  expIRes =S, 23 Apr 2023 04:12:34 UTC; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  expIRes = Fri, 12 Jan 1601 12:12:12 UTC; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  expIRes = Wed, 12 Jan 1600 12:12:12 UTC; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  expIRes ; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  expIRes =  ; ;")

        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())

        @Expect(resultCookies[0].others.isEmpty(), true)
        @Expect(resultCookies[1].toSetCookieString(), "a=b; Expires=Sun, 23 Apr 2023 04:12:34 UTC")
        @Expect(resultCookies[2].toSetCookieString(), "a=b")
        @Expect(resultCookies[3].toSetCookieString(), "a=b; Expires=Fri, 12 Jan 1601 12:12:12 UTC")
        @Expect(resultCookies[4].toSetCookieString(), "a=b")
        @Expect(resultCookies[5].toSetCookieString(), "a=b")
        @Expect(resultCookies[6].toSetCookieString(), "a=b")
    }

    @TestCase
    func parseSetCookieHeaderMaxAge(): Unit {
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)

        httpResponseBuilder.header("Set-Cookie", "a=b;  max-Age; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  max-Age=-2.2; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  max-Age=-22; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  max-Age=22; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  max-Age = ; ;")

        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())

        @Expect(resultCookies[0].toSetCookieString(), "a=b")
        @Expect(resultCookies[1].toSetCookieString(), "a=b")
        @Expect(resultCookies[2].maxAge, Some(-22))
        @Expect(resultCookies[3].toSetCookieString(), "a=b; Max-Age=22")
        @Expect(resultCookies[4].toSetCookieString(), "a=b")
    }

    @TestCase
    func parseSetCookieHeaderDomain(): Unit {
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)

        httpResponseBuilder.header("Set-Cookie", "a=b;  dOmain; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  dOmain= ; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  dOmain=.a.b.c; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  dOmain=a-b.c; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  dOmain=12.c; ;")
        let sb = StringBuilder()
        for (_ in 0..64) {
            sb.append("a")
        }
        httpResponseBuilder.header("Set-Cookie", "a=b;  dOmain=12.${sb.toString()}; ;")
        let sb2 = StringBuilder()
        for (_ in 0..127) {
            sb2.append("a.")
        }
        sb2.append("aa")
        httpResponseBuilder.header("Set-Cookie", "a=b;  dOmain=12.${sb2.toString()}; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  dOmain=12.v-.a; ;")

        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())

        @Expect(resultCookies[0].toSetCookieString(), "a=b")
        @Expect(resultCookies[1].toSetCookieString(), "a=b")
        @Expect(resultCookies[2].toSetCookieString(), "a=b; Domain=a.b.c")
        @Expect(resultCookies[3].toSetCookieString(), "a=b; Domain=a-b.c")
        @Expect(resultCookies[4].toSetCookieString(), "a=b; Domain=12.c")
        @Expect(resultCookies[5].toSetCookieString(), "a=b")
        @Expect(resultCookies[6].toSetCookieString(), "a=b")
        @Expect(resultCookies[7].toSetCookieString(), "a=b")
    }

    @TestCase
    func parseSetCookieHeaderPath(): Unit {
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)

        httpResponseBuilder.header("Set-Cookie", "a=b;  paTH; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  paTH=/abc; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  paTH=/12; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  paTH = ; ;")

        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())

        @Expect(resultCookies[0].toSetCookieString(), "a=b; Path=/hello")
        @Expect(resultCookies[1].toSetCookieString(), "a=b; Path=/abc")
        @Expect(resultCookies[2].toSetCookieString(), "a=b; Path=/12")
        @Expect(resultCookies[3].toSetCookieString(), "a=b; Path=/hello")
    }

    @TestCase
    func parseSetCookieHeaderSecureHttpOnly(): Unit {
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)

        httpResponseBuilder.header("Set-Cookie", "a=b;  SecUrE; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  httpOnLy; ;")

        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())

        @Expect(resultCookies[0].toSetCookieString(), "a=b; Secure")
        @Expect(resultCookies[1].toSetCookieString(), "a=b; HttpOnly")
    }

    @TestCase
    func parseSetCookieHeaderOthers(): Unit {
        let httpResponseBuilder = HttpResponseBuilder().request(httpRequest)

        httpResponseBuilder.header("Set-Cookie", "a=b;  SecUr; ;")
        httpResponseBuilder.header("Set-Cookie", "a=b;  httpOnL ; ;")

        let resultCookies = CookieJar.parseSetCookieHeader(httpResponseBuilder.build())

        @Expect(resultCookies[0].others.contains("SecUr"))
        @Expect(resultCookies[1].others.contains("httpOnL"))
    }
}

/* SCAN-IN

ok
 */
