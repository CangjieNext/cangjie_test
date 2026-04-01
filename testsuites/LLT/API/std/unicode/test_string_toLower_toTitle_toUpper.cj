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
let Sigma_Case: Array<String> = [
    "ΣΣΣ",
    "ΣΣς",
    "ΣΣσ",
    "ΣςΣ",
    "Σςς",
    "Σςσ",
    "ΣσΣ",
    "Σσς",
    "Σσσ",
    "ςΣΣ",
    "ςΣς",
    "ςΣσ",
    "ςςΣ",
    "ςςς",
    "ςςσ",
    "ςσΣ",
    "ςσς",
    "ςσσ",
    "σΣΣ",
    "σΣς",
    "σΣσ",
    "σςΣ",
    "σςς",
    "σςσ",
    "σσΣ",
    "σσς",
    "σσσ"
]
let Sigma_Case_Upper: Array<String> = [
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ"
]
let Sigma_Case_Title: Array<String> = [
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ",
    "ΣΣΣ"
]
let Sigma_Case_Lower: Array<String> = [
    "σσς",
    "σσς",
    "σσσ",
    "σςς",
    "σςς",
    "σςσ",
    "σσς",
    "σσς",
    "σσσ",
    "ςσς",
    "ςσς",
    "ςσσ",
    "ςςς",
    "ςςς",
    "ςςσ",
    "ςσς",
    "ςσς",
    "ςσσ",
    "σσς",
    "σσς",
    "σσσ",
    "σςς",
    "σςς",
    "σςσ",
    "σσς",
    "σσς",
    "σσσ"
]
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
class UnicodeStringTest {
    @TestCase
    func stringToLower(): Unit {
        for ((k, v) in SpecialUnicodeMap) {
            var runeArr = Rune(k).toString().toLower().toRuneArray()
            var temp = if (runeArr.size > v[0].size) {
                v[0].size
            } else {
                runeArr.size
            }
            for (i in 0..temp) {
                @Expect(UInt32(runeArr[i]), v[0][i])
            }
        }
    }

    @TestCase
    func stringToTitle(): Unit {
        for ((k, v) in SpecialUnicodeMap) {
            var runeArr = Rune(k).toString().toTitle().toRuneArray()
            var temp = if (runeArr.size > v[1].size) {
                v[1].size
            } else {
                runeArr.size
            }
            for (i in 0..temp) {
                @Expect(UInt32(runeArr[i]), v[1][i])
            }
        }
    }

    @TestCase
    func stringToUpper(): Unit {
        for ((k, v) in SpecialUnicodeMap) {
            var runeArr = Rune(k).toString().toUpper().toRuneArray()
            var temp = if (runeArr.size > v[2].size) {
                v[2].size
            } else {
                runeArr.size
            }
            for (i in 0..temp) {
                @Expect(UInt32(runeArr[i]), v[2][i])
            }
        }
    }

    @TestCase
    func sigmaToUpperTitleAndLower(): Unit {
        for (i in 0..Sigma_Case.size) {
            @Expect(Sigma_Case[i].toUpper(), Sigma_Case_Upper[i])
        }
        for (i in 0..Sigma_Case.size) {
            @Expect(Sigma_Case[i].toTitle(), Sigma_Case_Title[i])
        }
        for (i in 0..Sigma_Case.size) {
            @Expect(Sigma_Case[i].toLower(), Sigma_Case_Lower[i])
        }
        @Expect("φιλοσοφίαΣ".toLower(), "φιλοσοφίας")
        @Expect("φιλοσοφίαΣ.".toLower(), "φιλοσοφίας.")
        @Expect("φιλοΣσοφία".toLower(), "φιλοσσοφία")
    }

    @TestCase
    func stringToLowerWithPara(): Unit {
        for (op in CasingOptionOfAll) {
            for ((k, v) in SpecialUnicodeMap) {
                var runeArr = Rune(k).toString().toLower(op).toRuneArray()
                var temp = if (runeArr.size > v[0].size) {
                    v[0].size
                } else {
                    runeArr.size
                }
                for (i in 0..temp) {
                    @Expect(UInt32(runeArr[i]), v[0][i])
                }
            }
        }
    }

