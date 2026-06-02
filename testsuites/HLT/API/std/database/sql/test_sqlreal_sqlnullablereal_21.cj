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
class Test_sqlreal_sqlnullablereal_21 {
    /*
     * Test description:
     *     test value and name of the class SqlReal
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlreal_value_name_01(): Unit {
        let sqlr = SqlReal(1.111)
        @Expect(sqlr.value, 1.111)
        @Expect(sqlr.name, "SqlReal")
        sqlr.value = 0.0
        @Expect(sqlr.value, 0.0)
        @Expect(sqlr.name,"SqlReal")
    }

    /*
     * Test description:
     *     test value and name of the class SqlReal
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlreal_value_name_02(): Unit {
        let sqlr = SqlReal(-0.1111)
        @Expect(sqlr.value, -0.1111)
        @Expect(sqlr.name, "SqlReal")
        sqlr.value = 12.112322
        @Expect(sqlr.value, 12.112322)
        @Expect(sqlr.name,"SqlReal")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableReal
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablereal_value_name_03(): Unit {
        let sqlnai = SqlNullableReal(0.0)
        @Expect(sqlnai.value.getOrThrow(), 0.0)
        @Expect(sqlnai.name, "SqlNullableReal")
        sqlnai.value = 1.00111
        @Expect(sqlnai.value.getOrThrow(), 1.00111)
        @Expect(sqlnai.name,"SqlNullableReal")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableReal
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablereal_value_name_04(): Unit {
        let sqlnai = SqlNullableReal(-12.0111)
        @Expect(sqlnai.value.getOrThrow(), -12.0111)
        @Expect(sqlnai.name, "SqlNullableReal")
        sqlnai.value = 100.111111
        @Expect(sqlnai.value.getOrThrow(), 100.111111)
        @Expect(sqlnai.name,"SqlNullableReal")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableReal
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablereal_value_name_05(): Unit {
        let sqlnai = SqlNullableReal(None)
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name, "SqlNullableReal")
        sqlnai.value = None
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name,"SqlNullableReal")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableReal
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablereal_value_name_06(): Unit {
        let sqlnai = SqlNullableReal(None)
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name, "SqlNullableReal")
        sqlnai.value = 0.0
        @Expect(sqlnai.value.getOrThrow(), 0.0)
        @Expect(sqlnai.name,"SqlNullableReal")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableReal
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablereal_value_name_07(): Unit {
        let sqlnai = SqlNullableReal(-0.01)
        @Expect(sqlnai.value.getOrThrow(), -0.01)
        @Expect(sqlnai.name, "SqlNullableReal")
        sqlnai.value = None
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name,"SqlNullableReal")
    }
}
