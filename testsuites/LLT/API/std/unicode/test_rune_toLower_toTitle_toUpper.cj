/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f --test
// EXEC: %run %run_opt %n.%suffix %run_args

import std.unicode.*
import std.collection.*

let SpecialUnicodeMap = HashMap<UInt32, (Array<UInt32>, Array<UInt32>, Array<UInt32>)>(
    [
        // Ligatures
        (0xFB00, ([0xFB00], [0x0046, 0x0066], [0x0046, 0x0046])), // LATIN SMALL LIGATURE FF
        (0xFB01, ([0xFB01], [0x0046, 0x0069], [0x0046, 0x0049])), // LATIN SMALL LIGATURE FI
        (0xFB02, ([0xFB02], [0x0046, 0x006C], [0x0046, 0x004C])), // LATIN SMALL LIGATURE FL
        (0xFB03, ([0xFB03], [0x0046, 0x0066, 0x0069], [0x0046, 0x0046, 0x0049])), // LATIN SMALL LIGATURE FFI
        (0xFB04, ([0xFB04], [0x0046, 0x0066, 0x006C], [0x0046, 0x0046, 0x004C])), // LATIN SMALL LIGATURE FFL
        (0xFB05, ([0xFB05], [0x0053, 0x0074], [0x0053, 0x0054])), // LATIN SMALL LIGATURE LONG S T
        (0xFB06, ([0xFB06], [0x0053, 0x0074], [0x0053, 0x0054])), // LATIN SMALL LIGATURE ST

        (0x0587, ([0x0587], [0x0535, 0x0582], [0x0535, 0x0552])), // ARMENIAN SMALL LIGATURE ECH YIWN
        (0xFB13, ([0xFB13], [0x0544, 0x0576], [0x0544, 0x0546])), // ARMENIAN SMALL LIGATURE MEN NOW
        (0xFB14, ([0xFB14], [0x0544, 0x0565], [0x0544, 0x0535])), // ARMENIAN SMALL LIGATURE MEN ECH
        (0xFB15, ([0xFB15], [0x0544, 0x056B], [0x0544, 0x053B])), // ARMENIAN SMALL LIGATURE MEN INI
        (0xFB16, ([0xFB16], [0x054E, 0x0576], [0x054E, 0x0546])), // ARMENIAN SMALL LIGATURE VEW NOW
        (0xFB17, ([0xFB17], [0x0544, 0x056D], [0x0544, 0x053D])), // ARMENIAN SMALL LIGATURE MEN XEH

        // No corresponding uppercase precomposed character
        (0x0149, ([0x0149], [0x02BC, 0x004E], [0x02BC, 0x004E])), // LATIN SMALL LETTER N PRECEDED BY APOSTROPHE
        (0x0390, ([0x0390], [0x0399, 0x0308, 0x0301], [0x0399, 0x0308, 0x0301])), // GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS
        (0x03B0, ([0x03B0], [0x03A5, 0x0308, 0x0301], [0x03A5, 0x0308, 0x0301])), // GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS
        (0x01F0, ([0x01F0], [0x004A, 0x030C], [0x004A, 0x030C])), // LATIN SMALL LETTER J WITH CARON
        (0x1E96, ([0x1E96], [0x0048, 0x0331], [0x0048, 0x0331])), // LATIN SMALL LETTER H WITH LINE BELOW
        (0x1E97, ([0x1E97], [0x0054, 0x0308], [0x0054, 0x0308])), // LATIN SMALL LETTER T WITH DIAERESIS
        (0x1E98, ([0x1E98], [0x0057, 0x030A], [0x0057, 0x030A])), // LATIN SMALL LETTER W WITH RING ABOVE
        (0x1E99, ([0x1E99], [0x0059, 0x030A], [0x0059, 0x030A])), // LATIN SMALL LETTER Y WITH RING ABOVE
        (0x1E9A, ([0x1E9A], [0x0041, 0x02BE], [0x0041, 0x02BE])), // LATIN SMALL LETTER A WITH RIGHT HALF RING
        (0x1F50, ([0x1F50], [0x03A5, 0x0313], [0x03A5, 0x0313])), // GREEK SMALL LETTER UPSILON WITH PSILI
        (0x1F52, ([0x1F52], [0x03A5, 0x0313, 0x0300], [0x03A5, 0x0313, 0x0300])), // GREEK SMALL LETTER UPSILON WITH PSILI AND VARIA
        (0x1F54, ([0x1F54], [0x03A5, 0x0313, 0x0301], [0x03A5, 0x0313, 0x0301])), // GREEK SMALL LETTER UPSILON WITH PSILI AND OXIA
        (0x1F56, ([0x1F56], [0x03A5, 0x0313, 0x0342], [0x03A5, 0x0313, 0x0342])), // GREEK SMALL LETTER UPSILON WITH PSILI AND PERISPOMENI
        (0x1FB6, ([0x1FB6], [0x0391, 0x0342], [0x0391, 0x0342])), // GREEK SMALL LETTER ALPHA WITH PERISPOMENI
        (0x1FC6, ([0x1FC6], [0x0397, 0x0342], [0x0397, 0x0342])), // GREEK SMALL LETTER ETA WITH PERISPOMENI
        (0x1FD2, ([0x1FD2], [0x0399, 0x0308, 0x0300], [0x0399, 0x0308, 0x0300])), // GREEK SMALL LETTER IOTA WITH DIALYTIKA AND VARIA
        (0x1FD3, ([0x1FD3], [0x0399, 0x0308, 0x0301], [0x0399, 0x0308, 0x0301])), // GREEK SMALL LETTER IOTA WITH DIALYTIKA AND OXIA
        (0x1FD6, ([0x1FD6], [0x0399, 0x0342], [0x0399, 0x0342])), // GREEK SMALL LETTER IOTA WITH PERISPOMENI
        (0x1FD7, ([0x1FD7], [0x0399, 0x0308, 0x0342], [0x0399, 0x0308, 0x0342])), // GREEK SMALL LETTER IOTA WITH DIALYTIKA AND PERISPOMENI
        (0x1FE2, ([0x1FE2], [0x03A5, 0x0308, 0x0300], [0x03A5, 0x0308, 0x0300])), // GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND VARIA
        (0x1FE3, ([0x1FE3], [0x03A5, 0x0308, 0x0301], [0x03A5, 0x0308, 0x0301])), // GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND OXIA
        (0x1FE4, ([0x1FE4], [0x03A1, 0x0313], [0x03A1, 0x0313])), // GREEK SMALL LETTER RHO WITH PSILI
        (0x1FE6, ([0x1FE6], [0x03A5, 0x0342], [0x03A5, 0x0342])), // GREEK SMALL LETTER UPSILON WITH PERISPOMENI
        (0x1FE7, ([0x1FE7], [0x03A5, 0x0308, 0x0342], [0x03A5, 0x0308, 0x0342])), // GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND PERISPOMENI
        (0x1FF6, ([0x1FF6], [0x03A9, 0x0342], [0x03A9, 0x0342])), // GREEK SMALL LETTER OMEGA WITH PERISPOMENI

        // All letters with YPOGEGRAMMENI (iota-subscript) or PROSGEGRAMMENI (iota adscript)
        // have special uppercases.
        // Note: characters with PROSGEGRAMMENI are actually titlecase, not uppercase!
        (0x1F80, ([0x1F80], [0x1F88], [0x1F08, 0x0399])), // GREEK SMALL LETTER ALPHA WITH PSILI AND YPOGEGRAMMENI
        (0x1F81, ([0x1F81], [0x1F89], [0x1F09, 0x0399])), // GREEK SMALL LETTER ALPHA WITH DASIA AND YPOGEGRAMMENI
        (0x1F82, ([0x1F82], [0x1F8A], [0x1F0A, 0x0399])), // GREEK SMALL LETTER ALPHA WITH PSILI AND VARIA AND YPOGEGRAMMENI
        (0x1F83, ([0x1F83], [0x1F8B], [0x1F0B, 0x0399])), // GREEK SMALL LETTER ALPHA WITH DASIA AND VARIA AND YPOGEGRAMMENI
        (0x1F84, ([0x1F84], [0x1F8C], [0x1F0C, 0x0399])), // GREEK SMALL LETTER ALPHA WITH PSILI AND OXIA AND YPOGEGRAMMENI
        (0x1F85, ([0x1F85], [0x1F8D], [0x1F0D, 0x0399])), // GREEK SMALL LETTER ALPHA WITH DASIA AND OXIA AND YPOGEGRAMMENI
        (0x1F86, ([0x1F86], [0x1F8E], [0x1F0E, 0x0399])), // GREEK SMALL LETTER ALPHA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI
        (0x1F87, ([0x1F87], [0x1F8F], [0x1F0F, 0x0399])), // GREEK SMALL LETTER ALPHA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI
        (0x1F88, ([0x1F80], [0x1F88], [0x1F08, 0x0399])), // GREEK CAPITAL LETTER ALPHA WITH PSILI AND PROSGEGRAMMENI
        (0x1F89, ([0x1F81], [0x1F89], [0x1F09, 0x0399])), // GREEK CAPITAL LETTER ALPHA WITH DASIA AND PROSGEGRAMMENI
        (0x1F8A, ([0x1F82], [0x1F8A], [0x1F0A, 0x0399])), // GREEK CAPITAL LETTER ALPHA WITH PSILI AND VARIA AND PROSGEGRAMMENI
        (0x1F8B, ([0x1F83], [0x1F8B], [0x1F0B, 0x0399])), // GREEK CAPITAL LETTER ALPHA WITH DASIA AND VARIA AND PROSGEGRAMMENI
        (0x1F8C, ([0x1F84], [0x1F8C], [0x1F0C, 0x0399])), // GREEK CAPITAL LETTER ALPHA WITH PSILI AND OXIA AND PROSGEGRAMMENI
        (0x1F8D, ([0x1F85], [0x1F8D], [0x1F0D, 0x0399])), // GREEK CAPITAL LETTER ALPHA WITH DASIA AND OXIA AND PROSGEGRAMMENI
        (0x1F8E, ([0x1F86], [0x1F8E], [0x1F0E, 0x0399])), // GREEK CAPITAL LETTER ALPHA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI
        (0x1F8F, ([0x1F87], [0x1F8F], [0x1F0F, 0x0399])), // GREEK CAPITAL LETTER ALPHA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI
        (0x1F90, ([0x1F90], [0x1F98], [0x1F28, 0x0399])), // GREEK SMALL LETTER ETA WITH PSILI AND YPOGEGRAMMENI
        (0x1F91, ([0x1F91], [0x1F99], [0x1F29, 0x0399])), // GREEK SMALL LETTER ETA WITH DASIA AND YPOGEGRAMMENI
        (0x1F92, ([0x1F92], [0x1F9A], [0x1F2A, 0x0399])), // GREEK SMALL LETTER ETA WITH PSILI AND VARIA AND YPOGEGRAMMENI
        (0x1F93, ([0x1F93], [0x1F9B], [0x1F2B, 0x0399])), // GREEK SMALL LETTER ETA WITH DASIA AND VARIA AND YPOGEGRAMMENI
        (0x1F94, ([0x1F94], [0x1F9C], [0x1F2C, 0x0399])), // GREEK SMALL LETTER ETA WITH PSILI AND OXIA AND YPOGEGRAMMENI
        (0x1F95, ([0x1F95], [0x1F9D], [0x1F2D, 0x0399])), // GREEK SMALL LETTER ETA WITH DASIA AND OXIA AND YPOGEGRAMMENI
        (0x1F96, ([0x1F96], [0x1F9E], [0x1F2E, 0x0399])), // GREEK SMALL LETTER ETA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI
        (0x1F97, ([0x1F97], [0x1F9F], [0x1F2F, 0x0399])), // GREEK SMALL LETTER ETA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI
        (0x1F98, ([0x1F90], [0x1F98], [0x1F28, 0x0399])), // GREEK CAPITAL LETTER ETA WITH PSILI AND PROSGEGRAMMENI
        (0x1F99, ([0x1F91], [0x1F99], [0x1F29, 0x0399])), // GREEK CAPITAL LETTER ETA WITH DASIA AND PROSGEGRAMMENI
        (0x1F9A, ([0x1F92], [0x1F9A], [0x1F2A, 0x0399])), // GREEK CAPITAL LETTER ETA WITH PSILI AND VARIA AND PROSGEGRAMMENI
        (0x1F9B, ([0x1F93], [0x1F9B], [0x1F2B, 0x0399])), // GREEK CAPITAL LETTER ETA WITH DASIA AND VARIA AND PROSGEGRAMMENI
        (0x1F9C, ([0x1F94], [0x1F9C], [0x1F2C, 0x0399])), // GREEK CAPITAL LETTER ETA WITH PSILI AND OXIA AND PROSGEGRAMMENI
        (0x1F9D, ([0x1F95], [0x1F9D], [0x1F2D, 0x0399])), // GREEK CAPITAL LETTER ETA WITH DASIA AND OXIA AND PROSGEGRAMMENI
        (0x1F9E, ([0x1F96], [0x1F9E], [0x1F2E, 0x0399])), // GREEK CAPITAL LETTER ETA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI
        (0x1F9F, ([0x1F97], [0x1F9F], [0x1F2F, 0x0399])), // GREEK CAPITAL LETTER ETA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI
        (0x1FA0, ([0x1FA0], [0x1FA8], [0x1F68, 0x0399])), // GREEK SMALL LETTER OMEGA WITH PSILI AND YPOGEGRAMMENI
        (0x1FA1, ([0x1FA1], [0x1FA9], [0x1F69, 0x0399])), // GREEK SMALL LETTER OMEGA WITH DASIA AND YPOGEGRAMMENI
        (0x1FA2, ([0x1FA2], [0x1FAA], [0x1F6A, 0x0399])), // GREEK SMALL LETTER OMEGA WITH PSILI AND VARIA AND YPOGEGRAMMENI
        (0x1FA3, ([0x1FA3], [0x1FAB], [0x1F6B, 0x0399])), // GREEK SMALL LETTER OMEGA WITH DASIA AND VARIA AND YPOGEGRAMMENI
        (0x1FA4, ([0x1FA4], [0x1FAC], [0x1F6C, 0x0399])), // GREEK SMALL LETTER OMEGA WITH PSILI AND OXIA AND YPOGEGRAMMENI
        (0x1FA5, ([0x1FA5], [0x1FAD], [0x1F6D, 0x0399])), // GREEK SMALL LETTER OMEGA WITH DASIA AND OXIA AND YPOGEGRAMMENI
        (0x1FA6, ([0x1FA6], [0x1FAE], [0x1F6E, 0x0399])), // GREEK SMALL LETTER OMEGA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI
        (0x1FA7, ([0x1FA7], [0x1FAF], [0x1F6F, 0x0399])), // GREEK SMALL LETTER OMEGA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI
        (0x1FA8, ([0x1FA0], [0x1FA8], [0x1F68, 0x0399])), // GREEK CAPITAL LETTER OMEGA WITH PSILI AND PROSGEGRAMMENI
        (0x1FA9, ([0x1FA1], [0x1FA9], [0x1F69, 0x0399])), // GREEK CAPITAL LETTER OMEGA WITH DASIA AND PROSGEGRAMMENI
        (0x1FAA, ([0x1FA2], [0x1FAA], [0x1F6A, 0x0399])), // GREEK CAPITAL LETTER OMEGA WITH PSILI AND VARIA AND PROSGEGRAMMENI
        (0x1FAB, ([0x1FA3], [0x1FAB], [0x1F6B, 0x0399])), // GREEK CAPITAL LETTER OMEGA WITH DASIA AND VARIA AND PROSGEGRAMMENI
        (0x1FAC, ([0x1FA4], [0x1FAC], [0x1F6C, 0x0399])), // GREEK CAPITAL LETTER OMEGA WITH PSILI AND OXIA AND PROSGEGRAMMENI
        (0x1FAD, ([0x1FA5], [0x1FAD], [0x1F6D, 0x0399])), // GREEK CAPITAL LETTER OMEGA WITH DASIA AND OXIA AND PROSGEGRAMMENI
        (0x1FAE, ([0x1FA6], [0x1FAE], [0x1F6E, 0x0399])), // GREEK CAPITAL LETTER OMEGA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI
        (0x1FAF, ([0x1FA7], [0x1FAF], [0x1F6F, 0x0399])), // GREEK CAPITAL LETTER OMEGA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI
        (0x1FB3, ([0x1FB3], [0x1FBC], [0x0391, 0x0399])), // GREEK SMALL LETTER ALPHA WITH YPOGEGRAMMENI
        (0x1FBC, ([0x1FB3], [0x1FBC], [0x0391, 0x0399])), // GREEK CAPITAL LETTER ALPHA WITH PROSGEGRAMMENI
        (0x1FC3, ([0x1FC3], [0x1FCC], [0x0397, 0x0399])), // GREEK SMALL LETTER ETA WITH YPOGEGRAMMENI
        (0x1FCC, ([0x1FC3], [0x1FCC], [0x0397, 0x0399])), // GREEK CAPITAL LETTER ETA WITH PROSGEGRAMMENI
        (0x1FF3, ([0x1FF3], [0x1FFC], [0x03A9, 0x0399])), // GREEK SMALL LETTER OMEGA WITH YPOGEGRAMMENI
        (0x1FFC, ([0x1FF3], [0x1FFC], [0x03A9, 0x0399])), // GREEK CAPITAL LETTER OMEGA WITH PROSGEGRAMMENI

        // Some characters with YPOGEGRAMMENI also have no corresponding titlecases

        (0x1FB2, ([0x1FB2], [0x1FBA, 0x0345], [0x1FBA, 0x0399])), // GREEK SMALL LETTER ALPHA WITH VARIA AND YPOGEGRAMMENI
        (0x1FB4, ([0x1FB4], [0x0386, 0x0345], [0x0386, 0x0399])), // GREEK SMALL LETTER ALPHA WITH OXIA AND YPOGEGRAMMENI
        (0x1FC2, ([0x1FC2], [0x1FCA, 0x0345], [0x1FCA, 0x0399])), // GREEK SMALL LETTER ETA WITH VARIA AND YPOGEGRAMMENI
        (0x1FC4, ([0x1FC4], [0x0389, 0x0345], [0x0389, 0x0399])), // GREEK SMALL LETTER ETA WITH OXIA AND YPOGEGRAMMENI
        (0x1FF2, ([0x1FF2], [0x1FFA, 0x0345], [0x1FFA, 0x0399])), // GREEK SMALL LETTER OMEGA WITH VARIA AND YPOGEGRAMMENI
        (0x1FF4, ([0x1FF4], [0x038F, 0x0345], [0x038F, 0x0399])), // GREEK SMALL LETTER OMEGA WITH OXIA AND YPOGEGRAMMENI

        (0x1FB7, ([0x1FB7], [0x0391, 0x0342, 0x0345], [0x0391, 0x0342, 0x0399])), // GREEK SMALL LETTER ALPHA WITH PERISPOMENI AND YPOGEGRAMMENI
        (0x1FC7, ([0x1FC7], [0x0397, 0x0342, 0x0345], [0x0397, 0x0342, 0x0399])), // GREEK SMALL LETTER ETA WITH PERISPOMENI AND YPOGEGRAMMENI
        (0x1FF7, ([0x1FF7], [0x03A9, 0x0342, 0x0345], [0x03A9, 0x0342, 0x0399])) // GREEK SMALL LETTER OMEGA WITH PERISPOMENI AND YPOGEGRAMMENI
    ]
)
let Sigma_Upper: UInt32 = 0x03A3
let Sigma_Lower: UInt32 = 0x03C3
let Sigma_Lower_End: UInt32 = 0x03C2
let CasingOptionOfAll: Array<CasingOption> = [CasingOption.TR, CasingOption.AZ, CasingOption.LT, CasingOption.Other]
let LithuaniaSpecialCharacters = HashMap<UInt32, Array<UInt32>>(
    [
        (0x0049, [0x0069, 0x0307]),
        (0x004A, [0x006A, 0x0307]),
        (0x012E, [0x012F, 0x0307]),
        (0x00CC, [0x0069, 0x0307, 0x0300]),
        (0x00CD, [0x0069, 0x0307, 0x0301]),
        (0x0128, [0x0069, 0x0307, 0x0303])
    ]
)

