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
    func case5() {
        let x: Array<(String, String)> = [("0", "0"),
            ("___ddjfj____ddjjaf___wioeriowieor___dd", "___ddjfj____ddjjaf___wioeriowieor___dd"), ("2", "2"), ("3", "3"),
            ("4", "4"), ("5", "5"), ("6", "6"), ("7", "7"), ("8", "8"), ("9", "9"),
            ("___ddjfj____ddjjaf___wioeriowieor___dd0", "___ddjfj____ddjjaf___wioeriowieor___dd0"),
            ("___ddjfj____ddjjaf___wioeriowieor___dd___ddjfj____ddjjaf___wioeriowieor___dd",
            "___ddjfj____ddjjaf___wioeriowieor___dd___ddjfj____ddjjaf___wioeriowieor___dd"),
            ("___ddjfj____ddjjaf___wioeriowieor___dd2", "___ddjfj____ddjjaf___wioeriowieor___dd2"),
            ("___ddjfj____ddjjaf___wioeriowieor___dd3", "___ddjfj____ddjjaf___wioeriowieor___dd3"),
            ("___ddjfj____ddjjaf___wioeriowieor___dd4", "___ddjfj____ddjjaf___wioeriowieor___dd4"),
            ("___ddjfj____ddjjaf___wioeriowieor___dd5", "___ddjfj____ddjjaf___wioeriowieor___dd5"),
            ("___ddjfj____ddjjaf___wioeriowieor___dd6", "___ddjfj____ddjjaf___wioeriowieor___dd6"),
            ("___ddjfj____ddjjaf___wioeriowieor___dd7", "___ddjfj____ddjjaf___wioeriowieor___dd7"),
            ("___ddjfj____ddjjaf___wioeriowieor___dd8", "___ddjfj____ddjjaf___wioeriowieor___dd8"),
            ("___ddjfj____ddjjaf___wioeriowieor___dd9", "___ddjfj____ddjjaf___wioeriowieor___dd9"), ("20", "20"),
            ("2___ddjfj____ddjjaf___wioeriowieor___dd", "2___ddjfj____ddjjaf___wioeriowieor___dd"), ("22", "22"),
            ("23", "23"), ("24", "24"), ("25", "25"), ("26", "26"), ("27", "27"), ("28", "28"), ("29", "29"),
            ("30", "30"), ("3___ddjfj____ddjjaf___wioeriowieor___dd", "3___ddjfj____ddjjaf___wioeriowieor___dd"),
            ("32", "32"), ("33", "33"), ("34", "34"), ("35", "35"), ("36", "36"), ("37", "37"), ("38", "38"),
            ("39", "39"), ("40", "40"),
            ("4___ddjfj____ddjjaf___wioeriowieor___dd", "4___ddjfj____ddjjaf___wioeriowieor___dd"), ("42", "42"),
            ("43", "43"), ("44", "44"), ("45", "45"), ("46", "46"), ("47", "47"), ("48", "48"), ("49", "49"),
            ("50", "50"), ("5___ddjfj____ddjjaf___wioeriowieor___dd", "5___ddjfj____ddjjaf___wioeriowieor___dd"),
            ("52", "52"), ("53", "53"), ("54", "54"), ("55", "55"), ("56", "56"), ("57", "57"), ("58", "58"),
            ("59", "59")]
        let hm1 = HashMap(x)
        let hm2 = HashMap(
            [("60", "6___ddjfj____ddjjaf___wioeriowieor___dd"), ("6___ddjfj____ddjjaf___wioeriowieor___dd", "68"),
                ("62", "63"), ("63", "6___ddjfj____ddjjaf___wioeriowieor___dd"), ("64", "65"), ("65", "66"), ("66", "67"),
                ("67", "68"), ("69", "60"), ("70", "7___ddjfj____ddjjaf___wioeriowieor___dd"),
                ("7___ddjfj____ddjjaf___wioeriowieor___dd", "78"), ("72", "73"),
                ("73", "7___ddjfj____ddjjaf___wioeriowieor___dd"), ("74", "75"), ("75", "76"), ("76", "77"), ("77", "78"),
                ("79", "70"), ("80", "8___ddjfj____ddjjaf___wioeriowieor___dd"),
                ("8___ddjfj____ddjjaf___wioeriowieor___dd", "88"), ("82", "83"),
                ("83", "8___ddjfj____ddjjaf___wioeriowieor___dd"), ("84", "85"), ("85", "86"), ("86", "87"), ("87", "88"),
                ("89", "80"), ("90", "9___ddjfj____ddjjaf___wioeriowieor___dd"),
                ("9___ddjfj____ddjjaf___wioeriowieor___dd", "98"), ("92", "93"),
                ("93", "9___ddjfj____ddjjaf___wioeriowieor___dd"), ("94", "95"), ("95", "96"), ("96", "97"), ("97", "98"),
                ("99", "90"),
                ("___ddjfj____ddjjaf___wioeriowieor___dd90",
                "___ddjfj____ddjjaf___wioeriowieor___dd9___ddjfj____ddjjaf___wioeriowieor___dd"),
                ("___ddjfj____ddjjaf___wioeriowieor___dd9___ddjfj____ddjjaf___wioeriowieor___dd",
                "___ddjfj____ddjjaf___wioeriowieor___dd98"),
                ("___ddjfj____ddjjaf___wioeriowieor___dd92", "___ddjfj____ddjjaf___wioeriowieor___dd93"),
                ("___ddjfj____ddjjaf___wioeriowieor___dd93",
                "___ddjfj____ddjjaf___wioeriowieor___dd9___ddjfj____ddjjaf___wioeriowieor___dd"),
                ("___ddjfj____ddjjaf___wioeriowieor___dd94", "___ddjfj____ddjjaf___wioeriowieor___dd95"),
                ("___ddjfj____ddjjaf___wioeriowieor___dd95", "___ddjfj____ddjjaf___wioeriowieor___dd96"),
                ("___ddjfj____ddjjaf___wioeriowieor___dd96", "___ddjfj____ddjjaf___wioeriowieor___dd97"),
                ("___ddjfj____ddjjaf___wioeriowieor___dd97", "___ddjfj____ddjjaf___wioeriowieor___dd98"),
                ("___ddjfj____ddjjaf___wioeriowieor___dd99", "___ddjfj____ddjjaf___wioeriowieor___dd90"),
                ("290", "29___ddjfj____ddjjaf___wioeriowieor___dd"), ("29___ddjfj____ddjjaf___wioeriowieor___dd", "298"),
                ("292", "293"), ("293", "29___ddjfj____ddjjaf___wioeriowieor___dd"), ("294", "295"), ("295", "296"),
                ("296", "297"), ("297", "298"), ("299", "290")])
        let a = [[hm1, hm2], [hm1]]
        let b = [[hm2, hm1], [hm1]]
        @Assert(a, b)
    }
    @TestCase
    func case6() {
        let hm1 = HashMap([("a", "apple"), ("a2", "apple"), ("bsgsdgf", "appleorange")])
        let hm2 = HashMap([("a", "app1e"), ("a33", "ap1le"), ("bsgsdgf", "apple_o1ange")])
        let a = [[hm1, hm2], [hm1, hm2]]
        let b = [[hm2, hm1], [hm1, hm1]]
        @Assert(a, b)
    }
    @TestCase
    func case7() {
        let hm1 = HashMap([("a", [[0.000003, 3234234.33333], [-0.0, 40.0]])])
        let hm2 = HashMap([("a", [[0.000403, 3134234.333334], [-0.0000000004, -40.0]])])
        @Assert(hm1, hm2)
    }
    @TestCase
    func case8() {
        let a = [[[[[["ab", "_`"], ["pac", "use"]]]]]]
        let b = [[[[[["ba", "+'"], ["nopac", "don't usedon't usedon't use"]]]]]]
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]:
                Different elements (left - a[0], right - b[0]):
                    [0]:
                        Different sizes: {COLOR=YELLOW}60{/COLOR}(a[0][0]) != {COLOR=YELLOW}54{/COLOR}(b[0][0])
                        Missed keys in a[0][0]: [
                            "60",
                            "6___ddjfj____ddjjaf___wioeriowieor___dd",
                            "62",
                            "63",
                            "64",
                            "65",
                            "66",
                            "67",
                            "69",
                            "70",
                            "7___ddjfj____ddjjaf___wioeriowieor___dd",
                            "72",
                            "73",
                            "74",
                            "75",
                            "76",
                            "77",
                            "79",
                            "80",
                            "8___ddjfj____ddjjaf___wioeriowieor___dd",
                            ...further 34 different keys are omitted
                        ]
                        Missed keys in b[0][0]: [
                            "0",
                            "___ddjfj____ddjjaf___wioeriowieor___dd",
                            "2",
                            "3",
                            "4",
                            "5",
                            "6",
                            "7",
                            "8",
                            "9",
                            "___ddjfj____ddjjaf___wioeriowieor___dd0",
                            "___ddjfj____ddjjaf___wioeriowieor___dd___ddjfj____ddjjaf___wioeriowieor___dd",
                            "___ddjfj____ddjjaf___wioeriowieor___dd2",
                            "___ddjfj____ddjjaf___wioeriowieor___dd3",
                            "___ddjfj____ddjjaf___wioeriowieor___dd4",
                            "___ddjfj____ddjjaf___wioeriowieor___dd5",
                            "___ddjfj____ddjjaf___wioeriowieor___dd6",
                            "___ddjfj____ddjjaf___wioeriowieor___dd7",
                            "___ddjfj____ddjjaf___wioeriowieor___dd8",
                            "___ddjfj____ddjjaf___wioeriowieor___dd9",
                            ...further 40 different keys are omitted
                        ]
                    [1]:
                        Different sizes: {COLOR=YELLOW}54{/COLOR}(a[0][1]) != {COLOR=YELLOW}60{/COLOR}(b[0][1])
                        Missed keys in a[0][1]: [
                            "0",
                            "___ddjfj____ddjjaf___wioeriowieor___dd",
                            "2",
                            "3",
                            "4",
                            "5",
                            "6",
                            "7",
                            "8",
                            "9",
                            "___ddjfj____ddjjaf___wioeriowieor___dd0",
                            "___ddjfj____ddjjaf___wioeriowieor___dd___ddjfj____ddjjaf___wioeriowieor___dd",
                            "___ddjfj____ddjjaf___wioeriowieor___dd2",
                            "___ddjfj____ddjjaf___wioeriowieor___dd3",
                            "___ddjfj____ddjjaf___wioeriowieor___dd4",
                            "___ddjfj____ddjjaf___wioeriowieor___dd5",
                            "___ddjfj____ddjjaf___wioeriowieor___dd6",
                            "___ddjfj____ddjjaf___wioeriowieor___dd7",
                            "___ddjfj____ddjjaf___wioeriowieor___dd8",
                            "___ddjfj____ddjjaf___wioeriowieor___dd9",
                            ...further 40 different keys are omitted
                        ]
                        Missed keys in b[0][1]: [
                            "60",
                            "6___ddjfj____ddjjaf___wioeriowieor___dd",
                            "62",
                            "63",
                            "64",
                            "65",
                            "66",
                            "67",
                            "69",
                            "70",
                            "7___ddjfj____ddjjaf___wioeriowieor___dd",
                            "72",
                            "73",
                            "74",
                            "75",
                            "76",
                            "77",
                            "79",
                            "80",
                            "8___ddjfj____ddjjaf___wioeriowieor___dd",
                            ...further 34 different keys are omitted
                        ]
 */
