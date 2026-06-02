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
class TestCookieJarRemoveExcessCookies {
    @TestCase
    func cookieJarRemoveExcessCookies(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies = ArrayList<Cookie>()
        for (i in 0..2900) {
            cookies.add(Cookie("${i}", "${i}"))
        }
        cookieJar.storeCookies(URL.parse("https://example.com/hello/a"), cookies)

        let cookies2 = ArrayList<Cookie>()
        for (i in 1..51) {
            cookies2.add(Cookie("${i}", "${i}", maxAge: i))
        }
        cookieJar.storeCookies(URL.parse("https://example2.com/hello/a"), cookies2)

        let cookies3 = ArrayList<Cookie>()
        for (i in 1..51) {
            cookies3.add(Cookie("${i}", "${i}", maxAge: i))
        }
        cookieJar.storeCookies(URL.parse("https://example3.com/hello/a"), cookies3)
        sleep(Duration.second * 2)
        let cookie4 = Cookie("wow", "wow")
        cookieJar.storeCookies(URL.parse("https://example4.com/hello/a"), ArrayList<Cookie>([cookie4]))
        let cookiesFromJar1 = cookieJar.getCookies(URL.parse("https://example.com/hello/a"))
        let cookiesFromJar2 = cookieJar.getCookies(URL.parse("https://example2.com/hello/a"))
        sleep(Duration.second * 2)
        let cookiesFromJar3 = cookieJar.getCookies(URL.parse("https://example3.com/hello/a"))
        let cookiesFromJar4 = cookieJar.getCookies(URL.parse("https://example4.com/hello/a"))
        println(CookieJar.toCookieString(cookiesFromJar1))
        println(CookieJar.toCookieString(cookiesFromJar2))
        println(CookieJar.toCookieString(cookiesFromJar3))
        println(CookieJar.toCookieString(cookiesFromJar4))
        println("ok")
    }
}

/* SCAN-IN
2850=2850; 2851=2851; 2852=2852; 2853=2853; 2854=2854; 2855=2855; 2856=2856; 2857=2857; 2858=2858; 2859=2859; 2860=2860; 2861=2861; 2862=2862; 2863=2863; 2864=2864; 2865=2865; 2866=2866; 2867=2867; 2868=2868; 2869=2869; 2870=2870; 2871=2871; 2872=2872; 2873=2873; 2874=2874; 2875=2875; 2876=2876; 2877=2877; 2878=2878; 2879=2879; 2880=2880; 2881=2881; 2882=2882; 2883=2883; 2884=2884; 2885=2885; 2886=2886; 2887=2887; 2888=2888; 2889=2889; 2890=2890; 2891=2891; 2892=2892; 2893=2893; 2894=2894; 2895=2895; 2896=2896; 2897=2897; 2898=2898; 2899=2899
3=3; 4=4; 5=5; 6=6; 7=7; 8=8; 9=9; 10=10; 11=11; 12=12; 13=13; 14=14; 15=15; 16=16; 17=17; 18=18; 19=19; 20=20; 21=21; 22=22; 23=23; 24=24; 25=25; 26=26; 27=27; 28=28; 29=29; 30=30; 31=31; 32=32; 33=33; 34=34; 35=35; 36=36; 37=37; 38=38; 39=39; 40=40; 41=41; 42=42; 43=43; 44=44; 45=45; 46=46; 47=47; 48=48; 49=49; 50=50
5=5; 6=6; 7=7; 8=8; 9=9; 10=10; 11=11; 12=12; 13=13; 14=14; 15=15; 16=16; 17=17; 18=18; 19=19; 20=20; 21=21; 22=22; 23=23; 24=24; 25=25; 26=26; 27=27; 28=28; 29=29; 30=30; 31=31; 32=32; 33=33; 34=34; 35=35; 36=36; 37=37; 38=38; 39=39; 40=40; 41=41; 42=42; 43=43; 44=44; 45=45; 46=46; 47=47; 48=48; 49=49; 50=50
wow=wow
ok
 */