    @TestCase
    func stringToTitleWithPara(): Unit {
        for (op in CasingOptionOfAll) {
            for ((k, v) in SpecialUnicodeMap) {
                var runeArr = Rune(k).toString().toTitle(op).toRuneArray()
                var temp = if (runeArr.size > v[1].size) {
                    v[1].size
                } else {
                    runeArr.size
                }
                for (i in 0..temp) {
                    @Expect(UInt32(runeArr[i]), v[1][i])
                }
            }
        }
    }

    @TestCase
    func stringToUpperWithPara(): Unit {
        for (op in CasingOptionOfAll) {
            for ((k, v) in SpecialUnicodeMap) {
                var runeArr = Rune(k).toString().toUpper(op).toRuneArray()
                var temp = if (runeArr.size > v[2].size) {
                    v[2].size
                } else {
                    runeArr.size
                }
                for (i in 0..temp) {
                    @Expect(UInt32(runeArr[i]), v[2][i])
                }
            }
        }
    }

    @TestCase
    func sigmaToUpperTitleAndLowerWithPara(): Unit {
        for (op in CasingOptionOfAll) {
            for (i in 0..Sigma_Case.size) {
                @Expect(Sigma_Case[i].toUpper(op), Sigma_Case_Upper[i])
            }
            for (i in 0..Sigma_Case.size) {
                @Expect(Sigma_Case[i].toTitle(op), Sigma_Case_Title[i])
            }
            for (i in 0..Sigma_Case.size) {
                @Expect(Sigma_Case[i].toLower(op), Sigma_Case_Lower[i])
            }
            @Expect("φιλοσοφίαΣ".toLower(op), "φιλοσοφίας")
            @Expect("φιλοσοφίαΣ.".toLower(op), "φιλοσοφίας.")
            @Expect("φιλοΣσοφία".toLower(op), "φιλοσσοφία")
        }
    }

    @TestCase
    func easyCaseToUpperTitleAndLowerWithPara(): Unit {
        for (op in CasingOptionOfAll) {
            @Expect("ABc".toLower(op), "abc")
            @Expect("aBc.".toUpper(op), "ABC.")
            @Expect("aBc.".toTitle(op), "ABC.")
        }
    }

    @TestCase
    func toUpperTitleAndLowerWithLT(): Unit {
        for ((k, v) in LithuaniaSpecialCharacters) {
            var runeArr = Rune(k).toString().toLower(CasingOption.LT).toRuneArray()
            var temp = if (runeArr.size > v.size) {
                v.size
            } else {
                runeArr.size
            }
            for (i in 0..temp) {
                @Expect(UInt32(runeArr[i]), v[i])
            }
            @Expect(Rune(k).toString().toUpper(CasingOption.LT), Rune(k).toString())
            @Expect(Rune(k).toString().toTitle(CasingOption.LT), Rune(k).toString())
        }
    }

    @TestCase
    func toUpperTitleAndLowerWithAZTR(): Unit {
        var op = CasingOption.TR
        @Expect("\u{0130}".toLower(op), "\u{0069}\u{0307}")
        @Expect("\u{0049}".toLower(op), "\u{0131}")
        @Expect("\u{0049}\u{0307}".toLower(op), "\u{0069}")

        @Expect("\u{0130}".toUpper(op), "\u{0130}")
        @Expect("\u{0049}".toUpper(op), "\u{0049}")
        @Expect("\u{0069}".toUpper(op), "\u{0130}")

        @Expect("\u{0130}".toTitle(op), "\u{0130}")
        @Expect("\u{0049}".toTitle(op), "\u{0049}")
        @Expect("\u{0069}".toTitle(op), "\u{0130}")

        op = CasingOption.AZ
        @Expect("\u{0130}".toLower(op), "\u{0069}\u{0307}")
        @Expect("\u{0049}".toLower(op), "\u{0131}")
        @Expect("\u{0049}\u{0307}".toLower(op), "\u{0069}")

        @Expect("\u{0130}".toUpper(op), "\u{0130}")
        @Expect("\u{0049}".toUpper(op), "\u{0049}")
        @Expect("\u{0069}".toUpper(op), "\u{0130}")

        @Expect("\u{0130}".toTitle(op), "\u{0130}")
        @Expect("\u{0049}".toTitle(op), "\u{0049}")
        @Expect("\u{0069}".toTitle(op), "\u{0130}")
    }