/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]:
                Different elements (left - a[0], right - b[0]):
                    [0]:
                        Missed keys in a[0][0]: ["a33"]
                        Missed keys in b[0][0]: ["a2"]
                        Different values (left - a[0][0], right - b[0][0]):
                            ["a"]: "{COLOR=YELLOW}apple{/COLOR}" != "{COLOR=YELLOW}app1e{/COLOR}"
                            ["bsgsdgf"]:
                                a[0][0]: "apple{COLOR=GREEN}·{/COLOR}o{COLOR=YELLOW}r{/COLOR}ange"
                                b[0][0]: "apple{COLOR=GREEN}_{/COLOR}o{COLOR=YELLOW}1{/COLOR}ange"
                                          ====={COLOR=GREEN}+{/COLOR}={COLOR=YELLOW}!{/COLOR}====
                    [1]:
                        Missed keys in a[0][1]: ["a2"]
                        Missed keys in b[0][1]: ["a33"]
                        Different values (left - a[0][1], right - b[0][1]):
                            ["a"]: "{COLOR=YELLOW}app1e{/COLOR}" != "{COLOR=YELLOW}apple{/COLOR}"
                            ["bsgsdgf"]:
                                a[0][1]: "apple{COLOR=RED}_{/COLOR}o{COLOR=YELLOW}1{/COLOR}ange"
                                b[0][1]: "apple{COLOR=RED}·{/COLOR}o{COLOR=YELLOW}r{/COLOR}ange"
                                          ====={COLOR=RED}-{/COLOR}={COLOR=YELLOW}!{/COLOR}====
            [1]:
                Different elements (left - a[1], right - b[1]):
                    [1]:
                        Missed keys in a[1][1]: ["a2"]
                        Missed keys in b[1][1]: ["a33"]
                        Different values (left - a[1][1], right - b[1][1]):
                            ["a"]: "{COLOR=YELLOW}app1e{/COLOR}" != "{COLOR=YELLOW}apple{/COLOR}"
                            ["bsgsdgf"]:
                                a[1][1]: "apple{COLOR=RED}_{/COLOR}o{COLOR=YELLOW}1{/COLOR}ange"
                                b[1][1]: "apple{COLOR=RED}·{/COLOR}o{COLOR=YELLOW}r{/COLOR}ange"
                                          ====={COLOR=RED}-{/COLOR}={COLOR=YELLOW}!{/COLOR}====
 */