@Test
class UnicodeRuneTest {
    @TestCase
    func runeToLower(): Unit {
        for ((k, v) in SpecialUnicodeMap) {
            var runeArr = Rune(k).toLowerCase()
            if (v[0].size == 1) {
                @Expect(UInt32(runeArr), v[0][0])
            } else {
                @Expect(UInt32(k), UInt32(runeArr))
            }
        }
    }

    @TestCase
    func runeToTitle(): Unit {
        for ((k, v) in SpecialUnicodeMap) {
            var runeArr = Rune(k).toTitleCase()
            if (v[1].size == 1) {
                @Expect(UInt32(runeArr), v[1][0])
            } else {
                @Expect(UInt32(k), UInt32(runeArr))
            }
        }
    }

    @TestCase
    func runeToUpper(): Unit {
        for ((k, v) in SpecialUnicodeMap) {
            var runeArr = Rune(k).toUpperCase()
            if (v[2].size == 1) {
                @Expect(UInt32(runeArr), v[2][0])
            } else {
                @Expect(UInt32(k), UInt32(runeArr))
            }
        }
    }

    @TestCase
    func sigmaToUpperTitleAndLower(): Unit {
        @Expect(r"\u{03A3}".toLowerCase(), r"\u{03C3}")
        @Expect(r"\u{03C3}".toLowerCase(), r"\u{03C3}")
        @Expect(r"\u{03C2}".toLowerCase(), r"\u{03C2}")

        @Expect(r"\u{03A3}".toTitleCase(), r"\u{03A3}")
        @Expect(r"\u{03C3}".toTitleCase(), r"\u{03A3}")
        @Expect(r"\u{03C2}".toTitleCase(), r"\u{03A3}")

        @Expect(r"\u{03A3}".toUpperCase(), r"\u{03A3}")
        @Expect(r"\u{03C3}".toUpperCase(), r"\u{03A3}")
        @Expect(r"\u{03C2}".toUpperCase(), r"\u{03A3}")
    }

