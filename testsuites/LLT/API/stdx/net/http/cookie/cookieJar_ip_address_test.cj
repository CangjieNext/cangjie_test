/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *       Test that IP addresses are handled correctly in cookie domain matching per RFC 6265 5.1.3
 * Test API:
 *       public func storeCookies(url: URL, cookies: ArrayList<Cookie>): Unit
 *       public func getCookies(url: URL): ArrayList<Cookie>
 */
package tests.cookie

import stdx.net.http.*
import stdx.encoding.url.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import asan.*

@Test
class TestCookieJarIPAddressMatching {
    @BeforeAll
    func setup() {
        asanGC()
    }

    @AfterAll
    func cleanup() {
        asanGC()
    }

    @TestCase
    func iPv4AddressExactMatch(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookie = Cookie("test_cookie", "value1")
        let cookies = ArrayList<Cookie>()
        cookies.add(cookie)

        cookieJar.storeCookies(URL.parse("http://127.0.0.1/path"), cookies)

        let retrievedCookies = cookieJar.getCookies(URL.parse("http://127.0.0.1/path"))
        @Assert(retrievedCookies.size, 1)
        @Expect(retrievedCookies[0].cookieName == "test_cookie")
        println("ipv4_exact_match ok")
    }

    @TestCase
    func iPv4AddressNoSuffixMatch(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookie = Cookie("test_cookie", "value1")
        let cookies = ArrayList<Cookie>()
        cookies.add(cookie)

        cookieJar.storeCookies(URL.parse("http://127.0.0.1/path"), cookies)

        let retrievedCookies = cookieJar.getCookies(URL.parse("http://0.0.1/path"))
        @Assert(retrievedCookies.size, 0)
        println("ipv4_no_suffix_match ok")
    }

    @TestCase
    func iPv6AddressExactMatch(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookie = Cookie("test_cookie", "value1")
        let cookies = ArrayList<Cookie>()
        cookies.add(cookie)

        cookieJar.storeCookies(URL.parse("http://[::1]/path"), cookies)

        let retrievedCookies = cookieJar.getCookies(URL.parse("http://[::1]/path"))
        @Assert(retrievedCookies.size, 1)
        @Expect(retrievedCookies[0].cookieName == "test_cookie")
        println("ipv6_exact_match ok")
    }

    @TestCase
    func iPv6AddressNoSuffixMatch(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookie = Cookie("test_cookie", "value1")
        let cookies = ArrayList<Cookie>()
        cookies.add(cookie)

        cookieJar.storeCookies(URL.parse("http://[2001:db8::1]/path"), cookies)

        let retrievedCookies = cookieJar.getCookies(URL.parse("http://[db8::1]/path"))
        @Assert(retrievedCookies.size, 0)
        println("ipv6_no_suffix_match ok")
    }

    @TestCase
    func hostnameSuffixMatch(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookie = Cookie("test_cookie", "value1", domain: "example.com")
        let cookies = ArrayList<Cookie>()
        cookies.add(cookie)

        cookieJar.storeCookies(URL.parse("http://bar.example.com/path"), cookies)

        let retrievedCookies = cookieJar.getCookies(URL.parse("http://example.com/path"))
        @Assert(retrievedCookies.size, 1)
        @Expect(retrievedCookies[0].cookieName == "test_cookie")
        println("hostname_suffix_match ok")
    }

    @TestCase
    func hostnameNoInvalidSuffixMatch(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookie = Cookie("test_cookie", "value1")
        let cookies = ArrayList<Cookie>()
        cookies.add(cookie)

        cookieJar.storeCookies(URL.parse("http://bar.example.com/path"), cookies)

        let retrievedCookies = cookieJar.getCookies(URL.parse("http://le.com/path"))
        @Assert(retrievedCookies.size, 0)
        println("hostname_no_invalid_suffix_match ok")
    }

    @TestCase
    func iPv4AddressWithDomainAttribute(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookie = Cookie("test_cookie", "value1", domain: "0.1")
        let cookies = ArrayList<Cookie>()
        cookies.add(cookie)

        cookieJar.storeCookies(URL.parse("http://127.0.0.1/path"), cookies)

        let retrievedCookies = cookieJar.getCookies(URL.parse("http://127.0.0.1/path"))
        @Assert(retrievedCookies.size, 0)
        println("ipv4_with_domain_attribute_rejected ok")
    }

    @TestCase
    func differentIPv4Addresses(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookie1 = Cookie("cookie1", "value1")
        let cookie2 = Cookie("cookie2", "value2")
        let cookies1 = ArrayList<Cookie>()
        cookies1.add(cookie1)
        let cookies2 = ArrayList<Cookie>()
        cookies2.add(cookie2)

        cookieJar.storeCookies(URL.parse("http://192.168.1.1/path"), cookies1)
        cookieJar.storeCookies(URL.parse("http://192.168.1.2/path"), cookies2)

        let retrievedCookies1 = cookieJar.getCookies(URL.parse("http://192.168.1.1/path"))
        @Assert(retrievedCookies1.size, 1)
        @Expect(retrievedCookies1[0].cookieName == "cookie1")

        let retrievedCookies2 = cookieJar.getCookies(URL.parse("http://192.168.1.2/path"))
        @Assert(retrievedCookies2.size, 1)
        @Expect(retrievedCookies2[0].cookieName == "cookie2")
        println("different_ipv4_addresses ok")
    }

    @TestCase
    func iPv6FullAddressExactMatch(): Unit {
        let cookieJar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookie = Cookie("test_cookie", "value1")
        let cookies = ArrayList<Cookie>()
        cookies.add(cookie)

        cookieJar.storeCookies(URL.parse("http://[2001:0db8:85a3:0000:0000:8a2e:0370:7334]/path"), cookies)

        let retrievedCookies = cookieJar.getCookies(URL.parse("http://[2001:0db8:85a3:0000:0000:8a2e:0370:7334]/path"))
        @Assert(retrievedCookies.size, 1)
        @Expect(retrievedCookies[0].cookieName == "test_cookie")
        println("ipv6_full_address_exact_match ok")
    }
}

/* SCAN-IN
ipv4_exact_match ok
ipv4_no_suffix_match ok
ipv6_exact_match ok
ipv6_no_suffix_match ok
hostname_suffix_match ok
hostname_no_invalid_suffix_match ok
ipv4_with_domain_attribute_rejected ok
different_ipv4_addresses ok
ipv6_full_address_exact_match ok
 */
