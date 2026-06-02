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
 *       Test CookieJar#removeExcessCookies
 *            domain:<path:<name:entry>>
 *            path expired
 * Test API:
 *       public func storeCookies(url: URL, cookies: ArrayList<Cookie>): Unit
 */
package tests.cookie

import stdx.net.http.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*

@Test
class TestCookieJarRemoveExcessExpiredCookies2 {
    @TestCase
    func cookieJarRemoveExcessExpiredCookies2(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies = ArrayList<Cookie>()
        for (i in 0..2950) {
            cookies.add(Cookie("${i}", "${i}"))
        }
        cookieJar.storeCookies(URL.parse("https://example.com/hello/a"), cookies)

        let cookies2 = ArrayList<Cookie>()
        for (i in 1..26) {
            cookies2.add(Cookie("${i}", "${i}", maxAge: 1))
        }
        cookieJar.storeCookies(URL.parse("https://example2.com/hello/a/"), cookies2)

        let cookies3 = ArrayList<Cookie>()
        for (i in 1..26) {
            cookies3.add(Cookie("${i}", "${i}", maxAge: 2))
        }
        cookieJar.storeCookies(URL.parse("https://example2.com/hello/b/"), cookies3)
        sleep(Duration.second)
        let cookie4 = Cookie("wow", "wow")
        cookieJar.storeCookies(URL.parse("https://example4.com/hello/a"), ArrayList<Cookie>([cookie4]))

        let cookiesFromJar1 = cookieJar.getCookies(URL.parse("https://example.com/hello/a"))
        let cookiesFromJar2 = cookieJar.getCookies(URL.parse("https://example2.com/hello/a"))
        let cookiesFromJar3 = cookieJar.getCookies(URL.parse("https://example2.com/hello/b"))
        let cookiesFromJar4 = cookieJar.getCookies(URL.parse("https://example4.com/hello/a"))
        println(CookieJar.toCookieString(cookiesFromJar1))
        println(CookieJar.toCookieString(cookiesFromJar2))
        println(CookieJar.toCookieString(cookiesFromJar3))
        println(CookieJar.toCookieString(cookiesFromJar4))
        println("ok")
    }
}

/* SCAN-IN
2900=2900; 2901=2901; 2902=2902; 2903=2903; 2904=2904; 2905=2905; 2906=2906; 2907=2907; 2908=2908; 2909=2909; 2910=2910; 2911=2911; 2912=2912; 2913=2913; 2914=2914; 2915=2915; 2916=2916; 2917=2917; 2918=2918; 2919=2919; 2920=2920; 2921=2921; 2922=2922; 2923=2923; 2924=2924; 2925=2925; 2926=2926; 2927=2927; 2928=2928; 2929=2929; 2930=2930; 2931=2931; 2932=2932; 2933=2933; 2934=2934; 2935=2935; 2936=2936; 2937=2937; 2938=2938; 2939=2939; 2940=2940; 2941=2941; 2942=2942; 2943=2943; 2944=2944; 2945=2945; 2946=2946; 2947=2947; 2948=2948; 2949=2949

1=1; 2=2; 3=3; 4=4; 5=5; 6=6; 7=7; 8=8; 9=9; 10=10; 11=11; 12=12; 13=13; 14=14; 15=15; 16=16; 17=17; 18=18; 19=19; 20=20; 21=21; 22=22; 23=23; 24=24; 25=25
wow=wow
ok
 */