    @TestCase
    func runeToLowerWithPara(): Unit {
        for (op in CasingOptionOfAll) {
            for ((k, v) in SpecialUnicodeMap) {
                var runeArr = Rune(k).toLowerCase(op)
                if (v[0].size == 1) {
                    @Expect(UInt32(runeArr), v[0][0])
                } else {
                    @Expect(UInt32(k), UInt32(runeArr))
                }
            }
        }
    }

    @TestCase
    func runeToTitleWithPara(): Unit {
        for (op in CasingOptionOfAll) {
            for ((k, v) in SpecialUnicodeMap) {
                var runeArr = Rune(k).toTitleCase(op)
                if (v[1].size == 1) {
                    @Expect(UInt32(runeArr), v[1][0])
                } else {
                    @Expect(UInt32(k), UInt32(runeArr))
                }
            }
        }
    }

    @TestCase
    func runeToUpperWithPara(): Unit {
        for (op in CasingOptionOfAll) {
            for ((k, v) in SpecialUnicodeMap) {
                var runeArr = Rune(k).toUpperCase(op)
                if (v[2].size == 1) {
                    @Expect(UInt32(runeArr), v[2][0])
                } else {
                    @Expect(UInt32(k), UInt32(runeArr))
                }
            }
        }
    }

    @TestCase
    func sigmaToUpperTitleAndLowerWithPara(): Unit {
        for (op in CasingOptionOfAll) {
            @Expect(r"\u{03A3}".toLowerCase(op), r"\u{03C3}")
            @Expect(r"\u{03C3}".toLowerCase(op), r"\u{03C3}")
            @Expect(r"\u{03C2}".toLowerCase(op), r"\u{03C2}")

            @Expect(r"\u{03A3}".toTitleCase(op), r"\u{03A3}")
            @Expect(r"\u{03C3}".toTitleCase(op), r"\u{03A3}")
            @Expect(r"\u{03C2}".toTitleCase(op), r"\u{03A3}")

            @Expect(r"\u{03A3}".toUpperCase(op), r"\u{03A3}")
            @Expect(r"\u{03C3}".toUpperCase(op), r"\u{03A3}")
            @Expect(r"\u{03C2}".toUpperCase(op), r"\u{03A3}")
        }
    }

