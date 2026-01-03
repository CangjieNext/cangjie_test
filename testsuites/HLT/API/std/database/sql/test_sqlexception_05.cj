/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.database.sql.*

@Test
class Test_SqlException_05 {
    /*
     * Test description:
     *     test sqlState errorCode and message of the class SqlException
     * Test API:
     *     public prop sqlState: String
     *     public prop errorCode: Int64
     *     public override prop message: String
     */
    @TestCase
    func test_sqlexception_01(): Unit {
        let sqlExcep = SqlException()
        @Expect(sqlExcep.sqlState, "")
        @Expect(sqlExcep.errorCode, 0)
        @Expect(sqlExcep.message,"errorCode: 0")
    }

    /*
     * Test description:
     *     test sqlState errorCode and message of the class SqlException
     * Test API:
     *     public prop sqlState: String
     *     public prop errorCode: Int64
     *     public override prop message: String
     */
    @TestCase
    func test_sqlexception_02(): Unit {
        let sqlExcep = SqlException("")
        @Expect(sqlExcep.sqlState, "")
        @Expect(sqlExcep.errorCode, 0)
        @Expect(sqlExcep.message,"errorCode: 0")
    }

    /*
     * Test description:
     *     test sqlState errorCode and message of the class SqlException
     * Test API:
     *     public prop sqlState: String
     *     public prop errorCode: Int64
     *     public override prop message: String
     */
    @TestCase
    func test_sqlexception_03(): Unit {
        let sqlExcep = SqlException("\0")
        @Expect(sqlExcep.sqlState, "")
        @Expect(sqlExcep.errorCode, 0)
        @Expect(sqlExcep.message.contains("errorCode: 0"))
    }

    /*
     * Test description:
     *     test sqlState errorCode and message of the class SqlException
     * Test API:
     *     public prop sqlState: String
     *     public prop errorCode: Int64
     *     public override prop message: String
     */
    @TestCase
    func test_sqlexception_04(): Unit {
        let sqlExcep = SqlException("cangjietest")
        @Expect(sqlExcep.sqlState, "")
        @Expect(sqlExcep.errorCode, 0)
        @Expect(sqlExcep.message,"cangjietest, errorCode: 0")
    }

    /*
     * Test description:
     *     test sqlState errorCode and message of the class SqlException
     * Test API:
     *     public prop sqlState: String
     *     public prop errorCode: Int64
     *     public override prop message: String
     */
    @TestCase
    func test_sqlexception_05(): Unit {
        let string = StringBuilder(r'a', 10000).toString()
        let sqlExcep = SqlException(string)
        @Expect(sqlExcep.sqlState, "")
        @Expect(sqlExcep.errorCode, 0)
        @Expect(sqlExcep.message,"${string}, errorCode: 0")
    }

    /*
     * Test description:
     *     test sqlState errorCode and message of the class SqlException
     * Test API:
     *     public prop sqlState: String
     *     public prop errorCode: Int64
     *     public override prop message: String
     */
    @TestCase
    func test_sqlexception_06(): Unit {
        let string = StringBuilder(r'a', 10000).toString()
        let sqlExcep = SqlException(string)
        @Expect(sqlExcep.sqlState, "")
        @Expect(sqlExcep.errorCode, 0)
        @Expect(sqlExcep.message,"${string}, errorCode: 0")
    }

    /*
     * Test description:
     *     test sqlState errorCode and message of the class SqlException
     * Test API:
     *     public prop sqlState: String
     *     public prop errorCode: Int64
     *     public override prop message: String
     */
    @TestCase
    func test_sqlexception_07(): Unit {
        let sqlExcep = SqlException("", "", -1)
        @Expect(sqlExcep.sqlState, "")
        @Expect(sqlExcep.errorCode, -1)
        @Expect(sqlExcep.message,"errorCode: -1")
    }

    /*
     * Test description:
     *     test sqlState errorCode and message of the class SqlException
     * Test API:
     *     public prop sqlState: String
     *     public prop errorCode: Int64
     *     public override prop message: String
     */
    @TestCase
    func test_sqlexception_08(): Unit {
        let sqlExcep = SqlException("cangjietest", "cangjietest", 0)
        @Expect(sqlExcep.sqlState, "cangjietest")
        @Expect(sqlExcep.errorCode, 0)
        @Expect(sqlExcep.message, "cangjietest, SqlState: cangjietest, errorCode: 0")
    }

    /*
     * Test description:
     *     test sqlState errorCode and message of the class SqlException
     * Test API:
     *     public prop sqlState: String
     *     public prop errorCode: Int64
     *     public override prop message: String
     */
    @TestCase
    func test_sqlexception_09(): Unit {
        let string = StringBuilder(r'a', 10000).toString()
        let sqlExcep = SqlException(string, string, 10000)
        @Expect(sqlExcep.sqlState, "${string}")
        @Expect(sqlExcep.errorCode, 10000)
        @Expect(sqlExcep.message, "${string}, SqlState: ${string}, errorCode: 10000")
    }
}
