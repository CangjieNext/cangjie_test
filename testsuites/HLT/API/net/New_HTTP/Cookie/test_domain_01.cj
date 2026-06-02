/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test legal and illegal domain
 * Test API: prop domain: String
 */

import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*

@Test
class Test_Cookie_Domain_01 {
    // 合法值：总长255， label63
    @TestCase
    func test_domain_01(): Unit {
        var label = String(Array<Rune>(60, repeat: r'a')) + "-09"
        var domain = label + "." + label + "." + label + "." + label
        var cookie = Cookie("name", "value", domain: domain)
        @Expect(cookie.domain, domain)
    }

    // 默认值
    @TestCase
    func test_domain_02(): Unit {
        var cookie = Cookie("name", "value")
        @Expect(cookie.domain, "")
    }

    // 合法值：小于等于0抛异常
    @TestCase
    func test_domain_03(): Unit {
        var label60 = String(Array<Rune>(60, repeat: r'a'))
        var label64 = String(Array<Rune>(60, repeat: r'a')) + "--09"
        // 总长大于255
        try {
            var domain = label60 + "." + label60 + "." + label60 + "." + label60 + ".123456789123"
            var _ = Cookie("name", "value", domain: domain)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
        }
        // label大于63
        try {
            var _ = Cookie("name", "value", domain: label64)
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
        }
        // 含有非法字符
        var strs = ["\r", "\n", "\0", "仓颉", ":", ",", " "]
        for (str in strs) {
            try {
                var _ = Cookie("name", "value", domain: "abc${str}.efg")
                @Expect(1, 2)
            } catch (e: IllegalArgumentException) {
            }
        }
        // 分隔方式非法
        try {
            var _ = Cookie("name", "value", domain: "abc..efg")
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
        }
        try {
            var _ = Cookie("name", "value", domain: "efg.123.")
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
        }
        // label以-开头或结尾
        try {
            var _ = Cookie("name", "value", domain: "abc.-efg")
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
        }
        try {
            var _ = Cookie("name", "value", domain: "abc-.efg")
            @Expect(1, 2)
        } catch (e: IllegalArgumentException) {
        }
    }
}
