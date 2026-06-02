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
class Test_SqlVarchar_08 {
    /*
     * Test description:
     *     test value and name of the class SqlVarchar
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlvarchar_value_name_01(): Unit {
        let sqlvarchar = SqlVarchar("")
        @Expect(sqlvarchar.value, "")
        @Expect(sqlvarchar.name, "SqlVarchar")
        sqlvarchar.value = "cangjietest"
        @Expect(sqlvarchar.value, "cangjietest")
        @Expect(sqlvarchar.name,"SqlVarchar")
    }

    /*
     * Test description:
     *     test value and name of the class SqlVarchar
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlvarchar_value_name_02(): Unit {
        let sqlvarchar = SqlVarchar("\0")
        @Expect(sqlvarchar.value, "\0")
        @Expect(sqlvarchar.name, "SqlVarchar")
        sqlvarchar.value = "123456"
        @Expect(sqlvarchar.value, "123456")
        @Expect(sqlvarchar.name,"SqlVarchar")
    }

    /*
     * Test description:
     *     test value and name of the class SqlVarchar
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlvarchar_value_name_03(): Unit {
        let sqlvarchar = SqlVarchar("#$%^&abc")
        @Expect(sqlvarchar.value, "#$%^&abc")
        @Expect(sqlvarchar.name, "SqlVarchar")
        sqlvarchar.value = "ABC123abc"
        @Expect(sqlvarchar.value, "ABC123abc")
        @Expect(sqlvarchar.name,"SqlVarchar")
    }

    /*
     * Test description:
     *     test value and name of the class SqlVarchar
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlvarchar_value_name_04(): Unit {
        let string = StringBuilder(r'1', 10000).toString()
        let string1 = StringBuilder(r'E', 20000).toString()
        let sqlvarchar = SqlVarchar(string)
        @Expect(sqlvarchar.value, string)
        @Expect(sqlvarchar.name, "SqlVarchar")
        sqlvarchar.value = string1
        @Expect(sqlvarchar.value, string1)
        @Expect(sqlvarchar.name,"SqlVarchar")
    }
}
