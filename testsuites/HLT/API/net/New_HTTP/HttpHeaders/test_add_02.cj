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
 * Test description: Test negative add function
 * Test API: public func add(name: String, value: String): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import stdx.net.http.*

@Test
class Test_Add_01 {
    //非法token：含空格--前后中均不允许
    @TestCase
    func test_add_01(): Unit {
        var header = HttpHeaders()
        try {
            header.add("E xcept", "100-continue")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.add(" Except", "100-continue")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.add("Except ", "100-continue")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
    }

    //非法token：含控制字符
    @TestCase
    func test_add_02(): Unit {
        var header = HttpHeaders()
        try {
            header.add("\r", "Chunked")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.add("\n", "Chunked")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.add("abc", "Chunk\red")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.add("abc", "Chunk\ned")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
    }

    //非法token：含非ASCII码
    @TestCase
    func test_add_03(): Unit {
        var header = HttpHeaders()
        try {
            header.add("仓颉", "Chunked")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        header.add("abc", "仓颉")
        @Expect(header.getFirst("abc") ?? "", "仓颉")
    }

    //非法token：含特殊字符--：，：等
    @TestCase
    func test_add_04(): Unit {
        var header = HttpHeaders()
        try {
            header.add(":", "Chunked")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.add(",", "Chunked")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.add(":", "Chunked")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        header.add("567", ":")
        header.add("567", ",")
        header.add("567", ";")
        @Expect(header.get("567").size, 3)
    }

    //非法token：为空值
    @TestCase
    func test_add_05(): Unit {
        var header = HttpHeaders()
        try {
            header.add("", "Chunked")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
    }

    //非法token：含字符串结束符
    @TestCase
    func test_add_06(): Unit {
        var header = HttpHeaders()
        try {
            header.add("abc\0d", "Chunked")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.add("abcd", "Chunked\0")
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
    }
}
