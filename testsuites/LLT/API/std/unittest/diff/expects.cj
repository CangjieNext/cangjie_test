/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let a = "Please, give me the apple"
        let b = "Please, Give me an apple"
        @Expect(a, b)
        let a1 = 0.2000001 + 0.1
        let b1 = 0.3
        @Expect(a1, b1)
        let a2 = ArrayList.of("a", "bl", "ppqer", "test55", "test5")
        let b2 = ArrayList.of("a55", "b", "ppqzr", "test65", "test55")
        @Expect(a2, b2)
        let a3 = "test\napple\norange\nqiwi"
        let b3 = "apple\norafnge34\nqiwi"
        @Expect(a3, b3)
        let x: Array<(String, String)> = [("0", "0"), ("1", "1"), ("2", "2"), ("3", "3"), ("4", "4"), ("5", "5"),
            ("6", "6"), ("7", "7"), ("8", "8"), ("9", "9"), ("10", "10"), ("11", "11"), ("12", "12"), ("13", "13"),
            ("14", "14"), ("15", "15"), ("16", "16"), ("17", "17"), ("18", "18"), ("19", "19"), ("20", "20"),
            ("21", "21"), ("22", "22"), ("23", "23"), ("24", "24"), ("25", "25"), ("26", "26"), ("27", "27"),
            ("28", "28"), ("29", "29"), ("30", "30"), ("31", "31"), ("32", "32"), ("33", "33"), ("34", "34"),
            ("35", "35"), ("36", "36"), ("37", "37"), ("38", "38"), ("39", "39"), ("40", "40"), ("41", "41"),
            ("42", "42"), ("43", "43"), ("44", "44"), ("45", "45"), ("46", "46"), ("47", "47"), ("48", "48"),
            ("49", "49"), ("50", "50"), ("51", "51"), ("52", "52"), ("53", "53"), ("54", "54"), ("55", "55"),
            ("56", "56"), ("57", "57"), ("58", "58"), ("59", "59")]
        let a4 = HashMap(x)
        let b4 = HashMap(
            [("60", "61"), ("61", "68"), ("62", "63"), ("63", "61"), ("64", "65"), ("65", "66"), ("66", "67"),
                ("67", "68"), ("69", "60"), ("70", "71"), ("71", "78"), ("72", "73"), ("73", "71"), ("74", "75"),
                ("75", "76"), ("76", "77"), ("77", "78"), ("79", "70"), ("80", "81"), ("81", "88"), ("82", "83"),
                ("83", "81"), ("84", "85"), ("85", "86"), ("86", "87"), ("87", "88"), ("89", "80"), ("90", "91"),
                ("91", "98"), ("92", "93"), ("93", "91"), ("94", "95"), ("95", "96"), ("96", "97"), ("97", "98"),
                ("99", "90"), ("190", "191"), ("191", "198"), ("192", "193"), ("193", "191"), ("194", "195"),
                ("195", "196"), ("196", "197"), ("197", "198"), ("199", "190"), ("290", "291"), ("291", "298"),
                ("292", "293"), ("293", "291"), ("294", "295"), ("295", "296"), ("296", "297"), ("297", "298"),
                ("299", "290")])
        @Expect(a4, b4)
    }
}

/* SCAN-IN
    Expect Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "Please, {COLOR=YELLOW}g{/COLOR}ive me {COLOR=RED}t{/COLOR}{COLOR=YELLOW}he{/COLOR} apple"
        b: "Please, {COLOR=YELLOW}G{/COLOR}ive me {COLOR=RED}·{/COLOR}{COLOR=YELLOW}an{/COLOR} apple"
            ========{COLOR=YELLOW}!{/COLOR}======={COLOR=RED}-{/COLOR}{COLOR=YELLOW}!!{/COLOR}======

    Expect Failed: {COLOR=YELLOW}a1{/COLOR} != {COLOR=YELLOW}b1{/COLOR}
        a1: 0.3{COLOR=RED}000001{/COLOR}
        b1: 0.3{COLOR=RED}{/COLOR}
     delta: {COLOR=YELLOW}1e-07{/COLOR}

    Expect Failed: 
        Different elements (left - a2, right - b2):
            [0]: "{COLOR=YELLOW}a{/COLOR}" != "{COLOR=YELLOW}a55{/COLOR}"
            [1]: "{COLOR=YELLOW}bl{/COLOR}" != "{COLOR=YELLOW}b{/COLOR}"
            [2]: "{COLOR=YELLOW}ppqer{/COLOR}" != "{COLOR=YELLOW}ppqzr{/COLOR}"
            [3]:
                a2: "test{COLOR=YELLOW}5{/COLOR}5"
                b2: "test{COLOR=YELLOW}6{/COLOR}5"
                     ===={COLOR=YELLOW}!{/COLOR}=
            [4]:
                a2: "test{COLOR=GREEN}·{/COLOR}5"
                b2: "test{COLOR=GREEN}5{/COLOR}5"
                     ===={COLOR=GREEN}+{/COLOR}=

    Expect Failed: {COLOR=YELLOW}a3{/COLOR} != {COLOR=YELLOW}b3{/COLOR} (multiline difference below)
{COLOR=RED}        -test{/COLOR}
         {COLOR=GRAY}apple{/COLOR}
{COLOR=RED}        -orange{/COLOR}
{COLOR=GREEN}        +orafnge34{/COLOR}
         {COLOR=GRAY}qiwi{/COLOR}

    Expect Failed: 
        Different sizes: {COLOR=YELLOW}60{/COLOR}(a4) != {COLOR=YELLOW}54{/COLOR}(b4)
        Missed keys in a4: ["60", "61", "62", "63", "64", "65", "66", "67", "69", "70", "71", "72", "73", "74", "75", "76", "77", "79", "80", "81", ...further 34 different keys are omitted]
        Missed keys in b4: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", ...further 40 different keys are omitted]
 */
