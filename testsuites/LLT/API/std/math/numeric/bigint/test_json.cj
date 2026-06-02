/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 

import std.math.numeric.*
import std.math.numeric.*
import stdx.encoding.json.stream.*
import std.io.*

@Test
class BigJsonTest {
    @TestCase
    func toJsonInt(): Unit {
        let int = BigInt("123456789")
        let input = ByteBuffer()
        let jw = JsonWriter(input)
        int.toJson(jw)
        jw.flush()
        @Expect(String.fromUtf8(readToEnd(input)), "123456789")
    }

    @TestCase
    func fromJsonInt(): Unit {
        let int1 = BigInt("123456789")
        let input = ByteBuffer()
        let jw = JsonWriter(input)
        int1.toJson(jw)
        jw.flush()
        let reader = JsonReader(input)
        let int2 = BigInt.fromJson(reader)
        @Expect(int1 == int2)
    }

    @TestCase
    func toJsonDecimal(): Unit {
        let int = Decimal.parse("123456789")
        let input = ByteBuffer()
        let jw = JsonWriter(input)
        int.toJson(jw)
        jw.flush()
        @Expect(String.fromUtf8(readToEnd(input)), "123456789")
    }

    @TestCase
    func fromJsonDecimal(): Unit {
        let int1 = Decimal.parse("123456789")
        let input = ByteBuffer()
        let jw = JsonWriter(input)
        int1.toJson(jw)
        jw.flush()
        let reader = JsonReader(input)
        let int2 = Decimal.fromJson(reader)
        @Expect(int1 == int2)
    }

    @TestCase
    func toJsonDecimal1(): Unit {
        let int = Decimal.parse("-123456789.1515")
        let input = ByteBuffer()
        let jw = JsonWriter(input)
        int.toJson(jw)
        jw.flush()
        @Expect(String.fromUtf8(readToEnd(input)), "-123456789.1515")
    }

    @TestCase
    func fromJsonDecimal1(): Unit {
        let int1 = Decimal.parse("-123456789.1515")
        let input = ByteBuffer()
        let jw = JsonWriter(input)
        int1.toJson(jw)
        jw.flush()
        let reader = JsonReader(input)
        let int2 = Decimal.fromJson(reader)
        @Expect(int1 == int2)
    }
}
