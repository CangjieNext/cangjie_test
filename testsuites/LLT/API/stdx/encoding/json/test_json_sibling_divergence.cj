/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %output %run_utest_opt

/*
 * Reproduce CR-15: sibling-implementation divergence in stdx.encoding.json.
 *
 * The module contains two parsers (String/tree vs stream) and two writers
 * (tree vs stream). Every assertion below states the RFC 8259 compliant
 * behavior shared by the correct sibling:
 *   A. the tree writer must reject NaN/Inf like the stream writer does,
 *      instead of emitting bare `nan` (invalid JSON, not round-trippable);
 *   B. the stream reader must accept the valid exponent form `1e+5`
 *      (the String parser accepts it), including exponent leading zeros
 *      (`1e05`, RFC 8259 exp = [sign] 1*DIGIT);
 *   C/E. the stream reader must reject invalid numbers `01` / `.5` / `5.` /
 *      `-` (the String parser rejects them);
 *   F. the stream reader must reject garbage suffixes `123x` / `1.5d`
 *      after a decimal token (the String parser rejects trailing garbage).
 *
 * Radix prefixes (`0b`/`0o`/`0x`/`0d`) stay accepted: they are Cangjie
 * extensions whose lenient semantics are locked by existing LLT tests.
 *
 * On the buggy library these cases FAIL (reproduction); on a fixed library
 * they PASS (verification).
 */

import std.collection.*
import std.convert.*
import std.io.*
import std.unittest.*
import stdx.encoding.json.*
import stdx.encoding.json.stream.*

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

func makeNaN(): Float64 {
    try {
        let v = 0.0 / 0.0
        if (v.isNaN()) {
            return v
        }
    } catch (_: Exception) {
    }
    return Float64.parse("nan")
}

func makeInf(): Float64 {
    try {
        let v = 1.0 / 0.0
        if (v.isInf()) {
            return v
        }
    } catch (_: Exception) {
    }
    return Float64.parse("inf")
}

func streamReadFloat(input: String): ?Float64 {
    try {
        let r = JsonReader(ArrayInputStream(input.toArray()))
        let v: Float64 = r.readValue<Float64>()
        return Some(v)
    } catch (_: Exception) {
        return None
    }
}

func streamReadInt(input: String): ?Int64 {
    try {
        let r = JsonReader(ArrayInputStream(input.toArray()))
        let v: Int64 = r.readValue<Int64>()
        return Some(v)
    } catch (_: Exception) {
        return None
    }
}

func streamReadUInt(input: String): ?UInt64 {
    try {
        let r = JsonReader(ArrayInputStream(input.toArray()))
        let v: UInt64 = r.readValue<UInt64>()
        return Some(v)
    } catch (_: Exception) {
        return None
    }
}

// Relative-tolerance compare: the stream parser accumulates digits manually,
// so a parsed value may differ from the literal in the last few ulps.
func near(actual: ?Float64, expected: Float64): Bool {
    match (actual) {
        case Some(v) =>
            let diff = v - expected
            let bound = expected * 0.000000001
            if (bound < 0.0) {
                return (diff <= -bound && diff >= bound)
            }
            return (diff <= bound && diff >= -bound)
        case None =>
            return false
    }
}

@Test
class JsonSiblingDivergenceTest {

    // CR-15 A: scalar tree writer must reject NaN (stream writer throws on it).
    @TestCase
    func treeWriterRejectsNanScalar(): Unit {
        var rejected = false
        try {
            let nan = JsonFloat(makeNaN()).toJsonString()
            println("========treeWriterRejectsNanScalar: ${nan}")
        } catch (_: Exception) {
            rejected = true
        }
        @Expect(rejected, true)
    }

    // CR-15 A: container tree writer must reject NaN as well.
    @TestCase
    func treeWriterRejectsNanInContainer(): Unit {
        var rejected = false
        try {
            let jo = JsonObject()
            jo.put("x", JsonFloat(makeNaN()))
            let _ = jo.toJsonString()
        } catch (_: Exception) {
            rejected = true
        }
        @Expect(rejected, true)
    }

    // CR-15 A: scalar and container tree writers must reject Infinity too
    // (the stream writer throws on it; `inf` is not valid JSON).
    @TestCase
    func treeWriterRejectsInfScalar(): Unit {
        var rejected = false
        try {
            let _ = JsonFloat(makeInf()).toJsonString()
        } catch (_: Exception) {
            rejected = true
        }
        @Expect(rejected, true)
    }

    @TestCase
    func treeWriterRejectsInfInContainer(): Unit {
        var rejected = false
        try {
            let ja = JsonArray()
            ja.add(JsonFloat(makeInf()))
            let _ = ja.toJsonString()
        } catch (_: Exception) {
            rejected = true
        }
        @Expect(rejected, true)
    }

    // Control: JsonFloat.toString() and the without-escaping variants share
    // the same guard.
    @TestCase
    func treeWriterRejectsNanAllVariants(): Unit {
        var toStringRejected = false
        var noEscapeRejected = false
        var jsonNoEscapeRejected = false
        let jf = JsonFloat(makeNaN())
        try {
            let _ = jf.toString()
        } catch (_: Exception) {
            toStringRejected = true
        }
        try {
            let _ = jf.toStringWithoutEscaping()
        } catch (_: Exception) {
            noEscapeRejected = true
        }
        try {
            let _ = jf.toJsonStringWithoutEscaping()
        } catch (_: Exception) {
            jsonNoEscapeRejected = true
        }
        @Expect(toStringRejected, true)
        @Expect(noEscapeRejected, true)
        @Expect(jsonNoEscapeRejected, true)
    }

