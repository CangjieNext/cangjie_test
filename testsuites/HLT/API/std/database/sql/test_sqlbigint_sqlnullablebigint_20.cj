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
class Test_sqlbigint_sqlnullablebigint_20 {
    /*
     * Test description:
     *     test value and name of the class SqlBigInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlbigint_value_name_01(): Unit {
        let sqlb = SqlBigInt(Int64.Min)
        @Expect(sqlb.value, Int64.Min)
        @Expect(sqlb.name, "SqlBigInt")
        sqlb.value = 0
        @Expect(sqlb.value, 0)
        @Expect(sqlb.name,"SqlBigInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlBigInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_SqlBigInt_value_name_02(): Unit {
        let sqlb = SqlBigInt(Int64.Max)
        @Expect(sqlb.value, Int64.Max)
        @Expect(sqlb.name, "SqlBigInt")
        sqlb.value = Int64.Min
        @Expect(sqlb.value, Int64.Min)
        @Expect(sqlb.name,"SqlBigInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlBigInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_SqlBigInt_value_name_03(): Unit {
        let sqlb = SqlBigInt(0)
        @Expect(sqlb.value, 0)
        @Expect(sqlb.name, "SqlBigInt")
        sqlb.value = 2000000
        @Expect(sqlb.value, 2000000)
        @Expect(sqlb.name,"SqlBigInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBigInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebigint_value_name_04(): Unit {
        let sqlnai = SqlNullableBigInt(0)
        @Expect(sqlnai.value.getOrThrow(), 0)
        @Expect(sqlnai.name, "SqlNullableBigInt")
        sqlnai.value = Int64.Max
        @Expect(sqlnai.value.getOrThrow(), Int64.Max)
        @Expect(sqlnai.name,"SqlNullableBigInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBigInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebigint_value_name_05(): Unit {
        let sqlnai = SqlNullableBigInt(Int64.Max)
        @Expect(sqlnai.value.getOrThrow(), Int64.Max)
        @Expect(sqlnai.name, "SqlNullableBigInt")
        sqlnai.value = Int64.Min
        @Expect(sqlnai.value.getOrThrow(), Int64.Min)
        @Expect(sqlnai.name,"SqlNullableBigInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBigInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebigint_value_name_06(): Unit {
        let sqlnai = SqlNullableBigInt(Int64.Min)
        @Expect(sqlnai.value.getOrThrow(), Int64.Min)
        @Expect(sqlnai.name, "SqlNullableBigInt")
        sqlnai.value = 0
        @Expect(sqlnai.value.getOrThrow(), 0)
        @Expect(sqlnai.name,"SqlNullableBigInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBigInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebigint_value_name_07(): Unit {
        let sqlnai = SqlNullableBigInt(None)
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name, "SqlNullableBigInt")
        sqlnai.value = None
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name,"SqlNullableBigInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBigInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebigint_value_name_08(): Unit {
        let sqlnai = SqlNullableBigInt(None)
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name, "SqlNullableBigInt")
        sqlnai.value = 0
        @Expect(sqlnai.value.getOrThrow(), 0)
        @Expect(sqlnai.name,"SqlNullableBigInt")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBigInt
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebigint_value_name_09(): Unit {
        let sqlnai = SqlNullableBigInt(-1000)
        @Expect(sqlnai.value.getOrThrow(), -1000)
        @Expect(sqlnai.name, "SqlNullableBigInt")
        sqlnai.value = None
        @Expect(sqlnai.value, None)
        @Expect(sqlnai.name,"SqlNullableBigInt")
    }
}
