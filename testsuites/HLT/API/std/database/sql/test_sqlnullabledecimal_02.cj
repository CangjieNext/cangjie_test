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
import std.io.*
import std.math.*
import std.time.{DateTime}
import std.unittest.*
import std.math.numeric.*

@Test
class Test_sqlnullabledecimal_02 {
    /*
     * Test description:
     *     test value and name of the class sqlnullabledecimal using bigint
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledecimal_value_name_01(): Unit {
        let sdb = SqlNullableDecimal(Decimal(BigInt("1"), 5))
        @Expect(sdb.value, Decimal(BigInt("1"), 5))
        sdb.value = Decimal(BigInt("-1000"), Int32.Max)
        @Expect(sdb.value == Decimal(BigInt("-1000"), Int32.Max))
        @Expect(sdb.name,"SqlNullableDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqlnullabledecimal using bigint
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledecimal_value_name_02(): Unit {
        let dec = Decimal(BigInt("-1000"), Int32.Max)
        let sdb = SqlNullableDecimal(dec)
        @Expect(sdb.value.getOrThrow().compare(dec), Ordering.EQ)
        sdb.value = Decimal(BigInt("100000"), Int32.Min)
        @Expect(sdb.value == Decimal(BigInt("100000"), Int32.Min))
        @Expect(sdb.name,"SqlNullableDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqlnullabledecimal using bigint
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledecimal_value_name_03(): Unit {
        let dec = Decimal(BigInt("100000"), Int32.Min)
        let sdb = SqlNullableDecimal(dec)
        @Expect(sdb.value.getOrThrow().compare(dec), Ordering.EQ)
        sdb.value = Decimal("+10000")
        @Expect(sdb.value == Decimal("+10000"))
        @Expect(sdb.name,"SqlNullableDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqlnullabledecimal using string
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledecimal_value_name_04(): Unit {
        let dec = Decimal("+10000")
        let sdb = SqlNullableDecimal(dec)
        @Expect(sdb.value.getOrThrow().compare(dec), Ordering.EQ)
        sdb.value = Decimal(Int64.Max)
        @Expect(sdb.value == Decimal(Int64.Max))
        @Expect(sdb.name,"SqlNullableDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqlnullabledecimal using int64
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledecimal_value_name_05(): Unit {
        let dec = Decimal(Int64.Max)
        let sdb = SqlNullableDecimal(dec)
        @Expect(sdb.value.getOrThrow().compare(dec), Ordering.EQ)
        sdb.value = Decimal(Int64.Min)
        @Expect(sdb.value == Decimal(Int64.Min))
        @Expect(sdb.name,"SqlNullableDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqlnullabledecimal using int64
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledecimal_value_name_06(): Unit {
        let dec = Decimal(Int64.Min)
        let sdb = SqlNullableDecimal(dec)
        @Expect(sdb.value.getOrThrow().compare(dec), Ordering.EQ)
        sdb.value = Decimal(UInt64.Max)
        @Expect(sdb.value == Decimal(UInt64.Max))
        @Expect(sdb.name,"SqlNullableDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqlnullabledecimal using uint64
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledecimal_value_name_07(): Unit {
        let dec = Decimal(UInt64.Max)
        let sdb = SqlNullableDecimal(dec)
        @Expect(sdb.value.getOrThrow().compare(dec), Ordering.EQ)
        sdb.value = Decimal(UInt64.Min)
        @Expect(sdb.value == Decimal(UInt64.Min))
        @Expect(sdb.name,"SqlNullableDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqlnullabledecimal using uint64
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledecimal_value_name_08(): Unit {
        let dec = Decimal(UInt64.Min)
        let sdb = SqlNullableDecimal(dec)
        @Expect(sdb.value.getOrThrow().compare(dec), Ordering.EQ)
        sdb.value = Decimal(0.123456789f64)
        @Expect(sdb.value == Decimal(0.123456789f64))
        @Expect(sdb.name,"SqlNullableDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqlnullabledecimal using float64
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledecimal_value_name_09(): Unit {
        let dec = Decimal(0.123456789f64)
        let sdb = SqlNullableDecimal(dec)
        @Expect(sdb.value.getOrThrow().compare(dec), Ordering.EQ)
        sdb.value = Decimal(0.0)
        @Expect(sdb.value == Decimal(0.0))
        @Expect(sdb.name,"SqlNullableDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqlnullabledecimal using none
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqlnullabledecimal_value_name_10(): Unit {
        let sdb = SqlNullableDecimal(None)
        @Expect(sdb.value, None)
        sdb.value = Decimal(0.0)
        @Expect(sdb.value == Decimal(0.0))
        @Expect(sdb.name,"SqlNullableDecimal")
    }
}
