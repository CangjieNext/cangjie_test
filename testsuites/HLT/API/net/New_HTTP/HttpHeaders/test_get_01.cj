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
 * Test description: Test the get function
 * Test API: public func get(name: String): ?ArrayList<String>
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import stdx.net.http.*

@Test
class Test_Get_01 {
    // name 不存在时get: 返回None
    @TestCase
    func test_get_01(): Unit {
        var header = HttpHeaders()
        header.set("123", "123")
        @Expect(header.get("1233").size, 0)
        @Expect(header.get("12").size, 0)
    }

    // name 存在时get: 返回?ArrayList<String>
    @TestCase
    func test_get_02(): Unit {
        var header = HttpHeaders()
        header.add("a", "111")
        header.add("a", "111")
        header.add("a", "000")
        @Expect(collectionToArrayList(header.get("a")), ArrayList<String>.of("111", "111", "000"))
    }

    // name 为非法token: 返回None
    @TestCase
    func test_get_03(): Unit {
        var header = HttpHeaders()
        header.add("a", "111")
        var names = [" ", "abc\r", "仓颉", ":", ",", ";", "abc\0", ""]
        for (name in names) {
            @Expect(header.get(name).size, 0)
        }
    }
}

func collectionToArrayList(collection: Collection<String>): ArrayList<String> {
    let arr = ArrayList<String>()
    for (str in collection) {
        arr.add(str)
    }
    return arr
}
