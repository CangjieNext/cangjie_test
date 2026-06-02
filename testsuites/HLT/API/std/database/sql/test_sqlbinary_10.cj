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
class Test_sqlbinary_10 {
    /*
     * Test description:
     *     test value and name of the class SqlBinary
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlbinary_value_name_01(): Unit {
        let sqlbinary = SqlBinary(Array<Byte>())
        @Expect(sqlbinary.value, Array<Byte>())
        @Expect(sqlbinary.name, "SqlBinary")
        sqlbinary.value = Array<Byte>()
        @Expect(sqlbinary.value, Array<Byte>())
        @Expect(sqlbinary.name,"SqlBinary")
    }

    /*
     * Test description:
     *     test value and name of the class SqlBinary
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlbinary_value_name_02(): Unit {
        let sqlbinary = SqlBinary([0u8, 255u8])
        @Expect(sqlbinary.value, [0u8, 255u8])
        @Expect(sqlbinary.name, "SqlBinary")
        sqlbinary.value = Array<Byte>()
        @Expect(sqlbinary.value, Array<Byte>())
        @Expect(sqlbinary.name,"SqlBinary")
    }

    /*
     * Test description:
     *     test value and name of the class SqlBinary
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlbinary_value_name_03(): Unit {
        let sqlbinary = SqlBinary([0u8, 255u8, 255u8, 255u8, 0u8])
        @Expect(sqlbinary.value, [0u8, 255u8, 255u8, 255u8, 0u8])
        @Expect(sqlbinary.name, "SqlBinary")
        sqlbinary.value = Array<Byte>(200, {i => UInt8(i + 1)})
        @Expect(sqlbinary.value, Array<Byte>(200, {i => UInt8(i + 1)}))
        @Expect(sqlbinary.name,"SqlBinary")
    }

    /*
     * Test description:
     *     test value and name of the class SqlBinary
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlbinary_value_name_04(): Unit {
        let sqlbinary = SqlBinary(Array<Byte>(10000, repeat: 0))
        @Expect(sqlbinary.value, Array<Byte>(10000, repeat: 0))
        @Expect(sqlbinary.name, "SqlBinary")
        sqlbinary.value = Array<Byte>(10000, repeat: 255)
        @Expect(sqlbinary.value, Array<Byte>(10000, repeat: 255))
        @Expect(sqlbinary.name,"SqlBinary")
    }
}
