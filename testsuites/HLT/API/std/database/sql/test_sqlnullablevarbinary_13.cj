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
class Test_sqlnullablevarbinary_11 {
    /*
     * Test description:
     *     test value and name of the class SqlNullableVarBinary
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablevarbinary_value_name_01(): Unit {
        let sqlnab = SqlNullableVarBinary(Array<Byte>())
        @Expect(sqlnab.value.getOrThrow(), Array<Byte>())
        @Expect(sqlnab.name, "SqlNullableVarBinary")
        sqlnab.value = Array<Byte>()
        @Expect(sqlnab.value.getOrThrow(), Array<Byte>())
        @Expect(sqlnab.name,"SqlNullableVarBinary")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableVarBinary
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablevarbinary_value_name_02(): Unit {
        let sqlnab = SqlNullableVarBinary([0u8, 255u8])
        @Expect(sqlnab.value.getOrThrow(), [0u8, 255u8])
        @Expect(sqlnab.name, "SqlNullableVarBinary")
        sqlnab.value = Array<Byte>()
        @Expect(sqlnab.value.getOrThrow(), Array<Byte>())
        @Expect(sqlnab.name,"SqlNullableVarBinary")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableVarBinary
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablevarbinary_value_name_03(): Unit {
        let sqlnab = SqlNullableVarBinary([0u8, 255u8, 255u8, 255u8, 0u8])
        @Expect(sqlnab.value.getOrThrow(), [0u8, 255u8, 255u8, 255u8, 0u8])
        @Expect(sqlnab.name, "SqlNullableVarBinary")
        sqlnab.value = Array<Byte>(200, {i => UInt8(i + 1)})
        @Expect(sqlnab.value.getOrThrow(), Array<Byte>(200, {i => UInt8(i + 1)}))
        @Expect(sqlnab.name,"SqlNullableVarBinary")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableVarBinary
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablevarbinary_value_name_04(): Unit {
        let sqlnab = SqlNullableVarBinary(Array<Byte>(10000, repeat: 0))
        @Expect(sqlnab.value.getOrThrow(), Array<Byte>(10000, repeat: 0))
        @Expect(sqlnab.name, "SqlNullableVarBinary")
        sqlnab.value = Array<Byte>(10000, repeat: 255)
        @Expect(sqlnab.value.getOrThrow(), Array<Byte>(10000, repeat: 255))
        @Expect(sqlnab.name,"SqlNullableVarBinary")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableVarBinary
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablevarbinary_value_name_05(): Unit {
        let sqlnab = SqlNullableVarBinary(None)
        @Expect(sqlnab.value, None)
        @Expect(sqlnab.name, "SqlNullableVarBinary")
        sqlnab.value = None
        @Expect(sqlnab.value, None)
        @Expect(sqlnab.name,"SqlNullableVarBinary")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableVarBinary
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablevarbinary_value_name_06(): Unit {
        let sqlnab = SqlNullableVarBinary(None)
        @Expect(sqlnab.value, None)
        @Expect(sqlnab.name, "SqlNullableVarBinary")
        sqlnab.value = Array<Byte>(1000, repeat: 100)
        @Expect(sqlnab.value.getOrThrow(), Array<Byte>(1000, repeat: 100))
        @Expect(sqlnab.name,"SqlNullableVarBinary")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableVarBinary
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullablevarbinary_value_name_07(): Unit {
        let sqlnab = SqlNullableVarBinary(Array<Byte>(100000, repeat: 11))
        @Expect(sqlnab.value.getOrThrow(), Array<Byte>(100000, repeat: 11))
        @Expect(sqlnab.name, "SqlNullableVarBinary")
        sqlnab.value = None
        @Expect(sqlnab.value, None)
        @Expect(sqlnab.name,"SqlNullableVarBinary")
    }
}
