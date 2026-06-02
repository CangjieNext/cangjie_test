/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run_stdx %output %run_utest_opt %run_args | compare %f
// ASSERT: scan name: 123, value: [123, 456, 789]

/*
 * Test description: Test the iterator function
 * Test API: public func iterator(): Iterator<(String, ArrayList<String>)>
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import stdx.net.http.*

@Test
class Test_Iterator_01 {
    @TestCase
    func test_iterator(): Unit {
        var header = HttpHeaders()
        header.set("123", "123")
        header.add("123", "456")
        header.add("123", "789")
        var it = header.iterator()
        while (let Some(i) <- it.next()) {
            var (k, vs) = i
            let arr = ArrayList<String>()
            for (v in vs) {
                arr.add(v)
            }
            println("name: ${k}, value: ${arr}")
        }
    }
}
