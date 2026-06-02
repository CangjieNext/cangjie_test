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
class Test_sqlbyte_sqlnullablebyte_17 {
    /*
     * Test description:
     *     test value and name of the class SqlByte
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlbyte_value_name_01(): Unit {
        let sqlbyte = SqlByte(-128)
        @Expect(sqlbyte.value, -128)
        @Expect(sqlbyte.name, "SqlByte")
        sqlbyte.value = 0
        @Expect(sqlbyte.value, 0)
        @Expect(sqlbyte.name,"SqlByte")
    }

    /*
     * Test description:
     *     test value and name of the class SqlByte
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlbyte_value_name_02(): Unit {
        let sqlbyte = SqlByte(127)
        @Expect(sqlbyte.value, 127)
        @Expect(sqlbyte.name, "SqlByte")
        sqlbyte.value = -127
        @Expect(sqlbyte.value, -127)
        @Expect(sqlbyte.name,"SqlByte")
    }

    /*
     * Test description:
     *     test value and name of the class SqlByte
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlbyte_value_name_03(): Unit {
        let sqlbyte = SqlByte(0)
        @Expect(sqlbyte.value, 0)
        @Expect(sqlbyte.name, "SqlByte")
        sqlbyte.value = 127
        @Expect(sqlbyte.value, 127)
        @Expect(sqlbyte.name,"SqlByte")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableByte
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebyte_value_name_04(): Unit {
        let sqlnab = SqlNullableByte(0)
        @Expect(sqlnab.value.getOrThrow(), 0)
        @Expect(sqlnab.name, "SqlNullableByte")
        sqlnab.value = 127
        @Expect(sqlnab.value.getOrThrow(), 127)
        @Expect(sqlnab.name,"SqlNullableByte")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableByte
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebyte_value_name_05(): Unit {
        let sqlnab = SqlNullableByte(127)
        @Expect(sqlnab.value.getOrThrow(), 127)
        @Expect(sqlnab.name, "SqlNullableByte")
        sqlnab.value = -127
        @Expect(sqlnab.value.getOrThrow(), -127)
        @Expect(sqlnab.name,"SqlNullableByte")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableByte
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebyte_value_name_06(): Unit {
        let sqlnab = SqlNullableByte(-128)
        @Expect(sqlnab.value.getOrThrow(), -128)
        @Expect(sqlnab.name, "SqlNullableByte")
        sqlnab.value = 0
        @Expect(sqlnab.value.getOrThrow(), 0)
        @Expect(sqlnab.name,"SqlNullableByte")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableByte
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebyte_value_name_07(): Unit {
        let sqlnab = SqlNullableByte(None)
        @Expect(sqlnab.value, None)
        @Expect(sqlnab.name, "SqlNullableByte")
        sqlnab.value = None
        @Expect(sqlnab.value, None)
        @Expect(sqlnab.name,"SqlNullableByte")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableByte
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebyte_value_name_08(): Unit {
        let sqlnab = SqlNullableByte(None)
        @Expect(sqlnab.value, None)
        @Expect(sqlnab.name, "SqlNullableByte")
        sqlnab.value = 0
        @Expect(sqlnab.value.getOrThrow(), 0)
        @Expect(sqlnab.name,"SqlNullableByte")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableByte
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablebyte_value_name_09(): Unit {
        let sqlnab = SqlNullableByte(-1)
        @Expect(sqlnab.value.getOrThrow(), -1)
        @Expect(sqlnab.name, "SqlNullableByte")
        sqlnab.value = None
        @Expect(sqlnab.value, None)
        @Expect(sqlnab.name,"SqlNullableByte")
    }
}
