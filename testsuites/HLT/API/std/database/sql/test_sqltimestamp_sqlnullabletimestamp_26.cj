/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt

import std.database.sql.*
import std.math.*
import std.time.*

let date1: DateTime = DateTime.of(year: 2024, month: 1, dayOfMonth: 1)
let date2: DateTime = DateTime.of(year: 2024, month: 12, dayOfMonth: 31)

@Test
class Test_sqltimestamp_sqlnullabletimestamp_26 {
    /*
     * Test description:
     *     test value and name of the class SqlTimestamp
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqltimestamp_value_name_01(): Unit {
        let sqlt = SqlTimestamp(date1)
        @Expect(sqlt.value, date1)
        @Expect(sqlt.name, "SqlTimestamp")
        sqlt.value = date2
        @Expect(sqlt.value, date2)
        @Expect(sqlt.name,"SqlTimestamp")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableTimestamp
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabletimestamp_value_name_02(): Unit {
        let sqlnat = SqlNullableTimestamp(date1)
        @Expect(sqlnat.value, date1)
        @Expect(sqlnat.name, "SqlNullableTimestamp")
        sqlnat.value = date2
        @Expect(sqlnat.value, date2)
        @Expect(sqlnat.name,"SqlNullableTimestamp")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableTimestamp
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabletimestamp_value_name_03(): Unit {
        let sqlnat = SqlNullableTimestamp(None)
        @Expect(sqlnat.value, None)
        @Expect(sqlnat.name, "SqlNullableTimestamp")
        sqlnat.value = date2
        @Expect(sqlnat.value.getOrThrow(), date2)
        @Expect(sqlnat.name,"SqlNullableTimestamp")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableTimestamp
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabletimestamp_value_name_04(): Unit {
        let sqlnat = SqlNullableTimestamp(None)
        @Expect(sqlnat.value, None)
        @Expect(sqlnat.name, "SqlNullableTimestamp")
        sqlnat.value = None
        @Expect(sqlnat.value, None)
        @Expect(sqlnat.name,"SqlNullableTimestamp")
    }
}