    @TestCase
    func greekSigmaWithGreekExtended(): Unit {
        // HIGH-01b: sigma 后跟希腊扩展块字母
        // 希腊扩展块字母是希腊字母，所以 Σ 后跟希腊扩展块应该转换为 σ
        @Expect("Σἀ".toLower(), "σἀ")
        @Expect("Σἁ".toLower(), "σἁ")
        @Expect("Σἂ".toLower(), "σἂ")
        // σ 和 ς 保持不变
        @Expect("σἀ".toLower(), "σἀ")
        @Expect("σἁ".toLower(), "σἁ")
        @Expect("σἂ".toLower(), "σἂ")
    }

    @TestCase
    func greekSigmaPrecedingLetter(): Unit {
        // HIGH-01c: sigma 前面有字母字符时
        // Σ 后面没有希腊字母（字符串末尾），所以应该转换为 ς
        @Expect("αΣ".toLower(), "ας")
        @Expect("βΣ".toLower(), "βς")
        @Expect("γΣ".toLower(), "γς")
        // σ 和 ς 保持不变
        @Expect("ασ".toLower(), "ασ")
        @Expect("βσ".toLower(), "βσ")
        @Expect("γσ".toLower(), "γσ")
    }

    @TestCase
    func greekSigmaContextRules(): Unit {
        // 综合测试：sigma 上下文规则
        // sigma 后面有希腊字母 → σ
        @Expect("σα".toLower(), "σα")
        @Expect("σβ".toLower(), "σβ")
        @Expect("Σα".toLower(), "σα")
        @Expect("Σβ".toLower(), "σβ")
        
        // sigma 在字符串末尾 → ς（只有 Σ）
        @Expect("Σ".toLower(), "ς")
        // σ 和 ς 保持不变
        @Expect("σ".toLower(), "σ")
        @Expect("ς".toLower(), "ς")
        
        // sigma 后面有非希腊字符 → ς（只有 Σ）
        @Expect("Σa".toLower(), "ςa")
        @Expect("Σ1".toLower(), "ς1")
        // σ 和 ς 保持不变
        @Expect("σa".toLower(), "σa")
        @Expect("σ1".toLower(), "σ1")
        
        // sigma 后面有标点符号 → ς（只有 Σ）
        @Expect("Σ.".toLower(), "ς.")
        @Expect("Σ,".toLower(), "ς,")
        // σ 和 ς 保持不变
        @Expect("σ.".toLower(), "σ.")
        @Expect("σ,".toLower(), "σ,")
        
        // σσ 和 ςς 保持不变
        @Expect("σσ".toLower(), "σσ")
        @Expect("ςς".toLower(), "ςς")
    }
    
    @TestCase
    func greekSigmaWithCombiningMarksAndGreekExtended(): Unit {
        // 组合测试：组合标记 + 希腊扩展块
        // Σ 后面有希腊扩展块字母 → σ（跳过组合标记）
        @Expect("Σ\u{0301}ἀ".toLower(), "σ\u{0301}ἀ")
        // Σ 后面只有组合标记 → ς（组合标记不是希腊字母）
        @Expect("Σ\u{0301}".toLower(), "ς\u{0301}")
        @Expect("αΣ\u{0301}".toLower(), "ας\u{0301}")
        // σ 和 ς 保持不变
        @Expect("σ\u{0301}".toLower(), "σ\u{0301}")
        @Expect("ασ\u{0301}".toLower(), "ασ\u{0301}")
    }

