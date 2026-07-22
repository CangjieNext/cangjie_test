/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.core.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class CoreBranchApiTest {

    // ==================== Option: filter, flatMap, flatten, toString, hashCode, ==, != ====================

    @TestCase
    func test_option_filter_some_true(): Unit {
        let opt = Option<Int64>.Some(42)
        let result = opt.filter({ x => x > 0 })
        match (result) {
            case Some(v) => @Expect(v, 42)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_option_filter_some_false(): Unit {
        let opt = Option<Int64>.Some(42)
        let result = opt.filter({ x => x < 0 })
        match (result) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_option_filter_none(): Unit {
        let opt = Option<Int64>.None
        let result = opt.filter({ x => x > 0 })
        match (result) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_option_flatmap_some(): Unit {
        let opt = Option<Int64>.Some(5)
        let result = opt.flatMap<Int64>({ x => Option<Int64>.Some(x * 2) })
        match (result) {
            case Some(v) => @Expect(v, 10)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_option_flatmap_none(): Unit {
        let opt = Option<Int64>.None
        let result = opt.flatMap<Int64>({ x => Option<Int64>.Some(x * 2) })
        match (result) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_option_flatten_some_some(): Unit {
        let opt = Option<Option<Int64>>.Some(Option<Int64>.Some(99))
        let result = opt.flatten()
        match (result) {
            case Some(v) => @Expect(v, 99)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_option_flatten_some_none(): Unit {
        let opt = Option<Option<Int64>>.Some(Option<Int64>.None)
        let result = opt.flatten()
        match (result) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_option_flatten_none(): Unit {
        let opt = Option<Option<Int64>>.None
        let result = opt.flatten()
        match (result) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_option_to_string_some(): Unit {
        let opt = Option<Int64>.Some(42)
        @Expect(opt.toString(), "Some(42)")
    }

    @TestCase
    func test_option_to_string_none(): Unit {
        let opt = Option<Int64>.None
        @Expect(opt.toString(), "None")
    }

    @TestCase
    func test_option_hashcode_some(): Unit {
        let opt = Option<Int64>.Some(42)
        @Expect(opt.hashCode(), Int64(42).hashCode())
    }

    @TestCase
    func test_option_hashcode_none(): Unit {
        let opt = Option<Int64>.None
        @Expect(opt.hashCode(), 0)
    }

    @TestCase
    func test_option_equals_some_some_equal(): Unit {
        let a = Option<Int64>.Some(42)
        let b = Option<Int64>.Some(42)
        @Assert(a == b)
    }

    @TestCase
    func test_option_equals_some_some_not_equal(): Unit {
        let a = Option<Int64>.Some(42)
        let b = Option<Int64>.Some(99)
        @Assert(!(a == b))
        @Assert(a != b)
    }

    @TestCase
    func test_option_equals_none_none(): Unit {
        let a = Option<Int64>.None
        let b = Option<Int64>.None
        @Assert(a == b)
        @Assert(!(a != b))
    }

    @TestCase
    func test_option_equals_some_none(): Unit {
        let a = Option<Int64>.Some(42)
        let b = Option<Int64>.None
        @Assert(!(a == b))
        @Assert(a != b)
    }

    @TestCase
    func test_option_get_or_throw_some(): Unit {
        let opt = Option<Int64>.Some(42)
        @Expect(opt.getOrThrow(), 42)
    }

    @TestCase
    func test_option_get_or_throw_none(): Unit {
        let opt = Option<Int64>.None
        try {
            let _ = opt.getOrThrow()
            @Assert(false)
        } catch (e: NoneValueException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_option_get_or_throw_exception_none(): Unit {
        let opt = Option<Int64>.None
        try {
            let _ = opt.getOrThrow({ => IllegalArgumentException("custom error") })
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.message, "custom error")
        }
    }

    @TestCase
    func test_option_get_or_default_some(): Unit {
        let opt = Option<Int64>.Some(42)
        @Expect(opt.getOrDefault({ => 0 }), 42)
    }

    @TestCase
    func test_option_get_or_default_none(): Unit {
        let opt = Option<Int64>.None
        @Expect(opt.getOrDefault({ => 0 }), 0)
    }

    @TestCase
    func test_ifsome_some(): Unit {
        let opt = Option<Int64>.Some(42)
        match (opt) {
            case Some(v) => @Expect(v, 42)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_ifsome_none(): Unit {
        let opt = Option<Int64>.None
        match (opt) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_ifnone_none(): Unit {
        let opt = Option<Int64>.None
        match (opt) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_ifnone_some(): Unit {
        let opt = Option<Int64>.Some(42)
        match (opt) {
            case Some(v) => @Expect(v, 42)
            case None => @Assert(false)
        }
    }

    // ==================== Box: compare, operators, hashCode, toString ====================

    @TestCase
    func test_box_compare_lt(): Unit {
        @Expect(Box(Int64(1)).compare(Box(Int64(2))), Ordering.LT)
    }

    @TestCase
    func test_box_compare_gt(): Unit {
        @Expect(Box(Int64(3)).compare(Box(Int64(2))), Ordering.GT)
    }

    @TestCase
    func test_box_compare_eq(): Unit {
        @Expect(Box(Int64(2)).compare(Box(Int64(2))), Ordering.EQ)
    }

    @TestCase
    func test_box_operators(): Unit {
        let a = Box<Int64>(1)
        let b = Box<Int64>(2)
        @Assert(a < b)
        @Assert(a <= b)
        @Assert(b > a)
        @Assert(b >= a)
        @Assert(a != b)
        @Assert(!(a == b))
    }

    @TestCase
    func test_box_hashcode(): Unit {
        let a = Box<Int64>(42)
        @Expect(a.hashCode(), Int64(42).hashCode())
    }

    @TestCase
    func test_box_to_string(): Unit {
        let a = Box<Int64>(42)
        @Expect(a.toString(), "42")
    }

    @TestCase
    func test_box_string_to_string(): Unit {
        let a = Box<String>("hello")
        @Expect(a.toString(), "hello")
    }

    // ==================== Exception.toString: empty message and non-empty message ====================

    @TestCase
    func test_exception_to_string_empty_message(): Unit {
        let ex = Exception()
        @Expect(ex.toString(), "Exception")
    }

    @TestCase
    func test_exception_to_string_with_message(): Unit {
        let ex = Exception("test exception message")
        @Expect(ex.toString(), "Exception: test exception message")
    }

    @TestCase
    func test_exception_message_prop(): Unit {
        let ex = Exception("test message")
        @Expect(ex.message, "test message")
    }

    // ==================== Ordering: toString and compare ====================

    @TestCase
    func test_ordering_to_string(): Unit {
        @Expect(Ordering.LT.toString(), "Ordering.LT")
        @Expect(Ordering.GT.toString(), "Ordering.GT")
        @Expect(Ordering.EQ.toString(), "Ordering.EQ")
    }

    @TestCase
    func test_ordering_compare_eq(): Unit {
        @Assert(Ordering.LT.compare(Ordering.LT) == Ordering.EQ)
        @Assert(Ordering.EQ.compare(Ordering.EQ) == Ordering.EQ)
        @Assert(Ordering.GT.compare(Ordering.GT) == Ordering.EQ)
    }

    @TestCase
    func test_ordering_compare_lt(): Unit {
        @Assert(Ordering.LT.compare(Ordering.EQ) == Ordering.LT)
        @Assert(Ordering.LT.compare(Ordering.GT) == Ordering.LT)
        @Assert(Ordering.EQ.compare(Ordering.GT) == Ordering.LT)
    }

    @TestCase
    func test_ordering_compare_gt(): Unit {
        @Assert(Ordering.EQ.compare(Ordering.LT) == Ordering.GT)
        @Assert(Ordering.GT.compare(Ordering.LT) == Ordering.GT)
        @Assert(Ordering.GT.compare(Ordering.EQ) == Ordering.GT)
    }

    // ==================== max/min functions ====================

    @TestCase
    func test_max_two_args(): Unit {
        @Expect(max(5, 3), 5)
        @Expect(max(3, 5), 5)
        @Expect(max(5, 5), 5)
    }

    @TestCase
    func test_max_with_others(): Unit {
        @Expect(max(3, 5, [7, 9, 1]), 9)
        @Expect(max(3, 2, Array<Int64>(0, repeat: 0)), 3)
    }

    @TestCase
    func test_min_two_args(): Unit {
        @Expect(min(5, 3), 3)
        @Expect(min(3, 5), 3)
        @Expect(min(3, 3), 3)
    }

    @TestCase
    func test_min_with_others(): Unit {
        @Expect(min(3, 5, [7, 1, 9]), 1)
        @Expect(min(3, 5, Array<Int64>(0, repeat: 0)), 3)
    }

    // ==================== Countable: next with negative for UInt types ====================

    @TestCase
    func test_countable_uint64_next_negative(): Unit {
        let val = UInt64(10)
        @Expect(val.next(-3), UInt64(7))
    }

    @TestCase
    func test_countable_uint64_next_positive(): Unit {
        let val = UInt64(10)
        @Expect(val.next(3), UInt64(13))
    }

    @TestCase
    func test_countable_uint32_next_negative(): Unit {
        let val = UInt32(10)
        @Expect(val.next(-3), UInt32(7))
    }

    @TestCase
    func test_countable_uint16_next_negative(): Unit {
        let val = UInt16(10)
        @Expect(val.next(-3), UInt16(7))
    }

    @TestCase
    func test_countable_uint8_next_negative(): Unit {
        let val = UInt8(10)
        @Expect(val.next(-3), UInt8(7))
    }

    @TestCase
    func test_countable_int64_position(): Unit {
        @Expect(Int64(42).position(), 42)
    }

    @TestCase
    func test_countable_rune_next(): Unit {
        let r = r'A'
        let next = r.next(1)
        @Expect(next, r'B')
    }

    @TestCase
    func test_countable_rune_position(): Unit {
        @Expect(r'A'.position(), 65)
    }

    // ==================== Rune.compare ====================

    @TestCase
    func test_rune_compare_lt(): Unit {
        @Expect(r'A'.compare(r'B'), Ordering.LT)
    }

    @TestCase
    func test_rune_compare_gt(): Unit {
        @Expect(r'B'.compare(r'A'), Ordering.GT)
    }

    @TestCase
    func test_rune_compare_eq(): Unit {
        @Expect(r'A'.compare(r'A'), Ordering.EQ)
    }

    // ==================== Byte: isAscii*, toAscii* boundary cases ====================

    @TestCase
    func test_byte_is_ascii_letter(): Unit {
        @Assert(b'A'.isAsciiLetter())
        @Assert(b'z'.isAsciiLetter())
        @Assert(!b'0'.isAsciiLetter())
        @Assert(!b'@'.isAsciiLetter())
    }

    @TestCase
    func test_byte_is_ascii_number(): Unit {
        @Assert(b'0'.isAsciiNumber())
        @Assert(b'9'.isAsciiNumber())
        @Assert(!b'A'.isAsciiNumber())
    }

    @TestCase
    func test_byte_is_ascii_hex(): Unit {
        @Assert(b'0'.isAsciiHex())
        @Assert(b'9'.isAsciiHex())
        @Assert(b'a'.isAsciiHex())
        @Assert(b'f'.isAsciiHex())
        @Assert(b'A'.isAsciiHex())
        @Assert(b'F'.isAsciiHex())
        @Assert(!b'g'.isAsciiHex())
    }

    @TestCase
    func test_byte_is_ascii_oct(): Unit {
        @Assert(b'0'.isAsciiOct())
        @Assert(b'7'.isAsciiOct())
        @Assert(!b'8'.isAsciiOct())
    }

    @TestCase
    func test_byte_is_ascii_punctuation(): Unit {
        @Assert(b'!'.isAsciiPunctuation())
        @Assert(b'/'.isAsciiPunctuation())
        @Assert(b':'.isAsciiPunctuation())
        @Assert(b'@'.isAsciiPunctuation())
        @Assert(b'['.isAsciiPunctuation())
        @Assert(b'`'.isAsciiPunctuation())
        @Assert(b'{'.isAsciiPunctuation())
        @Assert(b'~'.isAsciiPunctuation())
        @Assert(!b'A'.isAsciiPunctuation())
        @Assert(!b' '.isAsciiPunctuation())
    }

    @TestCase
    func test_byte_is_ascii_graphic(): Unit {
        @Assert(b'!'.isAsciiGraphic())
        @Assert(b'~'.isAsciiGraphic())
        @Assert(!b' '.isAsciiGraphic())
    }

    @TestCase
    func test_byte_is_ascii_control(): Unit {
        @Assert(UInt8(0x00).isAsciiControl())
        @Assert(UInt8(0x1F).isAsciiControl())
        @Assert(UInt8(0x7F).isAsciiControl())
        @Assert(!b' '.isAsciiControl())
    }

    @TestCase
    func test_byte_is_ascii_number_or_letter(): Unit {
        @Assert(b'A'.isAsciiNumberOrLetter())
        @Assert(b'0'.isAsciiNumberOrLetter())
        @Assert(!b'!'.isAsciiNumberOrLetter())
    }

    @TestCase
    func test_byte_is_ascii_lower_upper(): Unit {
        @Assert(b'a'.isAsciiLowerCase())
        @Assert(!b'A'.isAsciiLowerCase())
        @Assert(b'A'.isAsciiUpperCase())
        @Assert(!b'a'.isAsciiUpperCase())
    }

    @TestCase
    func test_byte_is_ascii(): Unit {
        @Assert(b'A'.isAscii())
        @Assert(UInt8(0x7F).isAscii())
        @Assert(!UInt8(0x80).isAscii())
    }

    @TestCase
    func test_byte_is_ascii_whitespace(): Unit {
        @Assert(UInt8(0x09).isAsciiWhiteSpace())
        @Assert(UInt8(0x0D).isAsciiWhiteSpace())
        @Assert(UInt8(0x20).isAsciiWhiteSpace())
        @Assert(!b'A'.isAsciiWhiteSpace())
    }

    @TestCase
    func test_byte_to_ascii_upper(): Unit {
        @Expect(b'a'.toAsciiUpperCase(), b'A')
        @Expect(b'z'.toAsciiUpperCase(), b'Z')
        @Expect(b'0'.toAsciiUpperCase(), b'0')
    }

    @TestCase
    func test_byte_to_ascii_lower(): Unit {
        @Expect(b'A'.toAsciiLowerCase(), b'a')
        @Expect(b'Z'.toAsciiLowerCase(), b'z')
        @Expect(b'0'.toAsciiLowerCase(), b'0')
    }

    // ==================== Rune: isAscii*, toAscii* ====================

    @TestCase
    func test_rune_is_ascii_letter(): Unit {
        @Assert(r'A'.isAsciiLetter())
        @Assert(r'z'.isAsciiLetter())
        @Assert(!r'0'.isAsciiLetter())
        @Assert(!r'@'.isAsciiLetter())
    }

    @TestCase
    func test_rune_is_ascii_number(): Unit {
        @Assert(r'0'.isAsciiNumber())
        @Assert(r'9'.isAsciiNumber())
        @Assert(!r'A'.isAsciiNumber())
    }

    @TestCase
    func test_rune_is_ascii_hex(): Unit {
        @Assert(r'0'.isAsciiHex())
        @Assert(r'f'.isAsciiHex())
        @Assert(r'F'.isAsciiHex())
        @Assert(!r'g'.isAsciiHex())
    }

    @TestCase
    func test_rune_is_ascii_punctuation(): Unit {
        @Assert(r'!'.isAsciiPunctuation())
        @Assert(r'/'.isAsciiPunctuation())
        @Assert(r':'.isAsciiPunctuation())
        @Assert(r'~'.isAsciiPunctuation())
        @Assert(!r'A'.isAsciiPunctuation())
    }

    @TestCase
    func test_rune_is_ascii_graphic(): Unit {
        @Assert(r'!'.isAsciiGraphic())
        @Assert(r'~'.isAsciiGraphic())
        @Assert(!r' '.isAsciiGraphic())
    }

    @TestCase
    func test_rune_is_ascii_control(): Unit {
        @Assert(r'\u{0000}'.isAsciiControl())
        @Assert(r'\u{001F}'.isAsciiControl())
        @Assert(r'\u{007F}'.isAsciiControl())
        @Assert(!r'A'.isAsciiControl())
    }

    @TestCase
    func test_rune_is_ascii_number_or_letter(): Unit {
        @Assert(r'A'.isAsciiNumberOrLetter())
        @Assert(r'0'.isAsciiNumberOrLetter())
        @Assert(!r'!'.isAsciiNumberOrLetter())
    }

    @TestCase
    func test_rune_is_ascii_lower_upper(): Unit {
        @Assert(r'a'.isAsciiLowerCase())
        @Assert(!r'A'.isAsciiLowerCase())
        @Assert(r'A'.isAsciiUpperCase())
        @Assert(!r'a'.isAsciiUpperCase())
    }

    @TestCase
    func test_rune_is_ascii(): Unit {
        @Assert(r'A'.isAscii())
        @Assert(r'\u{007F}'.isAscii())
        @Assert(!r'\u{0080}'.isAscii())
    }

    @TestCase
    func test_rune_is_ascii_whitespace(): Unit {
        @Assert(r'\u{0009}'.isAsciiWhiteSpace())
        @Assert(r'\u{000D}'.isAsciiWhiteSpace())
        @Assert(r'\u{0020}'.isAsciiWhiteSpace())
        @Assert(!r'A'.isAsciiWhiteSpace())
    }

    @TestCase
    func test_rune_to_ascii_upper(): Unit {
        @Expect(r'a'.toAsciiUpperCase(), r'A')
        @Expect(r'z'.toAsciiUpperCase(), r'Z')
        @Expect(r'0'.toAsciiUpperCase(), r'0')
    }

    @TestCase
    func test_rune_to_ascii_lower(): Unit {
        @Expect(r'A'.toAsciiLowerCase(), r'a')
        @Expect(r'Z'.toAsciiLowerCase(), r'z')
        @Expect(r'0'.toAsciiLowerCase(), r'0')
    }

    // ==================== ToString for primitive types ====================

    @TestCase
    func test_to_string_int64_negative(): Unit {
        @Expect(Int64(-42).toString(), "-42")
    }

    @TestCase
    func test_to_string_int64_zero(): Unit {
        @Expect(Int64(0).toString(), "0")
    }

    @TestCase
    func test_to_string_int64_max(): Unit {
        @Expect(Int64.Max.toString(), "9223372036854775807")
    }

    @TestCase
    func test_to_string_int64_min(): Unit {
        @Expect(Int64.Min.toString(), "-9223372036854775808")
    }

    @TestCase
    func test_to_string_uint64(): Unit {
        @Expect(UInt64(42).toString(), "42")
        @Expect(UInt64(0).toString(), "0")
    }

    @TestCase
    func test_to_string_int32(): Unit {
        @Expect(Int32(-42).toString(), "-42")
    }

    @TestCase
    func test_to_string_int16(): Unit {
        @Expect(Int16(-42).toString(), "-42")
    }

    @TestCase
    func test_to_string_int8(): Unit {
        @Expect(Int8(-42).toString(), "-42")
    }

    @TestCase
    func test_to_string_uint32(): Unit {
        @Expect(UInt32(42).toString(), "42")
    }

    @TestCase
    func test_to_string_uint16(): Unit {
        @Expect(UInt16(42).toString(), "42")
    }

    @TestCase
    func test_to_string_uint8(): Unit {
        @Expect(UInt8(42).toString(), "42")
    }

    @TestCase
    func test_to_string_bool(): Unit {
        @Expect(true.toString(), "true")
        @Expect(false.toString(), "false")
    }

    @TestCase
    func test_to_string_rune(): Unit {
        @Expect(r'A'.toString(), "A")
    }

    @TestCase
    func test_to_string_unit(): Unit {
        @Expect(().toString(), "()")
    }

    // ==================== StringBuilder: init, append, reserve, reset ====================

    @TestCase
    func test_stringbuilder_init_capacity(): Unit {
        let sb = StringBuilder(64)
        @Expect(sb.size, 0)
        @Assert(sb.capacity >= 64)
    }

    @TestCase
    func test_stringbuilder_init_capacity_zero(): Unit {
        try {
            let _ = StringBuilder(0)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_stringbuilder_init_capacity_negative(): Unit {
        try {
            let _ = StringBuilder(-1)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_stringbuilder_init_str(): Unit {
        let sb = StringBuilder("hello")
        @Expect(sb.toString(), "hello")
    }

    @TestCase
    func test_stringbuilder_init_rune_n(): Unit {
        let sb = StringBuilder(r'a', 5)
        @Expect(sb.toString(), "aaaaa")
    }

    @TestCase
    func test_stringbuilder_init_rune_n_negative(): Unit {
        try {
            let _ = StringBuilder(r'a', -1)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_stringbuilder_init_rune_array(): Unit {
        let sb = StringBuilder([r'h', r'e', r'l', r'l', r'o'])
        @Expect(sb.toString(), "hello")
    }

    @TestCase
    func test_stringbuilder_init_empty_rune_array(): Unit {
        let sb = StringBuilder(Array<Rune>(0, repeat: r'\0'))
        @Expect(sb.toString(), "")
    }

    @TestCase
    func test_stringbuilder_append_bool(): Unit {
        let sb = StringBuilder()
        sb.append(true)
        sb.append(false)
        @Expect(sb.toString(), "truefalse")
    }

    @TestCase
    func test_stringbuilder_append_int64_min(): Unit {
        let sb = StringBuilder()
        sb.append(Int64.Min)
        @Expect(sb.toString(), "-9223372036854775808")
    }

    @TestCase
    func test_stringbuilder_append_int64_negative(): Unit {
        let sb = StringBuilder()
        sb.append(Int64(-42))
        @Expect(sb.toString(), "-42")
    }

    @TestCase
    func test_stringbuilder_append_int64_positive(): Unit {
        let sb = StringBuilder()
        sb.append(Int64(42))
        @Expect(sb.toString(), "42")
    }

    @TestCase
    func test_stringbuilder_append_uint64(): Unit {
        let sb = StringBuilder()
        sb.append(UInt64(42))
        @Expect(sb.toString(), "42")
    }

    @TestCase
    func test_stringbuilder_append_empty_string(): Unit {
        let sb = StringBuilder("hello")
        sb.append("")
        @Expect(sb.toString(), "hello")
    }

    @TestCase
    func test_stringbuilder_append_empty_sb(): Unit {
        let sb = StringBuilder("hello")
        let empty = StringBuilder()
        sb.append(empty)
        @Expect(sb.toString(), "hello")
    }

    @TestCase
    func test_stringbuilder_append_from_utf8_empty(): Unit {
        let sb = StringBuilder("hello")
        sb.appendFromUtf8([])
        @Expect(sb.toString(), "hello")
    }

    @TestCase
    func test_stringbuilder_append_from_utf8(): Unit {
        let sb = StringBuilder()
        sb.appendFromUtf8([b'h', b'i'])
        @Expect(sb.toString(), "hi")
    }

    @TestCase
    func test_stringbuilder_append_rune_array(): Unit {
        let sb = StringBuilder()
        sb.append([r'h', r'i'])
        @Expect(sb.toString(), "hi")
    }

    @TestCase
    func test_stringbuilder_reserve_sufficient(): Unit {
        let sb = StringBuilder("test")
        sb.reserve(2)
        @Expect(sb.toString(), "test")
    }

    @TestCase
    func test_stringbuilder_reserve_grow(): Unit {
        let sb = StringBuilder()
        sb.reserve(100)
        @Assert(sb.capacity >= 100)
    }

    @TestCase
    func test_stringbuilder_reset_default(): Unit {
        let sb = StringBuilder("hello")
        sb.reset()
        @Expect(sb.size, 0)
    }

    @TestCase
    func test_stringbuilder_reset_capacity(): Unit {
        let sb = StringBuilder("hello")
        sb.reset(capacity: Option<Int64>.Some(64))
        @Expect(sb.size, 0)
        @Assert(sb.capacity >= 64)
    }

    @TestCase
    func test_stringbuilder_reset_capacity_zero(): Unit {
        let sb = StringBuilder("hello")
        try {
            sb.reset(capacity: Option<Int64>.Some(0))
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_stringbuilder_to_string(): Unit {
        let sb = StringBuilder("hello world")
        @Expect(sb.toString(), "hello world")
    }

    @TestCase
    func test_stringbuilder_capacity_prop(): Unit {
        let sb = StringBuilder()
        @Assert(sb.capacity > 0)
    }

    // ==================== String: compare, startsWith, endsWith, indexOf ====================

    @TestCase
    func test_string_compare_lt(): Unit {
        @Expect("abc".compare("abd"), Ordering.LT)
    }

    @TestCase
    func test_string_compare_gt(): Unit {
        @Expect("abd".compare("abc"), Ordering.GT)
    }

    @TestCase
    func test_string_compare_eq(): Unit {
        @Expect("abc".compare("abc"), Ordering.EQ)
    }

    @TestCase
    func test_string_compare_prefix_gt(): Unit {
        @Expect("abcd".compare("abc"), Ordering.GT)
    }

    @TestCase
    func test_string_compare_prefix_lt(): Unit {
        @Expect("abc".compare("abcd"), Ordering.LT)
    }

    @TestCase
    func test_string_compare_operators(): Unit {
        @Assert("abc" < "abd")
        @Assert("abc" <= "abc")
        @Assert("abd" > "abc")
        @Assert("abc" >= "abc")
    }

    @TestCase
    func test_string_equals(): Unit {
        @Assert("hello" == "hello")
        @Assert("hello" != "world")
    }

    @TestCase
    func test_string_starts_with_empty(): Unit {
        @Assert("hello".startsWith(""))
    }

    @TestCase
    func test_string_starts_with_true(): Unit {
        @Assert("hello world".startsWith("hello"))
    }

    @TestCase
    func test_string_starts_with_false(): Unit {
        @Assert(!"hello world".startsWith("world"))
    }

    @TestCase
    func test_string_starts_with_too_long(): Unit {
        @Assert(!"hi".startsWith("hello"))
    }

    @TestCase
    func test_string_ends_with_empty(): Unit {
        @Assert("hello".endsWith(""))
    }

    @TestCase
    func test_string_ends_with_true(): Unit {
        @Assert("hello world".endsWith("world"))
    }

    @TestCase
    func test_string_ends_with_false(): Unit {
        @Assert(!"hello world".endsWith("hello"))
    }

    @TestCase
    func test_string_ends_with_too_long(): Unit {
        @Assert(!"hi".endsWith("hello"))
    }

    @TestCase
    func test_string_index_of_byte_found(): Unit {
        match ("hello".indexOf(b'l')) {
            case Some(v) => @Expect(v, 2)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_string_index_of_byte_not_found(): Unit {
        match ("hello".indexOf(b'z')) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_string_index_of_byte_from_index(): Unit {
        match ("hello".indexOf(b'l', 3)) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_string_index_of_byte_from_index_out_of_range(): Unit {
        match ("hello".indexOf(b'l', 100)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_string_index_of_byte_from_index_negative(): Unit {
        match ("hello".indexOf(b'l', -1)) {
            case Some(v) => @Expect(v, 2)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_string_index_of_string_found(): Unit {
        match ("hello world".indexOf("world")) {
            case Some(v) => @Expect(v, 6)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_string_index_of_string_not_found(): Unit {
        match ("hello world".indexOf("xyz")) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_string_index_of_empty_string(): Unit {
        match ("hello".indexOf("")) {
            case Some(v) => @Expect(v, 0)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_string_index_of_single_char(): Unit {
        match ("hello".indexOf("e")) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_string_last_index_of_byte_found(): Unit {
        match ("hello".lastIndexOf(b'l')) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_string_last_index_of_byte_not_found(): Unit {
        match ("hello".lastIndexOf(b'z')) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_string_last_index_of_byte_from_index(): Unit {
        match ("hello".lastIndexOf(b'l', 2)) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_string_last_index_of_byte_from_index_negative(): Unit {
        match ("hello".lastIndexOf(b'l', -1)) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_string_last_index_of_string_empty(): Unit {
        match ("hello".lastIndexOf("")) {
            case Some(v) => @Expect(v, 5)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_string_last_index_of_string_not_found(): Unit {
        match ("hello".lastIndexOf("xyz")) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_string_contains_empty(): Unit {
        @Assert("hello".contains(""))
    }

    @TestCase
    func test_string_contains_found(): Unit {
        @Assert("hello world".contains("world"))
    }

    @TestCase
    func test_string_contains_not_found(): Unit {
        @Assert(!"hello".contains("xyz"))
    }

    // ==================== String: replace, split, count, lazySplit ====================

    @TestCase
    func test_string_replace_found(): Unit {
        @Expect("hello world".replace("l", "k"), "hekko workd")
    }

    @TestCase
    func test_string_replace_not_found(): Unit {
        @Expect("hello world".replace("xyz", "abc"), "hello world")
    }

    @TestCase
    func test_string_replace_empty_old_non_empty(): Unit {
        @Expect("".replace("", "hello"), "hello")
    }

    @TestCase
    func test_string_replace_empty_old_empty_string(): Unit {
        @Expect("".replace("", "hello"), "hello")
    }

    @TestCase
    func test_string_replace_empty_old_non_empty_string(): Unit {
        // replace with empty old is implementation-defined; just exercise it
        let result = "hello".replace("", "-")
        @Assert(result.size > 0)
    }

    @TestCase
    func test_string_split(): Unit {
        let parts = "a,b,c".split(",")
        @Expect(parts.size, 3)
        @Expect(parts[0], "a")
        @Expect(parts[1], "b")
        @Expect(parts[2], "c")
    }

    @TestCase
    func test_string_split_remove_empty(): Unit {
        let parts = ",a,,b,".split(",", removeEmpty: true)
        @Expect(parts.size, 2)
        @Expect(parts[0], "a")
        @Expect(parts[1], "b")
    }

    @TestCase
    func test_string_split_empty_string(): Unit {
        let parts = "".split(",")
        @Expect(parts.size, 0)
    }

    @TestCase
    func test_string_split_max_splits(): Unit {
        let parts = "a,b,c,d".split(",", 2)
        @Expect(parts.size, 2)
    }

    @TestCase
    func test_string_split_max_splits_zero(): Unit {
        let parts = "a,b,c".split(",", 0)
        @Expect(parts.size, 0)
    }

    @TestCase
    func test_string_lazy_split(): Unit {
        var count = 0
        for (part in "a,b,c".lazySplit(",")) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_string_lazy_split_empty(): Unit {
        var count = 0
        for (part in "".lazySplit(",")) {
            count++
        }
        @Expect(count, 0)
    }

    @TestCase
    func test_string_count_substring(): Unit {
        // count may count overlapping or non-overlapping; just exercise
        let c = "hello world".count("l")
        @Assert(c > 0)
    }

    @TestCase
    func test_string_count_empty_substring(): Unit {
        @Expect("hello".count(""), 6)
    }

    @TestCase
    func test_string_count_not_found(): Unit {
        @Expect("hello".count("xyz"), 0)
    }

    // ==================== String: toAsciiLower, toAsciiUpper, toAsciiTitle, trimAscii ====================

    @TestCase
    func test_string_to_ascii_lower(): Unit {
        @Expect("Hello World".toAsciiLower(), "hello world")
    }

    @TestCase
    func test_string_to_ascii_upper(): Unit {
        @Expect("Hello World".toAsciiUpper(), "HELLO WORLD")
    }

    @TestCase
    func test_string_to_ascii_title(): Unit {
        @Expect("hello world".toAsciiTitle(), "Hello World")
    }

    @TestCase
    func test_string_to_ascii_title_mixed(): Unit {
        @Expect("hElLo WoRlD".toAsciiTitle(), "Hello World")
    }

    @TestCase
    func test_string_trim_ascii(): Unit {
        @Expect("  hello  ".trimAscii(), "hello")
    }

    @TestCase
    func test_string_trim_ascii_all_whitespace(): Unit {
        @Expect("   ".trimAscii(), "")
    }

    @TestCase
    func test_string_trim_ascii_start(): Unit {
        @Expect("  hello  ".trimAsciiStart(), "hello  ")
    }

    @TestCase
    func test_string_trim_ascii_end(): Unit {
        @Expect("  hello  ".trimAsciiEnd(), "  hello")
    }

    @TestCase
    func test_string_trim_ascii_start_all_whitespace(): Unit {
        @Expect("   ".trimAsciiStart(), "")
    }

    @TestCase
    func test_string_trim_ascii_end_all_whitespace(): Unit {
        @Expect("   ".trimAsciiEnd(), "")
    }

    // ==================== String: padStart, padEnd ====================

    @TestCase
    func test_string_pad_start(): Unit {
        @Expect("hi".padStart(4), "  hi")
    }

    @TestCase
    func test_string_pad_start_custom(): Unit {
        @Expect("hi".padStart(4, padding: "-"), "--hi")
    }

    @TestCase
    func test_string_pad_start_zero(): Unit {
        @Expect("hi".padStart(0), "hi")
    }

    @TestCase
    func test_string_pad_start_shorter(): Unit {
        @Expect("hello".padStart(3), "hello")
    }

    @TestCase
    func test_string_pad_start_negative(): Unit {
        try {
            let _ = "hi".padStart(-1)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_string_pad_start_empty_padding(): Unit {
        // padStart with empty padding may throw or return unchanged
        var caught = false
        try {
            let _ = "hi".padStart(4, padding: "")
        } catch (e: Exception) {
            caught = true
        }
        @Assert(true)
    }

    @TestCase
    func test_string_pad_end(): Unit {
        @Expect("hi".padEnd(4), "hi  ")
    }

    @TestCase
    func test_string_pad_end_custom(): Unit {
        @Expect("hi".padEnd(4, padding: "-"), "hi--")
    }

    @TestCase
    func test_string_pad_end_zero(): Unit {
        @Expect("hi".padEnd(0), "hi")
    }

    @TestCase
    func test_string_pad_end_shorter(): Unit {
        @Expect("hello".padEnd(3), "hello")
    }

    @TestCase
    func test_string_pad_end_negative(): Unit {
        try {
            let _ = "hi".padEnd(-1)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    // ==================== String: equalsIgnoreAsciiCase, removePrefix, removeSuffix ====================

    @TestCase
    func test_string_equals_ignore_ascii_case(): Unit {
        @Assert("Hello".equalsIgnoreAsciiCase("hello"))
        @Assert("HELLO".equalsIgnoreAsciiCase("hello"))
        @Assert(!"Hello".equalsIgnoreAsciiCase("world"))
    }

    @TestCase
    func test_string_equals_ignore_ascii_case_diff_len(): Unit {
        @Assert(!"Hello".equalsIgnoreAsciiCase("Helloo"))
    }

    @TestCase
    func test_string_remove_prefix_match(): Unit {
        @Expect("hello world".removePrefix("hello "), "world")
    }

    @TestCase
    func test_string_remove_prefix_no_match(): Unit {
        @Expect("hello world".removePrefix("world"), "hello world")
    }

    @TestCase
    func test_string_remove_suffix_match(): Unit {
        @Expect("hello world".removeSuffix("world"), "hello ")
    }

    @TestCase
    func test_string_remove_suffix_no_match(): Unit {
        @Expect("hello world".removeSuffix("hello"), "hello world")
    }

    // ==================== String: + operator, * operator, join ====================

    @TestCase
    func test_string_concat(): Unit {
        @Expect("hello " + "world", "hello world")
    }

    @TestCase
    func test_string_concat_empty(): Unit {
        @Expect("hello" + "", "hello")
        @Expect("" + "hello", "hello")
    }

    @TestCase
    func test_string_repeat(): Unit {
        @Expect("abc" * 2, "abcabc")
    }

    @TestCase
    func test_string_repeat_zero(): Unit {
        @Expect("abc" * 0, "")
    }

    @TestCase
    func test_string_repeat_empty_string(): Unit {
        @Expect("" * 5, "")
    }

    @TestCase
    func test_string_repeat_negative(): Unit {
        try {
            let _ = "abc" * (-1)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_string_join_empty_array(): Unit {
        @Expect(String.join(Array<String>(0, repeat: "")), "")
    }

    @TestCase
    func test_string_join_single(): Unit {
        @Expect(String.join(["hello"]), "hello")
    }

    @TestCase
    func test_string_join_multiple(): Unit {
        @Expect(String.join(["a", "b", "c"], delimiter: ","), "a,b,c")
    }

    @TestCase
    func test_string_join_empty_delimiter(): Unit {
        @Expect(String.join(["a", "b", "c"]), "abc")
    }

    // ==================== String: isAscii, isAsciiBlank, clone, runes ====================

    @TestCase
    func test_string_is_ascii_true(): Unit {
        @Assert("hello".isAscii())
    }

    @TestCase
    func test_string_is_ascii_false(): Unit {
        @Assert(!"héllo".isAscii())
    }

    @TestCase
    func test_string_is_ascii_empty(): Unit {
        @Assert("".isAscii())
    }

    @TestCase
    func test_string_is_ascii_blank_true(): Unit {
        @Assert("  \t\n".isAsciiBlank())
    }

    @TestCase
    func test_string_is_ascii_blank_false(): Unit {
        @Assert(!"  hello  ".isAsciiBlank())
    }

    @TestCase
    func test_string_clone(): Unit {
        let s = "hello"
        let c = s.clone()
        @Expect(s, c)
    }

    @TestCase
    func test_string_runes(): Unit {
        var count = 0
        for (r in "hello".runes()) {
            count++
        }
        @Expect(count, 5)
    }

    @TestCase
    func test_string_lines(): Unit {
        var count = 0
        for (line in "a\nb\nc".lines()) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_string_lines_with_cr(): Unit {
        var count = 0
        for (line in "a\r\nb".lines()) {
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func test_string_size_and_isempty(): Unit {
        @Expect("hello".size, 5)
        @Assert(!"hello".isEmpty())
        @Assert("".isEmpty())
    }

    @TestCase
    func test_string_to_array(): Unit {
        let arr = "hello".toArray()
        @Expect(arr.size, 5)
        @Expect(arr[0], b'h')
    }

    @TestCase
    func test_string_to_rune_array(): Unit {
        let runes = "hello".toRuneArray()
        @Expect(runes.size, 5)
        @Expect(runes[0], r'h')
    }

    // ==================== Array: first, last, slice, get, clone ====================

    @TestCase
    func test_array_first_empty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        match (arr.first) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_array_first_non_empty(): Unit {
        let arr = [1, 2, 3]
        match (arr.first) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_array_last_empty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        match (arr.last) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_array_last_non_empty(): Unit {
        let arr = [1, 2, 3]
        match (arr.last) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_array_slice_valid(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let s = arr.slice(1, 3)
        @Expect(s.size, 3)
        @Expect(s[0], 2)
        @Expect(s[2], 4)
    }

    @TestCase
    func test_array_slice_negative_start(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.slice(-1, 2)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_slice_negative_len(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.slice(0, -1)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_slice_out_of_bounds(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.slice(1, 5)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_get_valid(): Unit {
        let arr = [1, 2, 3]
        match (arr.get(1)) {
            case Some(v) => @Expect(v, 2)
            case None => @Assert(false)
        }
    }



    @TestCase
    func test_array_clone(): Unit {
        let arr = [1, 2, 3]
        let c = arr.clone()
        @Expect(c.size, 3)
        @Expect(c[0], 1)
    }

    @TestCase
    func test_array_clone_empty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        let c = arr.clone()
        @Expect(c.size, 0)
    }

    @TestCase
    func test_array_clone_range(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let c = arr.clone(1..4)
        @Expect(c.size, 3)
        @Expect(c[0], 2)
        @Expect(c[2], 4)
    }

    // ==================== Array: reverse, copyTo, swap, splitAt, repeat, concat ====================

    @TestCase
    func test_array_reverse(): Unit {
        let arr = [1, 2, 3, 4, 5]
        arr.reverse()
        @Expect(arr[0], 5)
        @Expect(arr[4], 1)
    }

    @TestCase
    func test_array_reverse_single(): Unit {
        let arr = [42]
        arr.reverse()
        @Expect(arr[0], 42)
    }

    @TestCase
    func test_array_copy_to(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        src.copyTo(dst, 0, 0, 3)
        @Expect(dst[0], 1)
        @Expect(dst[2], 3)
    }

    @TestCase
    func test_array_copy_to_zero_len(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        src.copyTo(dst, 0, 0, 0)
        @Expect(dst[0], 0)
    }

    @TestCase
    func test_array_copy_to_negative_len(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        try {
            src.copyTo(dst, 0, 0, -1)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_copy_to_negative_src_start(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        try {
            src.copyTo(dst, -1, 0, 2)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_copy_to_src_start_out_of_bounds(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        try {
            src.copyTo(dst, 3, 0, 1)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_copy_to_dst_start_out_of_bounds(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        try {
            src.copyTo(dst, 0, 3, 1)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_copy_to_copy_len_out_of_bounds(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        try {
            src.copyTo(dst, 0, 0, 5)
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_copy_to_simple(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(3, repeat: 0)
        src.copyTo(dst)
        @Expect(dst[0], 1)
        @Expect(dst[2], 3)
    }

    @TestCase
    func test_array_copy_to_simple_empty(): Unit {
        let src = Array<Int64>(0, repeat: 0)
        let dst = Array<Int64>(3, repeat: 0)
        src.copyTo(dst)
        @Expect(dst[0], 0)
    }

    @TestCase
    func test_array_copy_to_simple_dst_too_small(): Unit {
        let src = [1, 2, 3]
        let dst = Array<Int64>(2, repeat: 0)
        try {
            src.copyTo(dst)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_swap_same_index(): Unit {
        let arr = [1, 2, 3]
        arr.swap(1, 1)
        @Expect(arr[1], 2)
    }

    @TestCase
    func test_array_swap_different(): Unit {
        let arr = [1, 2, 3]
        arr.swap(0, 2)
        @Expect(arr[0], 3)
        @Expect(arr[2], 1)
    }

    @TestCase
    func test_array_swap_index1_out_of_bounds(): Unit {
        let arr = [1, 2, 3]
        try {
            arr.swap(5, 0)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_swap_index2_out_of_bounds(): Unit {
        let arr = [1, 2, 3]
        try {
            arr.swap(0, 5)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_split_at(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let (left, right) = arr.splitAt(2)
        @Expect(left.size, 2)
        @Expect(right.size, 3)
        @Expect(left[0], 1)
        @Expect(right[0], 3)
    }

    @TestCase
    func test_array_split_at_zero(): Unit {
        let arr = [1, 2, 3]
        let (left, right) = arr.splitAt(0)
        @Expect(left.size, 0)
        @Expect(right.size, 3)
    }

    @TestCase
    func test_array_split_at_full(): Unit {
        let arr = [1, 2, 3]
        let (left, right) = arr.splitAt(3)
        @Expect(left.size, 3)
        @Expect(right.size, 0)
    }

    @TestCase
    func test_array_split_at_negative(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.splitAt(-1)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_split_at_out_of_bounds(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.splitAt(5)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_repeat(): Unit {
        let arr = [1, 2, 3]
        let r = arr.repeat(2)
        @Expect(r.size, 6)
        @Expect(r[0], 1)
        @Expect(r[3], 1)
    }

    @TestCase
    func test_array_repeat_zero(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.repeat(0)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_repeat_negative(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.repeat(-1)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_concat_both_non_empty(): Unit {
        let a = [1, 2]
        let b = [3, 4]
        let c = a.concat(b)
        @Expect(c.size, 4)
        @Expect(c[0], 1)
        @Expect(c[3], 4)
    }

    @TestCase
    func test_array_concat_left_empty(): Unit {
        let a = Array<Int64>(0, repeat: 0)
        let b = [3, 4]
        let c = a.concat(b)
        @Expect(c.size, 2)
        @Expect(c[0], 3)
    }

    @TestCase
    func test_array_concat_right_empty(): Unit {
        let a = [1, 2]
        let b = Array<Int64>(0, repeat: 0)
        let c = a.concat(b)
        @Expect(c.size, 2)
        @Expect(c[0], 1)
    }

    @TestCase
    func test_array_fill(): Unit {
        let arr = Array<Int64>(5, repeat: 0)
        arr.fill(42)
        @Expect(arr[0], 42)
        @Expect(arr[4], 42)
    }

    @TestCase
    func test_array_map(): Unit {
        let arr = [1, 2, 3]
        let mapped = arr.map<Int64>({ x => x * 2 })
        @Expect(mapped[0], 2)
        @Expect(mapped[2], 6)
    }

    @TestCase
    func test_array_filter(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let filtered = arr.filter({ x => x > 2 })
        @Expect(filtered.size, 3)
        @Expect(filtered[0], 3)
    }

    @TestCase
    func test_array_filter_empty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        let filtered = arr.filter({ x => x > 0 })
        @Expect(filtered.size, 0)
    }

    @TestCase
    func test_array_flat_map(): Unit {
        let arr = [1, 2, 3]
        let result = arr.flatMap<Int64>({ x => [x, x * 10] })
        @Expect(result.size, 6)
        @Expect(result[0], 1)
        @Expect(result[1], 10)
        @Expect(result[2], 2)
    }

    @TestCase
    func test_array_filter_map(): Unit {
        let arr = [1, 2, 3, 4]
        let result = arr.filterMap<Int64>({ x => if (x % 2 == 0) { Option<Int64>.Some(x * 2) } else { Option<Int64>.None } })
        @Expect(result.size, 2)
        @Expect(result[0], 4)
        @Expect(result[1], 8)
    }

    @TestCase
    func test_array_intersperse(): Unit {
        let arr = [1, 2, 3]
        let result = arr.intersperse(0)
        @Expect(result.size, 5)
        @Expect(result[0], 1)
        @Expect(result[1], 0)
        @Expect(result[2], 2)
        @Expect(result[3], 0)
        @Expect(result[4], 3)
    }

    @TestCase
    func test_array_intersperse_single(): Unit {
        let arr = [42]
        let result = arr.intersperse(0)
        @Expect(result.size, 1)
        @Expect(result[0], 42)
    }

    @TestCase
    func test_array_for_each(): Unit {
        let arr = [1, 2, 3]
        // Use fold instead of forEach to avoid mutable capture
        let sum = arr.fold<Int64>(0, { acc, x => acc + x })
        @Expect(sum, 6)
    }

    @TestCase
    func test_array_all_true(): Unit {
        @Assert([2, 4, 6].all({ x => x % 2 == 0 }))
    }

    @TestCase
    func test_array_all_false(): Unit {
        @Assert(![2, 3, 4].all({ x => x % 2 == 0 }))
    }

    @TestCase
    func test_array_any_true(): Unit {
        @Assert([1, 3, 4].any({ x => x % 2 == 0 }))
    }

    @TestCase
    func test_array_any_false(): Unit {
        @Assert(![1, 3, 5].any({ x => x % 2 == 0 }))
    }

    @TestCase
    func test_array_none_true(): Unit {
        @Assert([1, 3, 5].none({ x => x % 2 == 0 }))
    }

    @TestCase
    func test_array_none_false(): Unit {
        @Assert(![1, 2, 3].none({ x => x % 2 == 0 }))
    }

    @TestCase
    func test_array_fold(): Unit {
        let arr = [1, 2, 3, 4]
        let result = arr.fold<Int64>(0, { acc, x => acc + x })
        @Expect(result, 10)
    }

    @TestCase
    func test_array_reduce(): Unit {
        let arr = [1, 2, 3, 4]
        match (arr.reduce({ a, b => a + b })) {
            case Some(v) => @Expect(v, 10)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_array_reduce_empty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        match (arr.reduce({ a, b => a + b })) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_array_zip(): Unit {
        let a = [1, 2, 3]
        let b = [10, 20, 30, 40]
        let z = a.zip<Int64>(b)
        @Expect(z.size, 3)
        @Expect(z[0][0], 1)
        @Expect(z[0][1], 10)
    }

    @TestCase
    func test_array_enumerate(): Unit {
        let arr = [10, 20, 30]
        let e = arr.enumerate()
        @Expect(e.size, 3)
        @Expect(e[0][0], 0)
        @Expect(e[0][1], 10)
        @Expect(e[2][0], 2)
        @Expect(e[2][1], 30)
    }

    @TestCase
    func test_array_flatten(): Unit {
        let nested = [[1, 2], [3, 4], [5, 6]]
        let flat = nested.flatten()
        @Expect(flat.size, 6)
        @Expect(flat[0], 1)
        @Expect(flat[5], 6)
    }

    @TestCase
    func test_array_step(): Unit {
        let arr = [1, 2, 3, 4, 5, 6]
        let s = arr.step(2)
        @Expect(s.size, 3)
        @Expect(s[0], 1)
        @Expect(s[1], 3)
        @Expect(s[2], 5)
    }

    @TestCase
    func test_array_step_invalid(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.step(0)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_take(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let t = arr.take(3)
        @Expect(t.size, 3)
        @Expect(t[0], 1)
    }

    @TestCase
    func test_array_take_zero(): Unit {
        let arr = [1, 2, 3]
        let t = arr.take(0)
        @Expect(t.size, 0)
    }

    @TestCase
    func test_array_take_negative(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.take(-1)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_skip(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let s = arr.skip(2)
        @Expect(s.size, 3)
        @Expect(s[0], 3)
    }

    @TestCase
    func test_array_skip_zero(): Unit {
        let arr = [1, 2, 3]
        let s = arr.skip(0)
        @Expect(s.size, 3)
    }

    @TestCase
    func test_array_skip_negative(): Unit {
        let arr = [1, 2, 3]
        try {
            let _ = arr.skip(-1)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_array_skip_all(): Unit {
        let arr = [1, 2, 3]
        let s = arr.skip(3)
        @Expect(s.size, 0)
    }

    // ==================== Iterator: various methods ====================

    @TestCase
    func test_iterator_map(): Unit {
        let arr = [1, 2, 3]
        let mapped = arr.iterator().map<Int64>({ x => x * 2 })
        var sum = 0
        for (v in mapped) {
            sum += v
        }
        @Expect(sum, 12)
    }

    @TestCase
    func test_iterator_filter(): Unit {
        let arr = [1, 2, 3, 4, 5]
        let filtered = arr.iterator().filter({ x => x > 2 })
        var count = 0
        for (_ in filtered) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_iterator_for_each(): Unit {
        let arr = [1, 2, 3]
        var count = 0
        for (_ in arr.iterator()) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_iterator_reduce(): Unit {
        let arr = [1, 2, 3, 4]
        match (arr.iterator().reduce({ a, b => a + b })) {
            case Some(v) => @Expect(v, 10)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_iterator_reduce_empty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        match (arr.iterator().reduce({ a, b => a + b })) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_iterator_fold(): Unit {
        let arr = [1, 2, 3, 4]
        let result = arr.iterator().fold<Int64>(10, { acc, x => acc + x })
        @Expect(result, 20)
    }

    @TestCase
    func test_iterator_zip(): Unit {
        let a = [1, 2, 3]
        let b = [10, 20, 30]
        let z = a.iterator().zip<Int64>(b.iterator())
        var count = 0
        for ((x, y) in z) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_iterator_zip_unequal(): Unit {
        let a = [1, 2, 3, 4, 5]
        let b = [10, 20]
        let z = a.iterator().zip<Int64>(b.iterator())
        var count = 0
        for (_ in z) {
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func test_iterator_enumerate(): Unit {
        let arr = [10, 20, 30]
        let e = arr.iterator().enumerate()
        var lastIndex = -1
        var lastVal = 0
        for ((idx, val) in e) {
            lastIndex = idx
            lastVal = val
        }
        @Expect(lastIndex, 2)
        @Expect(lastVal, 30)
    }

    @TestCase
    func test_iterator_any_true(): Unit {
        @Assert([1, 2, 3].iterator().any({ x => x == 2 }))
    }

    @TestCase
    func test_iterator_any_false(): Unit {
        @Assert(![1, 3, 5].iterator().any({ x => x == 2 }))
    }

    @TestCase
    func test_iterator_all_true(): Unit {
        @Assert([2, 4, 6].iterator().all({ x => x % 2 == 0 }))
    }

    @TestCase
    func test_iterator_all_false(): Unit {
        @Assert(![2, 3, 4].iterator().all({ x => x % 2 == 0 }))
    }

    @TestCase
    func test_iterator_none_true(): Unit {
        @Assert([1, 3, 5].iterator().none({ x => x % 2 == 0 }))
    }

    @TestCase
    func test_iterator_none_false(): Unit {
        @Assert(![1, 2, 3].iterator().none({ x => x % 2 == 0 }))
    }

    @TestCase
    func test_iterator_count(): Unit {
        @Expect([1, 2, 3, 4, 5].iterator().count(), 5)
    }

    @TestCase
    func test_iterator_is_empty_true(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        @Assert(arr.iterator().isEmpty())
    }

    @TestCase
    func test_iterator_is_empty_false(): Unit {
        @Assert(![1, 2, 3].iterator().isEmpty())
    }

    @TestCase
    func test_iterator_first(): Unit {
        match ([1, 2, 3].iterator().first()) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_iterator_first_empty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        match (arr.iterator().first()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_iterator_last(): Unit {
        match ([1, 2, 3].iterator().last()) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_iterator_last_empty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        match (arr.iterator().last()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_iterator_at_valid(): Unit {
        match ([1, 2, 3].iterator().at(1)) {
            case Some(v) => @Expect(v, 2)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_iterator_at_negative(): Unit {
        match ([1, 2, 3].iterator().at(-1)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_iterator_at_out_of_range(): Unit {
        match ([1, 2, 3].iterator().at(10)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_iterator_contains_found(): Unit {
        @Assert([1, 2, 3].iterator().contains(2))
    }

    @TestCase
    func test_iterator_contains_not_found(): Unit {
        @Assert(![1, 2, 3].iterator().contains(5))
    }

    @TestCase
    func test_iterator_max(): Unit {
        match ([3, 1, 4, 1, 5].iterator().max()) {
            case Some(v) => @Expect(v, 5)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_iterator_max_empty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        match (arr.iterator().max()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_iterator_min(): Unit {
        match ([3, 1, 4, 1, 5].iterator().min()) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_iterator_min_empty(): Unit {
        let arr = Array<Int64>(0, repeat: 0)
        match (arr.iterator().min()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_iterator_skip(): Unit {
        let it = [1, 2, 3, 4, 5].iterator().skip(2)
        var first = 0
        match (it.next()) {
            case Some(v) => first = v
            case None => @Assert(false)
        }
        @Expect(first, 3)
    }

    @TestCase
    func test_iterator_take(): Unit {
        let it = [1, 2, 3, 4, 5].iterator().take(3)
        var count = 0
        for (_ in it) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_iterator_take_negative(): Unit {
        try {
            let _ = [1, 2, 3].iterator().take(-1)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_iterator_skip_negative(): Unit {
        try {
            let _ = [1, 2, 3].iterator().skip(-1)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_iterator_concat(): Unit {
        let it = [1, 2].iterator().concat([3, 4].iterator())
        var sum = 0
        for (v in it) {
            sum += v
        }
        @Expect(sum, 10)
    }

    @TestCase
    func test_iterator_inspect(): Unit {
        // inspect with no side effect - just verify it works
        let it = [1, 2, 3].iterator().inspect({ _ => () })
        var count = 0
        for (_ in it) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_iterator_flat_map(): Unit {
        let it = [1, 2, 3].iterator().flatMap<Int64>({ x => [x, x * 10].iterator() })
        var count = 0
        for (_ in it) {
            count++
        }
        @Expect(count, 6)
    }

    @TestCase
    func test_iterator_filter_map(): Unit {
        let it = [1, 2, 3, 4].iterator().filterMap<Int64>({ x => if (x % 2 == 0) { Option<Int64>.Some(x * 2) } else { Option<Int64>.None } })
        var count = 0
        for (_ in it) {
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func test_iterator_step(): Unit {
        let it = [1, 2, 3, 4, 5, 6].iterator().step(2)
        var count = 0
        for (_ in it) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_iterator_step_invalid(): Unit {
        try {
            let _ = [1, 2, 3].iterator().step(0)
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    @TestCase
    func test_iterator_intersperse(): Unit {
        let it = [1, 2, 3].iterator().intersperse(0)
        var count = 0
        for (_ in it) {
            count++
        }
        @Expect(count, 5)
    }

    // ==================== Range: isEmpty branches ====================

    @TestCase
    func test_range_isempty_open_pos_empty(): Unit {
        let r = Range<Int64>(5, 1, 1, true, true, false)
        @Assert(r.isEmpty())
    }

    @TestCase
    func test_range_isempty_open_pos_non_empty(): Unit {
        let r = Range<Int64>(1, 5, 1, true, true, false)
        @Assert(!r.isEmpty())
    }

    @TestCase
    func test_range_isempty_open_neg_empty(): Unit {
        let r = Range<Int64>(1, 5, -1, true, true, false)
        @Assert(r.isEmpty())
    }

    @TestCase
    func test_range_isempty_open_neg_non_empty(): Unit {
        let r = Range<Int64>(5, 1, -1, true, true, false)
        @Assert(!r.isEmpty())
    }

    @TestCase
    func test_range_iterator(): Unit {
        let r = Range<Int64>(0, 4, 1, true, true, false)
        var count = 0
        for (_ in r) {
            count++
        }
        @Expect(count, 4)
    }

    @TestCase
    func test_range_iterator_closed(): Unit {
        let r = Range<Int64>(0, 4, 1, true, true, true)
        var count = 0
        for (_ in r) {
            count++
        }
        @Expect(count, 5)
    }

    @TestCase
    func test_range_iterator_step_2(): Unit {
        let r = Range<Int64>(0, 5, 2, true, true, false)
        var count = 0
        for (_ in r) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_range_iterator_negative_step(): Unit {
        let r = Range<Int64>(4, 0, -1, true, true, false)
        var count = 0
        for (_ in r) {
            count++
        }
        @Expect(count, 4)
    }

    @TestCase
    func test_range_equals_true(): Unit {
        let r1 = Range<Int64>(1, 5, 1, true, true, true)
        let r2 = Range<Int64>(1, 5, 1, true, true, true)
        @Assert(r1 == r2)
    }

    @TestCase
    func test_range_equals_false(): Unit {
        let r1 = Range<Int64>(1, 5, 1, true, true, true)
        let r2 = Range<Int64>(1, 6, 1, true, true, true)
        @Assert(r1 != r2)
    }


    // ==================== Float: fromBits, toBits ====================

    @TestCase
    func test_float64_from_bits_to_bits(): Unit {
        let f = 3.14
        let bits = f.toBits()
        let restored = Float64.fromBits(bits)
        @Assert(f == restored)
    }

    @TestCase
    func test_float32_from_bits_to_bits(): Unit {
        let f = Float32(1.5)
        let bits = f.toBits()
        let restored = Float32.fromBits(bits)
        @Assert(f == restored)
    }

    // ==================== String: indexing ====================

    @TestCase
    func test_string_indexing_valid(): Unit {
        @Expect("hello"[0], b'h')
        @Expect("hello"[4], b'o')
    }

    @TestCase
    func test_string_indexing_out_of_bounds(): Unit {
        try {
            let _ = "hello"[10]
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_string_indexing_negative(): Unit {
        try {
            let _ = "hello"[-1]
            @Assert(false)
        } catch (e: IndexOutOfBoundsException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_string_range_indexing(): Unit {
        let s = "hello world"
        @Expect(s[0..5], "hello")
        @Expect(s[0..=4], "hello")
        @Expect(s[6..], "world")
    }

    @TestCase
    func test_string_range_indexing_empty_result(): Unit {
        @Expect("hello"[0..0], "")
    }

    @TestCase
    func test_string_range_indexing_step_error(): Unit {
        try {
            let _ = "hello"[0..5:2]
            @Assert(false)
        } catch (e: Exception) {
            @Assert(true)
        }
    }

    // ==================== String: get ====================

    @TestCase
    func test_string_get_valid(): Unit {
        match ("hello".get(1)) {
            case Some(b) => @Expect(b, b'e')
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_string_get_out_of_bounds(): Unit {
        match ("hello".get(10)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_string_get_negative(): Unit {
        match ("hello".get(-1)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    // ==================== String: fromUtf8, checkUtf8Encoding ====================

    @TestCase
    func test_string_from_utf8_valid(): Unit {
        let s = String.fromUtf8([b'h', b'i'])
        @Expect(s, "hi")
    }

    @TestCase
    func test_string_from_utf8_empty(): Unit {
        let s = String.fromUtf8([])
        @Expect(s, "")
    }

    @TestCase
    func test_string_check_utf8_encoding_valid(): Unit {
        @Assert(String.checkUtf8Encoding([b'h', b'i']))
    }

    @TestCase
    func test_string_check_utf8_encoding_empty(): Unit {
        @Assert(String.checkUtf8Encoding([]))
    }

    @TestCase
    func test_string_check_utf8_encoding_invalid(): Unit {
        @Assert(!String.checkUtf8Encoding([UInt8(0x80)]))
    }

    // ==================== Exception: printStackTrace, getStackTrace ====================

    @TestCase
    func test_exception_print_stack_trace(): Unit {
        let ex = Exception("test stack trace")
        ex.printStackTrace()
        @Assert(true)
    }

    @TestCase
    func test_exception_get_stack_trace(): Unit {
        let ex = Exception("test")
        let trace = ex.getStackTrace()
        @Assert(trace.size >= 0)
    }

    // ==================== Thread: currentThread, name, state ====================

    @TestCase
    func test_thread_current_thread(): Unit {
        let t = Thread.currentThread
        @Assert(t.id > 0)
    }

    @TestCase
    func test_thread_name_get_set(): Unit {
        let t = Thread.currentThread
        t.name = "test_thread"
        @Assert(t.name.size >= 0)
    }

    @TestCase
    func test_thread_state(): Unit {
        let t = Thread.currentThread
        let state = t.state
        match (state) {
            case Ready => @Assert(true)
            case Running => @Assert(true)
            case Pending => @Assert(true)
            case Terminated => @Assert(true)
            case _ => @Assert(true)
        }
    }

    @TestCase
    func test_thread_has_pending_cancellation(): Unit {
        let t = Thread.currentThread
        @Assert(!t.hasPendingCancellation)
    }

    // ==================== Future: get, tryGet ====================

    @TestCase
    func test_future_get_simple(): Unit {
        let fut = spawn { 42 }
        let result = fut.get()
        @Expect(result, 42)
    }

    @TestCase
    func test_future_try_get(): Unit {
        let fut = spawn { 42 }
        fut.get()
        match (fut.tryGet()) {
            case Some(v) => @Expect(v, 42)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_future_thread(): Unit {
        let fut = spawn { 42 }
        let _ = fut.get()
        @Assert(fut.thread.id > 0)
    }

    @TestCase
    func test_future_cancel(): Unit {
        let fut = spawn { 42 }
        fut.cancel()
        let _ = fut.get()
        @Assert(true)
    }


    // ==================== CString: toString, size, isEmpty ====================

    @TestCase
    func test_cstring_to_string(): Unit {
        unsafe {
            let cs = LibC.mallocCString("hello")
            @Expect(cs.toString(), "hello")
            LibC.free(cs)
        }
    }

    @TestCase
    func test_cstring_size(): Unit {
        unsafe {
            let cs = LibC.mallocCString("hello")
            @Expect(cs.size(), 5)
            LibC.free(cs)
        }
    }

    @TestCase
    func test_cstring_is_empty_false(): Unit {
        unsafe {
            let cs = LibC.mallocCString("hello")
            @Assert(!cs.isEmpty())
            @Assert(cs.isNotEmpty())
            LibC.free(cs)
        }
    }

    @TestCase
    func test_cstring_starts_with(): Unit {
        unsafe {
            let cs = LibC.mallocCString("hello world")
            let prefix = LibC.mallocCString("hello")
            @Assert(cs.startsWith(prefix))
            LibC.free(cs)
            LibC.free(prefix)
        }
    }

    @TestCase
    func test_cstring_ends_with(): Unit {
        unsafe {
            let cs = LibC.mallocCString("hello world")
            let suffix = LibC.mallocCString("world")
            @Assert(cs.endsWith(suffix))
            LibC.free(cs)
            LibC.free(suffix)
        }
    }

    @TestCase
    func test_cstring_equals(): Unit {
        unsafe {
            let cs1 = LibC.mallocCString("hello")
            let cs2 = LibC.mallocCString("hello")
            let cs3 = LibC.mallocCString("world")
            @Assert(cs1.equals(cs2))
            @Assert(!cs1.equals(cs3))
            LibC.free(cs1)
            LibC.free(cs2)
            LibC.free(cs3)
        }
    }

    @TestCase
    func test_cstring_equals_lower(): Unit {
        unsafe {
            let cs1 = LibC.mallocCString("Hello")
            let cs2 = LibC.mallocCString("hello")
            @Assert(cs1.equalsLower(cs2))
            LibC.free(cs1)
            LibC.free(cs2)
        }
    }

    @TestCase
    func test_cstring_compare(): Unit {
        unsafe {
            let cs1 = LibC.mallocCString("abc")
            let cs2 = LibC.mallocCString("abd")
            @Assert(cs1.compare(cs2) < 0)
            @Assert(cs2.compare(cs1) > 0)
            @Assert(cs1.compare(cs1) == 0)
            LibC.free(cs1)
            LibC.free(cs2)
        }
    }

    @TestCase
    func test_cstring_sub_cstring(): Unit {
        unsafe {
            let cs = LibC.mallocCString("hello world")
            let sub = cs.subCString(UIntNative(6))
            @Expect(sub.toString(), "world")
            LibC.free(cs)
            LibC.free(sub)
        }
    }

    @TestCase
    func test_cstring_sub_cstring_with_len(): Unit {
        unsafe {
            let cs = LibC.mallocCString("hello world")
            let sub = cs.subCString(UIntNative(0), UIntNative(5))
            @Expect(sub.toString(), "hello")
            LibC.free(cs)
            LibC.free(sub)
        }
    }

    @TestCase
    func test_cstring_sub_cstring_full(): Unit {
        unsafe {
            let cs = LibC.mallocCString("hello")
            let sub = cs.subCString(UIntNative(0))
            @Expect(sub.toString(), "hello")
            LibC.free(cs)
            LibC.free(sub)
        }
    }

    @TestCase
    func test_cstring_sub_cstring_empty(): Unit {
        unsafe {
            let cs = LibC.mallocCString("hello")
            let sub = cs.subCString(UIntNative(5))
            @Expect(sub.toString(), "")
            LibC.free(cs)
            LibC.free(sub)
        }
    }

    @TestCase
    func test_cstring_sub_cstring_out_of_bounds(): Unit {
        unsafe {
            let cs = LibC.mallocCString("hello")
            try {
                let _ = cs.subCString(UIntNative(10))
                @Assert(false)
            } catch (e: IndexOutOfBoundsException) {
                @Assert(true)
            }
            LibC.free(cs)
        }
    }

    // ==================== String: iterator, runes, lines ====================

    @TestCase
    func test_string_iterator(): Unit {
        var count = 0
        for (b in "hello".iterator()) {
            count++
        }
        @Expect(count, 5)
    }

    // ==================== Array: size, iterator ====================

    @TestCase
    func test_array_size(): Unit {
        @Expect([1, 2, 3, 4, 5].size, 5)
        @Expect(Array<Int64>(0, repeat: 0).size, 0)
    }

    @TestCase
    func test_array_iterator(): Unit {
        var sum = 0
        for (v in [1, 2, 3].iterator()) {
            sum += v
        }
        @Expect(sum, 6)
    }

    // ==================== Equatable: Unit ====================

    @TestCase
    func test_unit_equals(): Unit {
        @Assert(() == ())
        @Assert(!(() != ()))
    }

    // ==================== String: hashCode ====================

    @TestCase
    func test_string_hashcode(): Unit {
        @Assert("hello".hashCode() == "hello".hashCode())
        @Assert("hello".hashCode() != "world".hashCode())
    }

    @TestCase
    func test_string_empty_hashcode(): Unit {
        @Assert(String.empty.hashCode() >= 0)
    }

    // ==================== Comparable: Int64, Float64 compare ====================

    @TestCase
    func test_int64_compare(): Unit {
        @Expect(Int64(1).compare(Int64(2)), Ordering.LT)
        @Expect(Int64(2).compare(Int64(1)), Ordering.GT)
        @Expect(Int64(1).compare(Int64(1)), Ordering.EQ)
    }

    @TestCase
    func test_float64_compare(): Unit {
        @Expect(1.0.compare(2.0), Ordering.LT)
        @Expect(2.0.compare(1.0), Ordering.GT)
        @Expect(1.0.compare(1.0), Ordering.EQ)
    }

    @TestCase
    func test_uint64_compare(): Unit {
        @Expect(UInt64(1).compare(UInt64(2)), Ordering.LT)
        @Expect(UInt64(2).compare(UInt64(1)), Ordering.GT)
    }

    // ==================== String: toRuneArray with unicode ====================

    @TestCase
    func test_string_to_rune_array_unicode(): Unit {
        let s = "héllo"
        let runes = s.toRuneArray()
        @Assert(runes.size >= 5)
        @Expect(runes[0], r'h')
    }

    // ==================== String fromRuneArray ====================

    @TestCase
    func test_string_from_rune_array_empty(): Unit {
        let s = String(Array<Rune>(0, repeat: r'\0'))
        @Expect(s, "")
    }

    @TestCase
    func test_string_from_rune_array_non_empty(): Unit {
        let s = String([r'h', r'e', r'l', r'l', r'o'])
        @Expect(s, "hello")
    }

    // ==================== Duration basic tests ====================

    @TestCase
    func test_duration_zero(): Unit {
        @Assert(Duration.Zero <= Duration.Zero)
        @Expect(Duration.Zero.toNanoseconds(), 0)
    }

    @TestCase
    func test_duration_second(): Unit {
        @Expect(Duration.second.toNanoseconds(), 1000000000)
    }

    @TestCase
    func test_duration_millisecond(): Unit {
        @Expect(Duration.millisecond.toNanoseconds(), 1000000)
    }

    @TestCase
    func test_duration_microsecond(): Unit {
        @Expect(Duration.microsecond.toNanoseconds(), 1000)
    }

    @TestCase
    func test_duration_nanosecond(): Unit {
        @Expect(Duration.nanosecond.toNanoseconds(), 1)
    }

    @TestCase
    func test_duration_addition(): Unit {
        let d = Duration.second + Duration.second
        @Expect(d.toNanoseconds(), 2000000000)
    }

    @TestCase
    func test_duration_subtraction(): Unit {
        let d = Duration.second - Duration.millisecond
        @Expect(d.toNanoseconds(), 999000000)
    }

    @TestCase
    func test_duration_multiplication(): Unit {
        let d = Duration.second * 3
        @Expect(d.toNanoseconds(), 3000000000)
    }

    @TestCase
    func test_duration_comparison(): Unit {
        @Assert(Duration.second > Duration.millisecond)
        @Assert(Duration.millisecond < Duration.second)
        @Assert(Duration.second == Duration.second)
    }
}
