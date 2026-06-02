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
class Test_sqlbool_sqlnullablebool_16 {
    /*
     * Test description:
     *     test value and name of the class SqlBool
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlbool_value_name_01(): Unit {
        let sqlbool = SqlBool(true)
        @Expect(sqlbool.value, true)
        @Expect(sqlbool.name, "SqlBool")
        sqlbool.value = false
        @Expect(sqlbool.value, false)
        @Expect(sqlbool.name,"SqlBool")
    }

    /*
     * Test description:
     *     test value and name of the class SqlBool
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlbool_value_name_02(): Unit {
        let sqlbool = SqlBool(false)
        @Expect(sqlbool.value, false)
        @Expect(sqlbool.name, "SqlBool")
        sqlbool.value = true
        @Expect(sqlbool.value, true)
        @Expect(sqlbool.name,"SqlBool")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBool
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebool_value_name_03(): Unit {
        let sqlnab = SqlNullableBool(false)
        @Expect(sqlnab.value.getOrThrow(), false)
        @Expect(sqlnab.name, "SqlNullableBool")
        sqlnab.value = true
        @Expect(sqlnab.value.getOrThrow(), true)
        @Expect(sqlnab.name,"SqlNullableBool")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBool
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebool_value_name_04(): Unit {
        let sqlnab = SqlNullableBool(false)
        @Expect(sqlnab.value.getOrThrow(), false)
        @Expect(sqlnab.name, "SqlNullableBool")
        sqlnab.value = true
        @Expect(sqlnab.value.getOrThrow(), true)
        @Expect(sqlnab.name,"SqlNullableBool")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBool
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebool_value_name_05(): Unit {
        let sqlnab = SqlNullableBool(None)
        @Expect(sqlnab.value, None)
        @Expect(sqlnab.name, "SqlNullableBool")
        sqlnab.value = false
        @Expect(sqlnab.value.getOrThrow(), false)
        @Expect(sqlnab.name,"SqlNullableBool")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBool
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebool_value_name_06(): Unit {
        let sqlnab = SqlNullableBool(None)
        @Expect(sqlnab.value, None)
        @Expect(sqlnab.name, "SqlNullableBool")
        sqlnab.value = None
        @Expect(sqlnab.value, None)
        @Expect(sqlnab.name,"SqlNullableBool")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBool
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebool_value_name_07(): Unit {
        let sqlnab = SqlNullableBool(true)
        @Expect(sqlnab.value.getOrThrow(), true)
        @Expect(sqlnab.name, "SqlNullableBool")
        sqlnab.value = None
        @Expect(sqlnab.value, None)
        @Expect(sqlnab.name,"SqlNullableBool")
    }
}
