/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args
/*
 * Test description: Test the funcs for sql_exception.cj
 * Test API: public open class SqlException <: Exception {
 *             public init()
 *             public init(message: String)
 *             protected open override func getClassName(): String
 *           }
 */
import std.database.sql.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestSqlException {
    @TestCase
    func SqlExceptionTest(): Unit {
        try {
            throw SqlException("test ex", "00000", 0)
        } catch (e: SqlException) {
            @Expect(e.toString(), "SqlException: test ex, SqlState: 00000, errorCode: 0")
        }
        try {
            throw SqlException()
        } catch (e: SqlException) {
            @Expect(e.toString(), "SqlException: errorCode: 0")
        }
        try {
            throw SqlException("i am joker")
        } catch (e: SqlException) {
            @Expect(e.toString(), "SqlException: i am joker, errorCode: 0")
        }
        var a25 = SqlException()
        @Expect(a25.toString(), "SqlException: errorCode: 0")

        var se = SqlException("warning", "Connecting", 1)
        @Expect(se.sqlState, "Connecting")
        @Expect(se.errorCode, 1)
    }
}