    // Control: finite values keep round-tripping through the tree writer
    // (its own String parser must accept its own output).
    @TestCase
    func treeWriterFiniteRoundTrip(): Unit {
        let jo = JsonObject()
        jo.put("x", JsonFloat(1.5))
        let s = jo.toJsonString()
        var parsed = false
        try {
            let _ = JsonValue.fromStr(s)
            parsed = true
        } catch (_: Exception) {
        }
        @Expect(parsed, true)
    }

    // Control: the String parser accepts `1e+5` (valid RFC 8259 exponent).
    @TestCase
    func stringParserAcceptsEPlus(): Unit {
        var accepted = false
        try {
            let _ = JsonValue.fromStr("1e+5")
            accepted = true
        } catch (e: Exception) {
            println("=========stringParserAcceptsEPlus, e: ${e}")
        }
        @Expect(accepted, true)
    }

    // CR-15 B: the stream reader must accept `1e+5` like its sibling.
    @TestCase
    func streamReaderAcceptsEPlus(): Unit {
        @Expect(streamReadFloat("1e+5"), Some(100000.0))
        @Expect(streamReadFloat("1e5"), Some(100000.0))
        @Expect(near(streamReadFloat("1e-5"), 0.00001), true)
    }

    // CR-15 B + control: exponent leading zeros are valid per RFC 8259
    // (exp = [ sign ] 1*DIGIT); `1e05` was accepted before, `1e+05` was not.
    @TestCase
    func streamReaderAcceptsExponentLeadingZeros(): Unit {
        @Expect(streamReadFloat("1e05"), Some(100000.0))
        @Expect(streamReadFloat("1e+05"), Some(100000.0))
        @Expect(near(streamReadFloat("1e-05"), 0.00001), true)
    }

    // Control: plain fractions and negative fractions keep parsing.
    @TestCase
    func streamReaderAcceptsFractionControls(): Unit {
        @Expect(near(streamReadFloat("0.05"), 0.05), true)
        @Expect(streamReadFloat("-0.5"), Some(-0.5))
        @Expect(streamReadFloat("10.5"), Some(10.5))
    }

    // Control: Cangjie radix extensions keep working on the stream side.
    // `0d` is a stream-reader extension locked by the radix-path LLT tests
    // (`0d33` -> 33), same family as 0b/0o/0x.
    @TestCase
    func streamReaderAcceptsRadixControl(): Unit {
        @Expect(streamReadUInt("0x1F"), Some(31u64))
        @Expect(streamReadUInt("0b101"), Some(5u64))
        @Expect(streamReadUInt("0o17"), Some(15u64))
        @Expect(streamReadUInt("0d123"), Some(123u64))
    }

    // Control: `1e400` overflows to Infinity and must be rejected; `1e-1000`
    // underflows to a finite 0.0 and must stay accepted.
    @TestCase
    func streamReaderExponentOverflowControls(): Unit {
        @Expect(streamReadFloat("1e400"), None)
        @Expect(streamReadFloat("1e-1000"), Some(0.0))
        @Expect(streamReadFloat("1e99999999999999999999"), None)
        // An exponent magnitude of exactly 2^63 must throw OverflowException
        // for both signs: for a positive sign the Int64 conversion of the
        // UInt64 magnitude would wrap to Int64.Min and silently turn the
        // overflow into an underflow to 0.0. Neighbors stay as before:
        // 2^63-1 overflows to Infinity (rejected as non-finite), 2^63+1 and
        // 20-digit magnitudes trip the magnitude/accumulation checks.
        @Expect(streamReadFloat("1e9223372036854775808"), None)
        @Expect(streamReadFloat("1e-9223372036854775808"), None)
        @Expect(streamReadFloat("1e9223372036854775807"), None)
        @Expect(streamReadFloat("1e9223372036854775809"), None)
        @Expect(streamReadFloat("1e-9223372036854775809"), None)
    }

    // CR-15 F: garbage suffixes after a complete DECIMAL number token must be
    // rejected (the String parser rejects trailing garbage too).
    @TestCase
    func streamReaderRejectsGarbageSuffix(): Unit {
        @Expect(streamReadInt("123x"), None)
        @Expect(streamReadFloat("1.5d"), None)
    }

    // Control (legacy): reading an Int64/UInt64 from the integer prefix of a
    // float token keeps returning the prefix value (0.5 -> 0, 1e5 -> 1).
    @TestCase
    func streamReaderLegacyIntegerPrefix(): Unit {
        @Expect(streamReadInt("0.5"), Some(0))
        @Expect(streamReadInt("1e5"), Some(1))
        @Expect(streamReadInt("1 2"), Some(1))
    }

    // CR-15 B: a whole valid document containing `1e+5` must deserialize.
    // (Python json.dumps emits this form for large floats.)
    @TestCase
    func streamReaderAcceptsEPlusInDocument(): Unit {
        var value: ?Float64 = None
        try {
            let r = JsonReader(ArrayInputStream("{\"x\":1e+5}".toArray()))
            let m: HashMap<String, Float64> = r.readValue<HashMap<String, Float64>>()
            value = m.get("x")
        } catch (_: Exception) {
        }
        @Expect(value, Some(100000.0))
    }

    // CR-15 C: `01` is invalid JSON (leading zero); stream reader must reject.
    // (`007` likewise; a single `0` stays valid.)
    @TestCase
    func streamReaderRejectsLeadingZeros(): Unit {
        @Expect(streamReadInt("01"), None)
        @Expect(streamReadInt("007"), None)
        @Expect(streamReadInt("0"), Some(0))
    }

    // CR-15 E: `.5` / `5.` / `-` are invalid JSON numbers; must reject.
    @TestCase
    func streamReaderRejectsMalformedNumbers(): Unit {
        @Expect(streamReadFloat(".5"), None)
        @Expect(streamReadFloat("5."), None)
        @Expect(streamReadFloat("-"), None)
    }
}
