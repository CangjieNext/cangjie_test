/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test the del function
 * Test API: public func del(name: String): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import stdx.net.http.*

@Test
class Test_Del_01 {
    // name 不存在时del， 未删除
    @TestCase
    func test_del_01(): Unit {
        var header = HttpHeaders()
        header.set("123", "123")
        header.del("1233")
        header.del("12")
        @Expect(header.getFirst("123"), Some("123"))
        @Expect(header.get("123").size, 1)
    }

    // name 存在时del, 删除全部键值对
    @TestCase
    func test_del_02(): Unit {
        var header = HttpHeaders()
        header.add("a", "111")
        header.add("a", "111")
        header.add("a", "000")
        header.del("a")
        @Expect(header.getFirst("a"), None)
    }

    // name 为非法token, 无影响
    @TestCase
    func test_del_03(): Unit {
        var header = HttpHeaders()
        header.add("a", "111")
        var names = [" ", "abc\r", "仓颉", ":", ",", ";", "abc\0", ""]
        for (name in names) {
            header.del(name)
        }
        @Expect(header.get("a").size, 1)
        @Expect(header.getFirst("a"), Some("111"))
    }
}