    @TestCase
    func toUpperTitleAndLowerWithLT(): Unit {
        for ((k, v) in LithuaniaSpecialCharacters) {
            @Expect(Rune(k).toUpperCase(CasingOption.LT), Rune(k))
            @Expect(Rune(k).toTitleCase(CasingOption.LT), Rune(k))
        }
    }

    @TestCase
    func toUpperTitleAndLowerWithAZTR(): Unit {
        var op = CasingOption.TR
        @Expect(r"\u{0130}".toLowerCase(op), r"\u{0130}")
        @Expect(r"\u{0131}".toLowerCase(op), r"\u{0131}")
        @Expect(r"\u{0069}".toLowerCase(op), r"\u{0069}")
        @Expect(r"\u{0049}".toLowerCase(op), r"\u{0131}")

        @Expect(r"\u{0130}".toTitleCase(op), r"\u{0130}")
        @Expect(r"\u{0131}".toTitleCase(op), r"\u{0049}")
        @Expect(r"\u{0069}".toTitleCase(op), r"\u{0130}")
        @Expect(r"\u{0049}".toTitleCase(op), r"\u{0049}")

        @Expect(r"\u{0130}".toUpperCase(op), r"\u{0130}")
        @Expect(r"\u{0131}".toUpperCase(op), r"\u{0049}")
        @Expect(r"\u{0069}".toUpperCase(op), r"\u{0130}")
        @Expect(r"\u{0049}".toUpperCase(op), r"\u{0049}")

        op = CasingOption.AZ
        @Expect(r"\u{0130}".toLowerCase(op), r"\u{0130}")
        @Expect(r"\u{0131}".toLowerCase(op), r"\u{0131}")
        @Expect(r"\u{0069}".toLowerCase(op), r"\u{0069}")
        @Expect(r"\u{0049}".toLowerCase(op), r"\u{0131}")

        @Expect(r"\u{0130}".toTitleCase(op), r"\u{0130}")
        @Expect(r"\u{0131}".toTitleCase(op), r"\u{0049}")
        @Expect(r"\u{0069}".toTitleCase(op), r"\u{0130}")
        @Expect(r"\u{0049}".toTitleCase(op), r"\u{0049}")

        @Expect(r"\u{0130}".toUpperCase(op), r"\u{0130}")
        @Expect(r"\u{0131}".toUpperCase(op), r"\u{0049}")
        @Expect(r"\u{0069}".toUpperCase(op), r"\u{0130}")
        @Expect(r"\u{0049}".toUpperCase(op), r"\u{0049}")
    }

