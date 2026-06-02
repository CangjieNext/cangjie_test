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
import std.math.*

@Test
class Test_sqldouble_sqlnullabledouble_22 {
    /*
     * Test description:
     *     test value and name of the class SqlDouble
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqldouble_value_name_01(): Unit {
        let sqlr = SqlDouble(1.111)
        @Expect(sqlr.value, 1.111)
        @Expect(sqlr.name, "SqlDouble")
        sqlr.value = 0.0
        @Expect(sqlr.value, 0.0)
        @Expect(sqlr.name,"SqlDouble")
    }

    /*
     * Test description:
     *     test value and name of the class SqlDouble
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqldouble_value_name_02(): Unit {
        let sqlr = SqlDouble(-0.1111)
        @Expect(sqlr.value, -0.1111)
        @Expect(sqlr.name, "SqlDouble")
        sqlr.value = 12.112322
        @Expect(sqlr.value, 12.112322)
        @Expect(sqlr.name,"SqlDouble")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableDouble
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledouble_value_name_03(): Unit {
        let sqlnai = SqlNullableDouble(0.0)
        @Expect(sqlnai.value.getOrThrow(), 0.0)
        @Expect(sqlnai.name, "SqlNullableDouble")
        sqlnai.value = 1.00111
        @Expect(sqlnai.value.getOrThrow(), 1.00111)
        @Expect(sqlnai.name,"SqlNullableDouble")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableDouble
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledouble_value_name_04(): Unit {
        let sqlnai = SqlNullableDouble(-12.0111)
        @Expect(sqlnai.value.getOrThrow(), -12.0111)
        @Expect(sqlnai.name, "SqlNullableDouble")
        sqlnai.value = 100.111111
        @Expect(sqlnai.value.getOrThrow(), 100.111111)
        @Expect(sqlnai.name,"SqlNullableDouble")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableDouble
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledouble_value_name_05(): Unit {
        let sqlnai = SqlNullableDouble(None)
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name, "SqlNullableDouble")
        sqlnai.value = None
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name,"SqlNullableDouble")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableDouble
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledouble_value_name_06(): Unit {
        let sqlnai = SqlNullableDouble(None)
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name, "SqlNullableDouble")
        sqlnai.value = 0.0
        @Expect(sqlnai.value.getOrThrow(), 0.0)
        @Expect(sqlnai.name,"SqlNullableDouble")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableDouble
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledouble_value_name_07(): Unit {
        let sqlnai = SqlNullableDouble(-0.01)
        @Expect(sqlnai.value.getOrThrow(), -0.01)
        @Expect(sqlnai.name, "SqlNullableDouble")
        sqlnai.value = None
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name,"SqlNullableDouble")
    }
}
