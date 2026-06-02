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
class Test_sqlchar_06 {
    /*
     * Test description:
     *     test value and name of the class SqlChar
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlchar_value_name_01(): Unit {
        let sqlchar = SqlChar("")
        @Expect(sqlchar.value, "")
        @Expect(sqlchar.name, "SqlChar")
        sqlchar.value = "cangjietest"
        @Expect(sqlchar.value, "cangjietest")
        @Expect(sqlchar.name,"SqlChar")
    }

    /*
     * Test description:
     *     test value and name of the class SqlChar
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlchar_value_name_02(): Unit {
        let sqlchar = SqlChar("\0")
        @Expect(sqlchar.value, "\0")
        @Expect(sqlchar.name, "SqlChar")
        sqlchar.value = "123456"
        @Expect(sqlchar.value, "123456")
        @Expect(sqlchar.name,"SqlChar")
    }

    /*
     * Test description:
     *     test value and name of the class SqlChar
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlchar_value_name_03(): Unit {
        let sqlchar = SqlChar("#$%^&abc")
        @Expect(sqlchar.value, "#$%^&abc")
        @Expect(sqlchar.name, "SqlChar")
        sqlchar.value = "ABC123abc"
        @Expect(sqlchar.value, "ABC123abc")
        @Expect(sqlchar.name,"SqlChar")
    }

    /*
     * Test description:
     *     test value and name of the class SqlChar
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlchar_value_name_04(): Unit {
        let string = StringBuilder(r'1', 10000).toString()
        let string1 = StringBuilder(r'E', 20000).toString()
        let sqlchar = SqlChar(string)
        @Expect(sqlchar.value, string)
        @Expect(sqlchar.name, "SqlChar")
        sqlchar.value = string1
        @Expect(sqlchar.value, string1)
        @Expect(sqlchar.name,"SqlChar")
    }
}
