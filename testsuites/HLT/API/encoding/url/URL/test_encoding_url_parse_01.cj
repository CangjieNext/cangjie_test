/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 

import stdx.encoding.url.*
import std.collection.*

@Test
public class Test_encoding_url_01 {
    @TestCase
    func case1(): Unit {
        var str = "https://wwww.example%1E%7C%1b.com/zps"
        try {
            var url1 = URL.parse(str)
        } catch(e: UrlSyntaxException) {
            @Expect(e.toString().contains("Invalid hostname: contains control characters"))
        }
    }

    @TestCase
    func case2(): Unit {
        var str = "https://wwww.example%11.com/zps"
        try {
            var url1 = URL.parse(str)
        } catch(e: UrlSyntaxException) {
            @Expect(e.toString().contains("Invalid hostname: contains control characters"))
        }
    }
}
