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
    // Rune case conversion can only return a single rune.
    @TestCase
    func specialUnicodeRuneApiShouldKeepMultiRuneMappingsUnchanged(): Unit {
        @Expect("\u{00DF}".toUpper(), "SS")
        @Expect(Rune(0x00DF).toUpperCase(), Rune(0x00DF))

        @Expect("\u{0149}".toUpper(), "\u{02BC}N")
        @Expect(Rune(0x0149).toUpperCase(), Rune(0x0149))
    }

    @TestCase
    func turkishDottedIRuneLowerShouldBeLocaleAware(): Unit {
        // U+0130 is LATIN CAPITAL LETTER I WITH DOT ABOVE
        // Default lowercase: U+0069 U+0307 (i + combining dot above)
        // TR/AZ lowercase: U+0069 (i) - dot is removed
        @Expect("\u{0130}".toLower(CasingOption.TR), "i")
        @Expect("\u{0130}".toLower(CasingOption.AZ), "i")
        @Expect(Rune(0x0130).toLowerCase(CasingOption.TR), Rune(0x0069))
        @Expect(Rune(0x0130).toLowerCase(CasingOption.AZ), Rune(0x0069))
        @Expect(Rune(0x0130).toLowerCase(), Rune(0x0130))
    }
    
    @TestCase
    func specialUnicodeRuneLowercaseShouldAlignWithString(): Unit {
        let rune = Rune(0x01C4)
        @Expect(rune.toLowerCase(), Rune(0x01C6))
    }
}
