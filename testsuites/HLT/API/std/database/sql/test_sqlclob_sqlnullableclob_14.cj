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
import std.io.*

func sizeOf(inputStream: InputStream): ?Int64 {
    match (inputStream) {
        case s: Seekable =>
            if (s.remainLength >= 0) {
                return s.remainLength
            }
            return None
        case _ => return None
    }
}

@Test
class Test_sqlclob_sqlnullableclob_16 {
    /*
     * Test description:
     *     test value and name of the class SqlClob
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlclob_value_name_01(): Unit {
        let sqlclob = SqlClob(ByteBuffer())
        @Expect(sizeOf(sqlclob.value), ByteBuffer().length)
        @Expect(sqlclob.name, "SqlClob")
        sqlclob.value = ByteBuffer(100)
        @Expect(sizeOf(sqlclob.value), ByteBuffer(100).length)
        @Expect(sqlclob.name,"SqlClob")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableClob
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableclob_value_name_02(): Unit {
        let sqlnac = SqlNullableClob(ByteBuffer())
        @Expect(sizeOf(sqlnac.value.getOrThrow()), ByteBuffer().length)
        @Expect(sqlnac.name, "SqlNullableClob")
        sqlnac.value = ByteBuffer(100)
        @Expect(sizeOf(sqlnac.value.getOrThrow()), ByteBuffer(100).length)
        @Expect(sqlnac.name,"SqlNullableClob")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableClob
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableclob_value_name_03(): Unit {
        let sqlnac = SqlNullableClob(None)
        if (let Some(_) <- sqlnac.value) {
            @Expect(false)
        }
        @Expect(sqlnac.name, "SqlNullableClob")
        sqlnac.value = ByteBuffer(100)
        @Expect(sizeOf(sqlnac.value.getOrThrow()), ByteBuffer(100).length)
        @Expect(sqlnac.name,"SqlNullableClob")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableClob
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableclob_value_name_04(): Unit {
        let sqlnac = SqlNullableClob(None)
        if (let Some(_) <- sqlnac.value) {
            @Expect(false)
        }
        @Expect(sqlnac.name, "SqlNullableClob")
        sqlnac.value = None
        if (let Some(_) <- sqlnac.value) {
            @Expect(false)
        }
        @Expect(sqlnac.name,"SqlNullableClob")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableClob
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullableclob_value_name_05(): Unit {
        let sqlnac = SqlNullableClob(ByteBuffer(100))
        @Expect(sizeOf(sqlnac.value.getOrThrow()), ByteBuffer(100).length)
        @Expect(sqlnac.name, "SqlNullableClob")
        sqlnac.value = None
        if (let Some(_) <- sqlnac.value) {
            @Expect(false)
        }
        @Expect(sqlnac.name,"SqlNullableClob")
    }
}
