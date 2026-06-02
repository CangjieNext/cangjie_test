/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt

import std.database.sql.*

@Test
class Test_sqlsmallint_sqlnullablesmallint_18 {
    /*
     * Test description:
     *     test value and name of the class SqlSmallInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlsmallint_value_name_01(): Unit {
        let sqlsi = SqlSmallInt(-32768)
        @Expect(sqlsi.value, -32768)
        @Expect(sqlsi.name, "SqlSmallInt")
        sqlsi.value = 0
        @Expect(sqlsi.value, 0)
        @Expect(sqlsi.name,"SqlSmallInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlSmallInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlsmallint_value_name_02(): Unit {
        let sqlsi = SqlSmallInt(32767)
        @Expect(sqlsi.value, 32767)
        @Expect(sqlsi.name, "SqlSmallInt")
        sqlsi.value = -32767
        @Expect(sqlsi.value, -32767)
        @Expect(sqlsi.name,"SqlSmallInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlSmallInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlsmallint_value_name_03(): Unit {
        let sqlsi = SqlSmallInt(0)
        @Expect(sqlsi.value, 0)
        @Expect(sqlsi.name, "SqlSmallInt")
        sqlsi.value = 32000
        @Expect(sqlsi.value, 32000)
        @Expect(sqlsi.name,"SqlSmallInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableSmallInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablesmallint_value_name_04(): Unit {
        let sqlnasi = SqlNullableSmallInt(0)
        @Expect(sqlnasi.value.getOrThrow(), 0)
        @Expect(sqlnasi.name, "SqlNullableSmallInt")
        sqlnasi.value = 32767
        @Expect(sqlnasi.value.getOrThrow(), 32767)
        @Expect(sqlnasi.name,"SqlNullableSmallInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableSmallInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablesmallint_value_name_05(): Unit {
        let sqlnasi = SqlNullableSmallInt(32767)
        @Expect(sqlnasi.value.getOrThrow(), 32767)
        @Expect(sqlnasi.name, "SqlNullableSmallInt")
        sqlnasi.value = -32767
        @Expect(sqlnasi.value.getOrThrow(), -32767)
        @Expect(sqlnasi.name,"SqlNullableSmallInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableSmallInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablesmallint_value_name_06(): Unit {
        let sqlnasi = SqlNullableSmallInt(-32768)
        @Expect(sqlnasi.value.getOrThrow(), -32768)
        @Expect(sqlnasi.name, "SqlNullableSmallInt")
        sqlnasi.value = 0
        @Expect(sqlnasi.value.getOrThrow(), 0)
        @Expect(sqlnasi.name,"SqlNullableSmallInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableSmallInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablesmallint_value_name_07(): Unit {
        let sqlnasi = SqlNullableSmallInt(None)
        @Expect(sqlnasi.value, None)
        @Expect(sqlnasi.name, "SqlNullableSmallInt")
        sqlnasi.value = None
        @Expect(sqlnasi.value, None)
        @Expect(sqlnasi.name,"SqlNullableSmallInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableSmallInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablesmallint_value_name_08(): Unit {
        let sqlnasi = SqlNullableSmallInt(None)
        @Expect(sqlnasi.value, None)
        @Expect(sqlnasi.name, "SqlNullableSmallInt")
        sqlnasi.value = 0
        @Expect(sqlnasi.value.getOrThrow(), 0)
        @Expect(sqlnasi.name,"SqlNullableSmallInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableSmallInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablesmallint_value_name_09(): Unit {
        let sqlnasi = SqlNullableSmallInt(-1000)
        @Expect(sqlnasi.value.getOrThrow(), -1000)
        @Expect(sqlnasi.name, "SqlNullableSmallInt")
        sqlnasi.value = None
        @Expect(sqlnasi.value, None)
        @Expect(sqlnasi.name,"SqlNullableSmallInt")
    }
}
