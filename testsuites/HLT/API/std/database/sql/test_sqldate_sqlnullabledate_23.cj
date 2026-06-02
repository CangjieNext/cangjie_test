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
import std.time.*

let date1: DateTime = DateTime.of(year: 2024, month: 1, dayOfMonth: 1)
let date2: DateTime = DateTime.of(year: 2024, month: 12, dayOfMonth: 31)

@Test
class Test_sqldate_sqlnullabledate_23 {
    /*
     * Test description:
     *     test value and name of the class SqlDate
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqldate_value_name_01(): Unit {
        let sqlr = SqlDate(date1)
        @Expect(sqlr.value, date1)
        @Expect(sqlr.name, "SqlDate")
        sqlr.value = date2
        @Expect(sqlr.value, date2)
        @Expect(sqlr.name,"SqlDate")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableDate
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledate_value_name_02(): Unit {
        let sqlnad = SqlNullableDate(date1)
        @Expect(sqlnad.value, date1)
        @Expect(sqlnad.name, "SqlNullableDate")
        sqlnad.value = date2
        @Expect(sqlnad.value, date2)
        @Expect(sqlnad.name,"SqlNullableDate")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableDate
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledate_value_name_03(): Unit {
        let sqlnad = SqlNullableDate(None)
        @Expect(sqlnad.value, None)
        @Expect(sqlnad.name, "SqlNullableDate")
        sqlnad.value = date2
        @Expect(sqlnad.value.getOrThrow(), date2)
        @Expect(sqlnad.name,"SqlNullableDate")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableDate
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledate_value_name_04(): Unit {
        let sqlnad = SqlNullableDate(None)
        @Expect(sqlnad.value, None)
        @Expect(sqlnad.name, "SqlNullableDate")
        sqlnad.value = None
        @Expect(sqlnad.value, None)
        @Expect(sqlnad.name,"SqlNullableDate")
    }
}