/* SCAN-IN
    Assert Failed: 
        Different values (left - hm1, right - hm2):
            ["a"]:
                Different elements (left - hm1["a"], right - hm2["a"]):
                    [0]:
                        Different elements (left - hm1["a"][0], right - hm2["a"][0]):
                            [0]:
                                 hm1["a"][0]: {COLOR=RED}3e-06{/COLOR}
                                 hm2["a"][0]: {COLOR=RED}0.000403{/COLOR}
 */

/* SCAN-IN
                            [1]:
                                 hm1["a"][0]: 3.{COLOR=RED}23423e+06{/COLOR}
                                 hm2["a"][0]: 3.{COLOR=RED}13423e+06{/COLOR}
 */

/* SCAN-IN
                            [1]:
                                 hm1["a"][0]: 3.{COLOR=RED}23423e+06{/COLOR}
                                 hm2["a"][0]: 3.{COLOR=RED}13423e+06{/COLOR}
 */
/* SCAN-IN
                    [1]:
                        Different elements (left - hm1["a"][1], right - hm2["a"][1]):
                            [0]:
                                 hm1["a"][1]: -{COLOR=RED}0.0{/COLOR}
                                 hm2["a"][1]: -{COLOR=RED}4e-10{/COLOR}
 */
/* SCAN-IN
                            [1]:
                                 hm1["a"][1]: {COLOR=RED}40.0{/COLOR}
                                 hm2["a"][1]: {COLOR=RED}-40.0{/COLOR}
 */
/* SCAN-IN
    Assert Failed: 
        Different elements (left - a, right - b):
            [0]:
                Different elements (left - a[0], right - b[0]):
                    [0]:
                        Different elements (left - a[0][0], right - b[0][0]):
                            [0]:
                                Different elements (left - a[0][0][0], right - b[0][0][0]):
                                    [0]:
                                        Different elements (left - a[0][0][0][0], right - b[0][0][0][0]):
                                            [0]: {COLOR=YELLOW}[ab, _`]{/COLOR} != {COLOR=YELLOW}[ba, +']{/COLOR}
                                            [1]: {COLOR=YELLOW}[pac, use]{/COLOR} != {COLOR=YELLOW}[nopac, don't usedon{/COLOR}...
 */
