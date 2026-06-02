/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args

import std.math.numeric.*
import std.convert.*

@Test
class BigintTest {
    @TestCase
    func testBigint(): Unit {
        var big = BigInt(0.00)
        var big1 = BigInt(Float16.Max)
        var big2 = BigInt(Float16.Min)
        var big3 = BigInt(Float32.Max)
        var big4 = BigInt(Float32.Min)
        var big5 = BigInt(Float64.Max)
        var big6 = BigInt(Float64.Min)
        @Expect(big.toFloat16(),0.000)
        @Expect((big.toFloat16() is Float16),true)
        @Expect(big.toFloat32(),0.000)
        @Expect((big.toFloat32() is Float32),true)
        @Expect(big.toFloat64(),0.000)
        @Expect((big.toFloat64() is Float64),true)
        @Expect(big1.toFloat16(),65504.0)
        @Expect((big1.toFloat16() is Float16),true)
        @Expect(big1.toFloat32(),65504.0)
        @Expect((big1.toFloat32() is Float32),true)
        @Expect(big1.toFloat64(),65504.0)
        @Expect((big1.toFloat64() is Float64),true)
        @Expect(big3.toFloat16().toString(),"inf")
        @Expect((big3.toFloat16() is Float16),true)
        @Expect(big3.toFloat64().toString(),"340282346638528859811704183484516925440.000000")
        @Expect((big3.toFloat64() is Float64),true)
        @Expect(big5.toFloat16().toString(),"inf")
        @Expect((big5.toFloat16() is Float32),false)
        @Expect(big5.toFloat32().toString(),"inf")
        @Expect((big5.toFloat32() is Float32),true)
    }

    @TestCase
    func testBigint1(): Unit {
        var big2 = BigInt(-Float32.Max)
        @Expect(big2.toFloat16().toString(),"-inf")
        @Expect((big2.toFloat16() is Float16),true)
    }

    @TestCase
    func testBigint_format1(): Unit {
        let float = BigInt(1234.12f32)
        let int = BigInt(-20i32)
        @Expect(float.format("+20"),"               +1234")
        @Expect(float.format("20.20"),"00000000000000001234")
        @Expect(float.format("#X"),"0X4D2")
        @Expect(int.format("10.8")," -00000020")
        @Expect(int.format("015"),"-00000000000020")
        try {
            int.format("你好仓颉")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Wrong format string"))
        }
        try {
            int.format("")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Wrong format string"))
        }
    }

    @TestCase
    func testBigint_format2(): Unit {
        var c: Int32 = 20
        let int = BigInt(c)
        @Expect(int.format("b"),"10100")
        try {
            int.format("20G")
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Wrong format string"))
        }
    }

    @TestCase
    func testBigint_parse(): Unit {
        @Expect(BigInt.parse("+0B010101").toString(),"21")
        @Expect(BigInt.parse("-0B010101").toString(),"-21")
        @Expect(BigInt.parse("-0b010101").toString(),"-21")
        @Expect(BigInt.parse("-010101").toString(),"-10101")
        @Expect(BigInt.parse("-0X3b9ac9ff").toString(),"-999999999")
        @Expect(BigInt.parse("+0xf98059").toString(),"16351321")
        @Expect(BigInt.parse("0xf98059").toString(),"16351321")
        @Expect(BigInt.parse("21").toString(),"21")
        @Expect(BigInt.parse("-21").toString(),"-21")
    }

    @TestCase
    func testBigint_parse1(): Unit {
        try {
            BigInt.parse("-9.9e9nihao")
        } catch (e: IllegalArgumentException) {
            println(e.toString())
            @Expect(e.message.contains("Invalid string"))
        }
        try {
            BigInt.parse("")
        } catch (e: IllegalArgumentException) {
            println(e.toString())
            @Expect(e.message.contains("Invalid string"))
        }
        try {
            BigInt.parse("-0B020101")
        } catch (e: IllegalArgumentException) {
            println(e.toString())
            @Expect(e.message.contains("Invalid string"))
        }
    }

    @TestCase
    func testBigint_tryParse(): Unit {
        @Expect(BigInt.tryParse("+0B010101").getOrThrow().toString(),"21")
        @Expect(BigInt.tryParse("-0B010101").getOrThrow().toString(),"-21")
        @Expect(BigInt.tryParse("-0b010101").getOrThrow().toString(),"-21")
        @Expect(BigInt.tryParse("-010101").getOrThrow().toString(),"-10101")
        @Expect(BigInt.tryParse("-0X3b9ac9ff").getOrThrow().toString(),"-999999999")
        @Expect(BigInt.tryParse("+0xf98059").getOrThrow().toString(),"16351321")
        @Expect(BigInt.tryParse("0xf98059").getOrThrow().toString(),"16351321")
        @Expect(BigInt.tryParse("21").getOrThrow().toString(),"21")
        @Expect(BigInt.tryParse("-21").getOrThrow().toString(),"-21")
    }

