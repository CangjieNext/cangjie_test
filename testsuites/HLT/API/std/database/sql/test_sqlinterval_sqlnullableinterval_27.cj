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
import std.math.*
import std.time.*

@Test
class Test_sqlinterval_sqlnullableinterval_26 {
    /*
     * Test description:
     *     test value and name of the class SqlInterval
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlinterval_value_name_01(): Unit {
        let sqli = SqlInterval(Duration.Max)
        @Expect(sqli.value, Duration.Max)
        @Expect(sqli.name, "SqlInterval")
        sqli.value = Duration.Zero
        @Expect(sqli.value, Duration.Zero)
        @Expect(sqli.name,"SqlInterval")
    }

    /*
     * Test description:
     *     test value and name of the class SqlInterval
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlinterval_value_name_02(): Unit {
        let sqli = SqlInterval(Duration.Min)
        @Expect(sqli.value, Duration.Min)
        @Expect(sqli.name, "SqlInterval")
        sqli.value = Duration.nanosecond
        @Expect(sqli.value, Duration.nanosecond)
        @Expect(sqli.name,"SqlInterval")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableInterval
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableinterval_value_name_03(): Unit {
        let sqlnai = SqlNullableInterval(Duration.Max)
        @Expect(sqlnai.value, Duration.Max)
        @Expect(sqlnai.name, "SqlNullableInterval")
        sqlnai.value = Duration.Zero
        @Expect(sqlnai.value, Duration.Zero)
        @Expect(sqlnai.name,"SqlNullableInterval")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableInterval
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableinterval_value_name_04(): Unit {
        let sqlnai = SqlNullableInterval(Duration.Min)
        @Expect(sqlnai.value, Duration.Min)
        @Expect(sqlnai.name, "SqlNullableInterval")
        sqlnai.value = Duration.nanosecond
        @Expect(sqlnai.value, Duration.nanosecond)
        @Expect(sqlnai.name,"SqlNullableInterval")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableInterval
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableinterval_value_name_05(): Unit {
        let sqlnai = SqlNullableInterval(None)
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name, "SqlNullableInterval")
        sqlnai.value = None
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name,"SqlNullableInterval")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableInterval
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableinterval_value_name_06(): Unit {
        let sqlnai = SqlNullableInterval(Duration.millisecond)
        @Expect(sqlnai.value.getOrThrow(), Duration.millisecond)
        @Expect(sqlnai.name, "SqlNullableInterval")
        sqlnai.value = None
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name,"SqlNullableInterval")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableInterval
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableinterval_value_name_07(): Unit {
        let sqlnai = SqlNullableInterval(None)
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name, "SqlNullableInterval")
        sqlnai.value = Duration.second
        @Expect(sqlnai.value.getOrThrow(), Duration.second)
        @Expect(sqlnai.name,"SqlNullableInterval")
    }
}
