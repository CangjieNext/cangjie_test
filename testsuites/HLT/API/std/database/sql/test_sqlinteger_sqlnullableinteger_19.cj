/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt

import std.database.sql.*

@Test
class Test_sqlinteger_sqlnullableinteger_19 {
    /*
     * Test description:
     *     test value and name of the class SqlInteger
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlinteger_value_name_01(): Unit {
        let sqli = SqlInteger(-2147483648)
        @Expect(sqli.value, -2147483648)
        @Expect(sqli.name, "SqlInteger")
        sqli.value = 0
        @Expect(sqli.value, 0)
        @Expect(sqli.name,"SqlInteger")
    }

    /*
     * Test description:
     *     test value and name of the class SqlInteger
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlinteger_value_name_02(): Unit {
        let sqli = SqlInteger(2147483647)
        @Expect(sqli.value, 2147483647)
        @Expect(sqli.name, "SqlInteger")
        sqli.value = -2147483648
        @Expect(sqli.value, -2147483648)
        @Expect(sqli.name,"SqlInteger")
    }

    /*
     * Test description:
     *     test value and name of the class SqlInteger
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlinteger_value_name_03(): Unit {
        let sqli = SqlInteger(0)
        @Expect(sqli.value, 0)
        @Expect(sqli.name, "SqlInteger")
        sqli.value = 2000000
        @Expect(sqli.value, 2000000)
        @Expect(sqli.name,"SqlInteger")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableInteger
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableinteger_value_name_04(): Unit {
        let sqlnai = SqlNullableInteger(0)
        @Expect(sqlnai.value.getOrThrow(), 0)
        @Expect(sqlnai.name, "SqlNullableInteger")
        sqlnai.value = 2147483647
        @Expect(sqlnai.value.getOrThrow(), 2147483647)
        @Expect(sqlnai.name,"SqlNullableInteger")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableInteger
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableinteger_value_name_05(): Unit {
        let sqlnai = SqlNullableInteger(2147483647)
        @Expect(sqlnai.value.getOrThrow(), 2147483647)
        @Expect(sqlnai.name, "SqlNullableInteger")
        sqlnai.value = -2147483648
        @Expect(sqlnai.value.getOrThrow(), -2147483648)
        @Expect(sqlnai.name,"SqlNullableInteger")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableInteger
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableinteger_value_name_06(): Unit {
        let sqlnai = SqlNullableInteger(-2147483648)
        @Expect(sqlnai.value.getOrThrow(), -2147483648)
        @Expect(sqlnai.name, "SqlNullableInteger")
        sqlnai.value = 0
        @Expect(sqlnai.value.getOrThrow(), 0)
        @Expect(sqlnai.name,"SqlNullableInteger")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableInteger
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableinteger_value_name_07(): Unit {
        let sqlnai = SqlNullableInteger(None)
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name, "SqlNullableInteger")
        sqlnai.value = None
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name,"SqlNullableInteger")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableInteger
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableinteger_value_name_08(): Unit {
        let sqlnai = SqlNullableInteger(None)
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name, "SqlNullableInteger")
        sqlnai.value = 0
        @Expect(sqlnai.value.getOrThrow(), 0)
        @Expect(sqlnai.name,"SqlNullableInteger")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableInteger
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableinteger_value_name_09(): Unit {
        let sqlnai = SqlNullableInteger(-1000)
        @Expect(sqlnai.value.getOrThrow(), -1000)
        @Expect(sqlnai.name, "SqlNullableInteger")
        sqlnai.value = None
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name,"SqlNullableInteger")
    }
}
