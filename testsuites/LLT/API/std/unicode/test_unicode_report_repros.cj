/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f --test
// EXEC: %run %run_opt %n.%suffix %run_args

import std.unicode.*

@Test
class UnicodeReportReproTest {
    // Covers: std.unicode HIGH-01 - Rune SPECIAL_UNICODE should lookup special case table
    @TestCase
    func specialUnicodeRuneApiShouldAlignWithUpperMapping(): Unit {
        // String level: ß (U+00DF) uppercases to "SS"
        @Expect("\u{00DF}".toUpper(), "SS")
        // Rune level: now correctly returns first character of special case mapping
        // U+00DF upper case special mapping is [U+0053, U+0053] = "SS"
        // Rune level should now return U+0053 (first character)
        @Expect(Rune(0x00DF).toUpperCase(), Rune(0x0053))

        // String level: ŉ (U+0149) uppercases to "ʼN"
        @Expect("\u{0149}".toUpper(), "\u{02BC}N")
        // Rune level: now correctly returns first character
        // U+0149 upper case special mapping is [U+02BC, U+004E]
        @Expect(Rune(0x0149).toUpperCase(), Rune(0x02BC))
    }

    // Covers: std.unicode HIGH-02 - U+0130 (İ) lowercase should work correctly
    @TestCase
    func turkishDottedIRuneLowerShouldBeLocaleAware(): Unit {
        // U+0130 is LATIN CAPITAL LETTER I WITH DOT ABOVE
        // Default lowercase: U+0069 U+0307 (i + combining dot above)
        // TR/AZ lowercase: U+0069 (i) - dot is removed
        
        // String level tests
        @Expect("\u{0130}".toLower(CasingOption.TR), "i")
        @Expect("\u{0130}".toLower(CasingOption.AZ), "i")
        
        // Rune level: now correctly uses special case table for SPECIAL_UNICODE
        // U+0130 has lower = SPECIAL_UNICODE, so it should lookup special case
        // Special case for U+0130 default lower: [U+0069, U+0307]
        // TR/AZ special case: [U+0069]
        @Expect(Rune(0x0130).toLowerCase(CasingOption.TR), Rune(0x0069))
        @Expect(Rune(0x0130).toLowerCase(CasingOption.AZ), Rune(0x0069))
        // Default locale should return first char of special mapping (i)
        @Expect(Rune(0x0130).toLowerCase(), Rune(0x0069))
    }
    
    // Covers: std.unicode HIGH-01 - verify lowercase SPECIAL_UNICODE handling
    @TestCase
    func specialUnicodeRuneLowercaseShouldAlignWithString(): Unit {
        // Test that Rune lowercase now properly handles SPECIAL_UNICODE cases
        // by looking up the special case table
        
        // U+03A3 (Σ) - uppercase sigma
        // Lowercase is U+03C3 (σ) in most contexts, U+03C2 (ς) at word end
        // This is handled via UPPERLOWER pattern, not SPECIAL_UNICODE
        
        // Test a SPECIAL_UNICODE case: U+01C4 (ǅ) 
        // Lowercase special mapping: [U+01C6] = ǆ
        let rune = Rune(0x01C4)
        @Expect(rune.toLowerCase(), Rune(0x01C6))
    }
}