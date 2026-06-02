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
class Test_sqlblob_sqlnullableblob_16 {
    /*
     * Test description:
     *     test value and name of the class SqlBlob
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_sqlblob_value_name_01(): Unit {
        let sqlblob = SqlBlob(ByteBuffer())
        @Expect(sizeOf(sqlblob.value), ByteBuffer().length)
        @Expect(sqlblob.name, "SqlBlob")
        sqlblob.value = ByteBuffer(100)
        @Expect(sizeOf(sqlblob.value), ByteBuffer(100).length)
        @Expect(sqlblob.name,"SqlBlob")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBlob
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_SqlNullableBlob_value_name_02(): Unit {
        let sqlnab = SqlNullableBlob(ByteBuffer())
        @Expect(sizeOf(sqlnab.value.getOrThrow()), ByteBuffer().length)
        @Expect(sqlnab.name, "SqlNullableBlob")
        sqlnab.value = ByteBuffer(100)
        @Expect(sizeOf(sqlnab.value.getOrThrow()), ByteBuffer(100).length)
        @Expect(sqlnab.name,"SqlNullableBlob")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBlob
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_SqlNullableBlob_value_name_03(): Unit {
        let sqlnab = SqlNullableBlob(None)
        if (let Some(_) <- sqlnab.value) {
            @Expect(false)
        }
        @Expect(sqlnab.name, "SqlNullableBlob")
        sqlnab.value = ByteBuffer(100)
        @Expect(sizeOf(sqlnab.value.getOrThrow()), ByteBuffer(100).length)
        @Expect(sqlnab.name,"SqlNullableBlob")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBlob
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_SqlNullableBlob_value_name_04(): Unit {
        let sqlnab = SqlNullableBlob(None)
        if (let Some(_) <- sqlnab.value) {
            @Expect(false)
        }
        @Expect(sqlnab.name, "SqlNullableBlob")
        sqlnab.value = None
        if (let Some(_) <- sqlnab.value) {
            @Expect(false)
        }
        @Expect(sqlnab.name,"SqlNullableBlob")
    }

    /*
     * Test description:
     *     test value and name of the class SqlNullableBlob
     * Test API:
     *     public mut prop value: String
     *     public prop name: String
     */
    @TestCase
    func test_SqlNullableBlob_value_name_05(): Unit {
        let sqlnab = SqlNullableBlob(ByteBuffer(100))
        @Expect(sizeOf(sqlnab.value.getOrThrow()), ByteBuffer(100).length)
        @Expect(sqlnab.name, "SqlNullableBlob")
        sqlnab.value = None
        if (let Some(_) <- sqlnab.value) {
            @Expect(false)
        }
        @Expect(sqlnab.name,"SqlNullableBlob")
    }
}
