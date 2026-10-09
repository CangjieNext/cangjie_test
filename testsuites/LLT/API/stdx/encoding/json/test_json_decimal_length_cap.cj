/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_utest_opt %run_args

/*
 * Decimal.fromJson (stdx.encoding.json.stream) must cap the number token
 * length like its sibling BigInt.fromJson: Decimal.parse converts the
 * coefficient with quadratic schoolbook base conversion, so an unbounded
 * token burns CPU super-linearly on untrusted input. The shared cap is
 * 16384 chars: at-cap parses, over-cap is rejected instantly.
 */

import std.io.*
import std.math.numeric.*
import std.unittest.*
import stdx.encoding.json.stream.*

const MAX_JSON_BIG_NUMBER_LENGTH: Int64 = 16384

class ArrayInputStream <: InputStream {
    let data: Array<Byte>
    var offset: Int64 = 0

    init(data: Array<Byte>) {
        this.data = data
    }

    public func read(buffer: Array<Byte>): Int64 {
        var size: Int64 = 0
        while (offset < data.size && size < buffer.size) {
            buffer[size] = data[offset]
            offset++
            size++
        }
        return size
    }
}

// {"d": <n nines>} — same body shape as the capped BigInt path.
func digitsDoc(n: Int64): String {
    let sb = StringBuilder()
    sb.append("{\"d\": ")
    for (_ in 0..n) {
        sb.append("9")
    }
    sb.append("}")
    return sb.toString()
}

func decimalRejectedAt(n: Int64): Bool {
    try {
        let r = JsonReader(ArrayInputStream(digitsDoc(n).toArray()))
        r.startObject()
        let _ = r.readName()
        let _ = r.readValue<Decimal>()
        r.endObject()
        return false
    } catch (_: Exception) {
        return true
    }
}

func bigIntRejectedAt(n: Int64): Bool {
    try {
        let r = JsonReader(ArrayInputStream(digitsDoc(n).toArray()))
        r.startObject()
        let _ = r.readName()
        let _ = r.readValue<BigInt>()
        r.endObject()
        return false
    } catch (_: Exception) {
        return true
    }
}

func readDecimal(input: String): ?Decimal {
    try {
        let r = JsonReader(ArrayInputStream(input.toArray()))
        return Some(r.readValue<Decimal>())
    } catch (_: Exception) {
        return None
    }
}

@Test
public class JsonDecimalLengthCapTest {

    // Decimal shares the BigInt cap: the at-cap token parses (scale 0).
    @TestCase
    func decimalParsesAtCapLength(): Unit {
        let r = JsonReader(ArrayInputStream(digitsDoc(MAX_JSON_BIG_NUMBER_LENGTH).toArray()))
        r.startObject()
        let _ = r.readName()
        let d: Decimal = r.readValue<Decimal>()
        r.endObject()
        @Expect(d.scale, 0)
    }

    // Over-cap tokens are rejected instantly, before the quadratic parse.
    @TestCase
    func decimalRejectsOverCapLength(): Unit {
        @Expect(decimalRejectedAt(MAX_JSON_BIG_NUMBER_LENGTH + 1), true)
        @Expect(decimalRejectedAt(MAX_JSON_BIG_NUMBER_LENGTH * 4), true)
    }

    // Sibling BigInt path keeps its documented cap (regression control).
    @TestCase
    func bigIntKeepsCapLength(): Unit {
        @Expect(bigIntRejectedAt(MAX_JSON_BIG_NUMBER_LENGTH + 1), true)
        @Expect(bigIntRejectedAt(MAX_JSON_BIG_NUMBER_LENGTH), false)
    }

    // Ordinary values keep parsing with unchanged values.
    @TestCase
    func decimalOrdinaryValuesControl(): Unit {
        @Expect(readDecimal("1.5"), Some(Decimal.parse("1.5")))
        @Expect(readDecimal("-2.25"), Some(Decimal.parse("-2.25")))
        @Expect(readDecimal("123"), Some(Decimal.parse("123")))
        @Expect(readDecimal("0.001"), Some(Decimal.parse("0.001")))
    }
}
