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
 * Test description: Test negative set function
 * Test API: public func set(name: String, values: ArrayList<String>): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import stdx.net.http.*

@Test
class Test_Set_02 {
    //非法token：含空格--前后中均不允许
    @TestCase
    func test_set_01(): Unit {
        var header = HttpHeaders()
        var value = "1000-continue"
        try {
            header.set("E xcept", value)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.set(" Except", value)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.set("Except ", value)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
    }

    //非法token：含控制字符
    @TestCase
    func test_set_02(): Unit {
        var header = HttpHeaders()
        var value = "1000-continue"
        var value_00 = "1000-con\ntinue"
        try {
            header.set("\r", value)
            @Assert(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.set("\n", value)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.set("abc", value_00)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
    }

    //非法token：含非ASCII码
    @TestCase
    func test_set_03(): Unit {
        var header = HttpHeaders()
        var value = "1000仓颉"
        try {
            header.set("仓颉", value)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        header.set("abc", value)
        @Expect(header.getFirst("abc") ?? "", "1000仓颉")
    }

    //非法token：含特殊字符--：，：等
    @TestCase
    func test_set_04(): Unit {
        var header = HttpHeaders()
        var value = "1000-continue"
        try {
            header.set(":", value)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.set(",", value)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.set(":", value)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        header.set("567", ":")
        header.add("567", ",")
        header.add("567", ";")
        @Expect(header.get("567").size, 3)
    }

    //非法token：为空值
    @TestCase
    func test_set_05(): Unit {
        var header = HttpHeaders()
        var value = "1000-continue"
        try {
            header.set("", value)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
    }

    //非法token：含字符串结束符
    @TestCase
    func test_set_06(): Unit {
        var header = HttpHeaders()
        var value = "1000-continue"
        var value_00 = "1000-con\0tinue"
        try {
            header.set("abc\0d", value)
            @Expect(1, 2)
        } catch (e: HttpException) {
        }
        try {
            header.set("abc", value_00)
            @Expect(1, 2)
        } catch (e: HttpException) {
            println(e.message)
        }
    }
}
