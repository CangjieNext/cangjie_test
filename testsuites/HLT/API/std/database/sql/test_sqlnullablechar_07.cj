/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt

import std.database.sql.*

@Test
class Test_sqlnullablechar_07 {
    /*
     * Test description:
     *     test value and name of the class SqlNullablechar
     * Test API:
     *     public mut prop value: ?String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablechar_value_name_01(): Unit {
        let sqlnac = SqlNullableChar("")
        @Expect(sqlnac.value.getOrThrow(), "")
        @Expect(sqlnac.name, "SqlNullableChar")
        sqlnac.value = "cangjietest"
        @Expect(sqlnac.value.getOrThrow(), "cangjietest")
        @Expect(sqlnac.name,"SqlNullableChar")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullablechar
     * Test API:
     *     public mut prop value: ?String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablechar_value_name_02(): Unit {
        let sqlnac = SqlNullableChar("\0")
        @Expect(sqlnac.value.getOrThrow(), "\0")
        @Expect(sqlnac.name, "SqlNullableChar")
        sqlnac.value = "12345678"
        @Expect(sqlnac.value.getOrThrow(), "12345678")
        @Expect(sqlnac.name,"SqlNullableChar")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullablechar
     * Test API:
     *     public mut prop value: ?String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablechar_value_name_03(): Unit {
        let sqlnac = SqlNullableChar("#$%^&abc")
        @Expect(sqlnac.value.getOrThrow(), "#$%^&abc")
        @Expect(sqlnac.name, "SqlNullableChar")
        sqlnac.value = None
        @Expect(sqlnac.value, None)
        @Expect(sqlnac.name,"SqlNullableChar")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullablechar
     * Test API:
     *     public mut prop value: ?String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablechar_value_name_04(): Unit {
        let string = StringBuilder(r'1', 10000).toString()
        let string1 = StringBuilder(r'E', 20000).toString()
        let sqlnac = SqlNullableChar(string)
        @Expect(sqlnac.value.getOrThrow(), string)
        @Expect(sqlnac.name, "SqlNullableChar")
        sqlnac.value = string1
        @Expect(sqlnac.value.getOrThrow(), string1)
        @Expect(sqlnac.name,"SqlNullableChar")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullablechar
     * Test API:
     *     public mut prop value: ?String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablechar_value_name_05(): Unit {
        let sqlnac = SqlNullableChar(None)
        @Expect(sqlnac.value, None)
        @Expect(sqlnac.name, "SqlNullableChar")
        sqlnac.value = None
        @Expect(sqlnac.value, None)
        @Expect(sqlnac.name,"SqlNullableChar")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullablechar
     * Test API:
     *     public mut prop value: ?String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablechar_value_name_06(): Unit {
        let sqlnac = SqlNullableChar(None)
        @Expect(sqlnac.value, None)
        @Expect(sqlnac.name, "SqlNullableChar")
        sqlnac.value = "ABC123abc"
        @Expect(sqlnac.value.getOrThrow(),"ABC123abc")
        @Expect(sqlnac.name,"SqlNullableChar")
    }
}