    @TestCase
    func testBigint_tryParse1(): Unit {
        @Expect(BigInt.tryParse("-9.9e9nihao").isSome(),false)
        @Expect(BigInt.tryParse("").isSome(),false)
        @Expect(BigInt.tryParse("-0B020101").isSome(),false)
    }

    @TestCase
    func testBigint_parse3(): Unit {
        @Expect(BigInt.parse("+010101",radix:2).toString(),"21")
        @Expect(BigInt.parse("-010101",radix:2).toString(),"-21")
        @Expect(BigInt.parse("-010101",radix:2).toString(),"-21")
        @Expect(BigInt.parse("-010101",radix:10).toString(),"-10101")
        @Expect(BigInt.parse("-3b9ac9ff",radix:16).toString(),"-999999999")
        @Expect(BigInt.parse("+f98059",radix:16).toString(),"16351321")
        @Expect(BigInt.parse("f98059",radix:16).toString(),"16351321")
        @Expect(BigInt.parse("21",radix:10).toString(),"21")
        @Expect(BigInt.parse("-21",radix:10).toString(),"-21")
    }

    @TestCase
    func testBigint_parse4(): Unit {
        try {
            BigInt.parse("-9.9e9nihao", radix: 2)
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid string"))
        }
        try {
            BigInt.parse("", radix: 2)
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            println(e.toString())
            @Expect(e.message.contains("Invalid string"))
        }

        try {
            BigInt.parse("f98059", radix: 10)
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid string"))
        }
    }

    @TestCase
    func testBigint_tryParse2(): Unit {
        @Expect(BigInt.tryParse("+010101",radix:2).getOrThrow().toString(),"21")
        @Expect(BigInt.tryParse("-010101",radix:2).getOrThrow().toString(),"-21")
        @Expect(BigInt.tryParse("-010101",radix:2).getOrThrow().toString(),"-21")
        @Expect(BigInt.tryParse("-010101",radix:10).getOrThrow().toString(),"-10101")
        @Expect(BigInt.tryParse("-3b9ac9ff",radix:16).getOrThrow().toString(),"-999999999")
        @Expect(BigInt.tryParse("+f98059",radix:16).getOrThrow().toString(),"16351321")
        @Expect(BigInt.tryParse("f98059",radix:16).getOrThrow().toString(),"16351321")
        @Expect(BigInt.tryParse("21",radix:10).getOrThrow().toString(),"21")
        @Expect(BigInt.tryParse("-21",radix:10).getOrThrow().toString(),"-21")
    }

    @TestCase
    func testBigint_tryParse3(): Unit {
        @Expect(BigInt.tryParse("-9.9e9nihao",radix:2).isSome(),false)
        @Expect(BigInt.tryParse("",radix:2).isSome(),false)
        @Expect(BigInt.tryParse("-0B020101",radix:10).isSome(),false)
    }

    @TestCase
    func testBigint_toString(): Unit {
        @Expect(BigInt.parse("+9999999").toString(radix:2),"100110001001011001111111")
        @Expect(BigInt.parse("+9999999").toString(radix:10),"9999999")
        @Expect(BigInt.parse("+9999999").toString(radix:16),"98967F")
        @Expect(BigInt.parse("+9999999").toString(radix:32),"9H5JV")
        @Expect(BigInt.parse("-0B1000101").toString(radix:2),"-1000101")
        @Expect(BigInt.parse("-0B1000101").toString(radix:8),"-105")
        @Expect(BigInt.parse("-0B1000101").toString(radix:10),"-69")
        @Expect(BigInt.parse("-0B1000101").toString(radix:16),"-45")
        @Expect(BigInt.parse("-0B1000101").toString(radix:32),"-25")
        @Expect(BigInt.parse("1000101").toString(radix:2),"11110100001010100101")
        @Expect(BigInt.parse("1000101").toString(radix:8),"3641245")
        @Expect(BigInt.parse("1000101").toString(radix:10),"1000101")
        @Expect(BigInt.parse("1000101").toString(radix:16),"F42A5")
        @Expect(BigInt.parse("1000101").toString(radix:32),"UGL5")
    }

    @TestCase
    func testBigint_toString1(): Unit {
        try {
            BigInt.parse("-0B1000101").toString(radix: 50)
            @Expect(1,2)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("[2, 36]"))
        }
    }
}