    @TestCase
    func turkishIDotWithCombiningMarks(): Unit {
        // MEDIUM-02a: 土耳其语 I-dot 处理需要跳过中间的组合标记
        // I 后面跟着组合标记再跟 U+0307 (DOT ABOVE) 应该跳过组合标记找到 DOT ABOVE
        var op = CasingOption.TR
        // I + 组合标记 + DOT ABOVE → i（跳过组合标记找到 DOT ABOVE，跳过所有相关字符）
        @Expect("\u{0049}\u{0301}\u{0307}".toLower(op), "\u{0069}\u{0301}")
        @Expect("\u{0049}\u{0300}\u{0307}".toLower(op), "\u{0069}\u{0300}")
        @Expect("\u{0049}\u{0302}\u{0307}".toLower(op), "\u{0069}\u{0302}")
        // I + 组合标记（无 DOT ABOVE）→ ı（跳过组合标记，没找到 DOT ABOVE）
        @Expect("\u{0049}\u{0301}".toLower(op), "\u{0131}\u{0301}")
        @Expect("\u{0049}\u{0300}".toLower(op), "\u{0131}\u{0300}")
        // I + DOT ABOVE → i（原有行为，确保不破坏）
        @Expect("\u{0049}\u{0307}".toLower(op), "\u{0069}")
        // I 无 DOT ABOVE → ı（原有行为，确保不破坏）
        @Expect("\u{0049}".toLower(op), "\u{0131}")

        op = CasingOption.AZ
        // 阿塞拜疆语同样规则
        @Expect("\u{0049}\u{0301}\u{0307}".toLower(op), "\u{0069}\u{0301}")
        @Expect("\u{0049}\u{0300}\u{0307}".toLower(op), "\u{0069}\u{0300}")
        @Expect("\u{0049}\u{0301}".toLower(op), "\u{0131}\u{0301}")
        @Expect("\u{0049}\u{0307}".toLower(op), "\u{0069}")
        @Expect("\u{0049}".toLower(op), "\u{0131}")
    }

    @TestCase
    func specialUnicodeCaseConversionNoPanic(): Unit {
        // HIGH-03: 验证 SPECIAL_UNICODE_MAP 查找不会 panic
        // 测试特殊 Unicode 字符的大小写转换
        // ß (0x00DF) -> toUpper: "SS", toTitle: "Ss"
        @Expect(Rune(0x00DF).toString().toUpper(), "SS")
        @Expect(Rune(0x00DF).toString().toTitle(), "Ss")
        // ﬁ (0xFB01) -> toUpper: "FI", toTitle: "Fi"
        @Expect(Rune(0xFB01).toString().toUpper(), "FI")
        @Expect(Rune(0xFB01).toString().toTitle(), "Fi")
        // ᾀ (0x1F80) -> toUpper: "ἈΙ", toTitle: "ᾈ" (0x1F88)
        @Expect(Rune(0x1F80).toString().toUpper(), "\u{1F08}\u{0399}")
        @Expect(Rune(0x1F80).toString().toTitle(), "\u{1F88}")
        @Expect(Rune(0x1FBC).toString().toLower(), Rune(0x1FB3).toString())
        @Expect(Rune(0x1FBC).toString().toTitle(), Rune(0x1FBC).toString())
    }

    @TestCase
    func lithuaniaSpecialCaseConversionNoPanic(): Unit {
        // HIGH-03: 验证 LITHUANIA_SPECIAL_RUNE 查找不会 panic
        // 测试立陶宛语特殊字符的大小写转换
        // 立陶宛语规则：I -> i + combining dot above (0x0069, 0x0307)
        @Expect(Rune(0x0049).toString().toLower(CasingOption.LT), "\u{0069}\u{0307}")
        @Expect(Rune(0x004A).toString().toLower(CasingOption.LT), "\u{006A}\u{0307}")
        @Expect(Rune(0x012E).toString().toLower(CasingOption.LT), "\u{012F}\u{0307}")
        @Expect(Rune(0x00CC).toString().toLower(CasingOption.LT), "\u{0069}\u{0307}\u{0300}")
        @Expect(Rune(0x00CD).toString().toLower(CasingOption.LT), "\u{0069}\u{0307}\u{0301}")
        @Expect(Rune(0x0128).toString().toLower(CasingOption.LT), "\u{0069}\u{0307}\u{0303}")
    }
}