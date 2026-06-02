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
class Test_sqldecimal_01 {
    /*
     * Test description:
     *     test value and name of the class sqldecimal using bigint
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqldecimal_value_01(): Unit {
        let sdb = SqlDecimal(Decimal(BigInt("1"), 5))
        @Expect(sdb.value, Decimal(BigInt("1"), 5))
        sdb.value = Decimal(BigInt("-1000"), Int32.Max)
        @Expect(sdb.value == Decimal(BigInt("-1000"), Int32.Max))
        @Expect(sdb.name,"SqlDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqldecimal using bigint
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqldecimal_value_02(): Unit {
        let dec = Decimal(BigInt("-1000"), Int32.Max)
        let sdb = SqlDecimal(dec)
        @Expect(sdb.value.compare(dec), Ordering.EQ)
        sdb.value = Decimal(BigInt("100000"), Int32.Min)
        @Expect(sdb.value == Decimal(BigInt("100000"), Int32.Min))
        @Expect(sdb.name,"SqlDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqldecimal using bigint
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqldecimal_value_03(): Unit {
        let dec = Decimal(BigInt("100000"), Int32.Min)
        let sdb = SqlDecimal(dec)
        @Expect(sdb.value.compare(dec), Ordering.EQ)
        sdb.value = Decimal("+10000")
        @Expect(sdb.value == Decimal("+10000"))
        @Expect(sdb.name,"SqlDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqldecimal using string
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqldecimal_value_04(): Unit {
        let dec = Decimal("+10000")
        let sdb = SqlDecimal(dec)
        @Expect(sdb.value.compare(dec), Ordering.EQ)
        sdb.value = Decimal(Int64.Max)
        @Expect(sdb.value == Decimal(Int64.Max))
        @Expect(sdb.name,"SqlDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqldecimal using int64
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqldecimal_value_05(): Unit {
        let dec = Decimal(Int64.Max)
        let sdb = SqlDecimal(dec)
        @Expect(sdb.value.compare(dec), Ordering.EQ)
        sdb.value = Decimal(Int64.Min)
        @Expect(sdb.value == Decimal(Int64.Min))
        @Expect(sdb.name,"SqlDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqldecimal using int64
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqldecimal_value_06(): Unit {
        let dec = Decimal(Int64.Min)
        let sdb = SqlDecimal(dec)
        @Expect(sdb.value.compare(dec), Ordering.EQ)
        sdb.value = Decimal(UInt64.Max)
        @Expect(sdb.value == Decimal(UInt64.Max))
        @Expect(sdb.name,"SqlDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqldecimal using uint64
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqldecimal_value_07(): Unit {
        let dec = Decimal(UInt64.Max)
        let sdb = SqlDecimal(dec)
        @Expect(sdb.value.compare(dec), Ordering.EQ)
        sdb.value = Decimal(UInt64.Min)
        @Expect(sdb.value == Decimal(UInt64.Min))
        @Expect(sdb.name,"SqlDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqldecimal using uint64
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqldecimal_value_08(): Unit {
        let dec = Decimal(UInt64.Min)
        let sdb = SqlDecimal(dec)
        @Expect(sdb.value.compare(dec), Ordering.EQ)
        sdb.value = Decimal(0.123456789f64)
        @Expect(sdb.value == Decimal(0.123456789f64))
        @Expect(sdb.name,"SqlDecimal")
    }

    /*
     * Test description:
     *     test value and name of the class sqldecimal using float64
     * Test API:
     *     public mut prop value: Decimal
     *     public prop name: String
     */
    @TestCase
    func test_sqldecimal_value_09(): Unit {
        let dec = Decimal(0.123456789f64)
        let sdb = SqlDecimal(dec)
        @Expect(sdb.value.compare(dec), Ordering.EQ)
        sdb.value = Decimal(0.0)
        @Expect(sdb.value == Decimal(0.0))
        @Expect(sdb.name,"SqlDecimal")
    }
}