    @TestCase
    func caseConversionWithLargeOffset(): Unit {
        @Expect(r"\u{025C}".toUpperCase(), r"\u{A7AB}")
        @Expect(r"\u{0261}".toUpperCase(), r"\u{A7AC}")
        @Expect(r"\u{0265}".toUpperCase(), r"\u{A78D}")
        @Expect(r"\u{023A}".toLowerCase(), r"\u{2C65}")
        @Expect(r"\u{13A0}".toLowerCase(), r"\u{AB70}")
        @Expect(r"\u{10A0}".toLowerCase(), r"\u{2D00}")
        @Expect(r"\u{1C88}".toUpperCase(), r"\u{A64A}")
        @Expect(r"\u{1D79}".toUpperCase(), r"\u{A77D}")
    }

    @TestCase
    func specialUnicodeCaseConversionNoPanic(): Unit {
        @Expect(Rune(0x00DF).toUpperCase(), Rune(0x00DF))
        @Expect(Rune(0x00DF).toTitleCase(), Rune(0x00DF))
        @Expect(Rune(0xFB01).toUpperCase(), Rune(0xFB01))
        @Expect(Rune(0xFB01).toTitleCase(), Rune(0xFB01))
        @Expect(Rune(0x1F80).toUpperCase(), Rune(0x1F80))
        @Expect(Rune(0x1F80).toTitleCase(), Rune(0x1F88))
        @Expect(Rune(0x1FBC).toLowerCase(), Rune(0x1FB3))
        @Expect(Rune(0x1FBC).toTitleCase(), Rune(0x1FBC))
    }

    @TestCase
    func lithuaniaSpecialCaseConversionNoPanic(): Unit {
        @Expect(Rune(0x0049).toLowerCase(CasingOption.LT), Rune(0x0069))
        @Expect(Rune(0x004A).toLowerCase(CasingOption.LT), Rune(0x006A))
        @Expect(Rune(0x012E).toLowerCase(CasingOption.LT), Rune(0x012F))
        @Expect(Rune(0x00CC).toLowerCase(CasingOption.LT), Rune(0x00EC))
        @Expect(Rune(0x00CD).toLowerCase(CasingOption.LT), Rune(0x00ED))
        @Expect(Rune(0x0128).toLowerCase(CasingOption.LT), Rune(0x0129))
    }

    @TestCase
    func unicode14CaseMapping(): Unit {
        @Expect(Rune(0xA7B8).toLowerCase(), Rune(0xA7B9))
        @Expect(Rune(0xA7B9).toUpperCase(), Rune(0xA7B8))
        @Expect(Rune(0xA7B9).toTitleCase(), Rune(0xA7B8))
        @Expect(Rune(0xA7BA).toLowerCase(), Rune(0xA7BB))
        @Expect(Rune(0xA7BB).toUpperCase(), Rune(0xA7BA))
        @Expect(Rune(0xA7BB).toTitleCase(), Rune(0xA7BA))
        @Expect(Rune(0xA7BC).toLowerCase(), Rune(0xA7BD))
        @Expect(Rune(0xA7BD).toUpperCase(), Rune(0xA7BC))
        @Expect(Rune(0xA7BD).toTitleCase(), Rune(0xA7BC))
        @Expect(Rune(0xA7BE).toLowerCase(), Rune(0xA7BF))
        @Expect(Rune(0xA7BF).toUpperCase(), Rune(0xA7BE))
        @Expect(Rune(0xA7BF).toTitleCase(), Rune(0xA7BE))
        @Expect(Rune(0xA7C0).toLowerCase(), Rune(0xA7C1))
        @Expect(Rune(0xA7C1).toUpperCase(), Rune(0xA7C0))
        @Expect(Rune(0xA7C1).toTitleCase(), Rune(0xA7C0))
        @Expect(Rune(0xA7C2).toLowerCase(), Rune(0xA7C3))
        @Expect(Rune(0xA7C3).toUpperCase(), Rune(0xA7C2))
        @Expect(Rune(0xA7C3).toTitleCase(), Rune(0xA7C2))
    }

    @TestCase
    func unicode14SpecialCaseMapping(): Unit {
        @Expect(Rune(0xA7C4).toLowerCase(), Rune(0xA794))
        @Expect(Rune(0xA7C4).toTitleCase(), Rune(0xA7C4))
        @Expect(Rune(0xA7C5).toLowerCase(), Rune(0x0282))
        @Expect(Rune(0xA7C5).toTitleCase(), Rune(0xA7C5))
        @Expect(Rune(0xA7C6).toLowerCase(), Rune(0x1D8E))
        @Expect(Rune(0xA7C6).toTitleCase(), Rune(0xA7C6))
    }

    @TestCase
    func unicode15CaseMapping(): Unit {
        @Expect(Rune(0xA7C7).toLowerCase(), Rune(0xA7C8))
        @Expect(Rune(0xA7C8).toUpperCase(), Rune(0xA7C7))
        @Expect(Rune(0xA7C8).toTitleCase(), Rune(0xA7C7))
        @Expect(Rune(0xA7C9).toLowerCase(), Rune(0xA7CA))
        @Expect(Rune(0xA7CA).toUpperCase(), Rune(0xA7C9))
        @Expect(Rune(0xA7CA).toTitleCase(), Rune(0xA7C9))
    }
}
