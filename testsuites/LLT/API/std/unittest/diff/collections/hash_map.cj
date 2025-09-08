/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args  --no-color 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*

var x = 0

open class Foo <: Equatable<Foo> & Hashable {
    public operator override func ==(other: Foo): Bool {
        false
    }

    public operator override func !=(other: Foo): Bool {
        true
    }

    public override func hashCode(): Int64 {
        (x++).hashCode()
    }
}

open class Bar <: Equatable<Bar> & Hashable & ToString {
    public operator override func ==(other: Bar): Bool {
        false
    }

    public operator override func !=(other: Bar): Bool {
        true
    }

    public override func toString() {
        x++;
        "Bar#" + x.toString()
    }

    public override func hashCode(): Int64 {
        x++
        x.hashCode()
    }
}

@Test
public class TestA {
    @TestCase
    func case1() {
        let a = HashMap([(1, 1), (2, 9), (4, 1), (5, 3)])
        let b = HashMap([(1, 1), (2, 9), (4, 1)])
        @Assert(a, b)
    }

    @TestCase
    func case2() {
        let a = HashMap(
            [(0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1)])
        let b = HashMap(
            [(0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1), (0, 1),
                (0, 1), (0, 1), (0, 1), (0, 1), (1, 1)])
        @Assert(a, b)
    }

    @TestCase
    func case3(): Unit {
        let x: Array<(Int64, Int64)> = [(0, 0)]
        let a = HashMap(x)
        let b = HashMap([(0, 1)])
        @Assert(a, b)
    }

    @TestCase
    func case4(): Unit {
        let x: Array<(Int64, Int64)> = [(1, 0)]
        let a = HashMap(x)
        let b = HashMap([(0, 0)])
        @Assert(a, b)
    }

    @TestCase
    func case5(): Unit {
        let x: Array<(String, String)> = [("0", "0"), ("1", "1"), ("2", "2"), ("3", "3"), ("4", "4"), ("5", "5"),
            ("6", "6")]
        let a = HashMap(x)
        let b = HashMap([("0", "1"), ("1", "1"), ("2", "3"), ("3", "3"), ("4", "5"), ("5", "6"), ("6", "7")])
        @Assert(a, b)
    }

    @TestCase
    func case6(): Unit {
        let x: Array<(String, String)> = [("0", "0"), ("1", "1"), ("2", "2"), ("3", "3"), ("4", "4"), ("5", "5"),
            ("6", "6")]
        let a = HashMap(x)
        let b = HashMap([("0", "0"), ("12", "1"), ("2", "2"), ("33", "3"), ("4", "4"), ("45", "5"), ("65", "6")])
        @Assert(a, b)
    }

    @TestCase
    func case7(): Unit {
        let x: Array<(String, String)> = [("0", "0"), ("1-", "1"), ("2+", "2"), ("3", "3"), ("4", "4"), ("5", "5"),
            ("6", "6")]
        let a = HashMap(x)
        let b = HashMap([("0", "0"), ("12", "1"), ("2", "2"), ("33", "3"), ("4", "4"), ("45", "5"), ("65", "6")])
        @Assert(a, b)
    }

    @TestCase
    func case8(): Unit {
        let x: Array<(String, String)> = [("0", "0"), ("1", "1"), ("2", "2"), ("3", "3"), ("4", "4"), ("5", "5"),
            ("6", "6"), ("7", "7"), ("8", "8"), ("9", "9"), ("10", "10"), ("11", "11"), ("12", "12"), ("13", "13"),
            ("14", "14"), ("15", "15"), ("16", "16"), ("17", "17"), ("18", "18"), ("19", "19"), ("20", "20"),
            ("21", "21"), ("22", "22"), ("23", "23"), ("24", "24"), ("25", "25"), ("26", "26"), ("27", "27"),
            ("28", "28"), ("29", "29"), ("30", "30"), ("31", "31"), ("32", "32"), ("33", "33"), ("34", "34"),
            ("35", "35"), ("36", "36"), ("37", "37"), ("38", "38"), ("39", "39"), ("40", "40"), ("41", "41"),
            ("42", "42"), ("43", "43"), ("44", "44"), ("45", "45"), ("46", "46"), ("47", "47"), ("48", "48"),
            ("49", "49"), ("50", "50"), ("51", "51"), ("52", "52"), ("53", "53"), ("54", "54"), ("55", "55"),
            ("56", "56"), ("57", "57"), ("58", "58"), ("59", "59")]
        let a = HashMap(x)
        let b = HashMap(
            [("0", "1"), ("1", "8"), ("2", "3"), ("3", "1"), ("4", "5"), ("5", "6"), ("6", "7"), ("7", "8"), ("9", "0"),
                ("10", "11"), ("11", "18"), ("12", "13"), ("13", "11"), ("14", "15"), ("15", "16"), ("16", "17"),
                ("17", "18"), ("18", "14"), ("19", "10"), ("20", "21"), ("21", "28"), ("22", "23"), ("23", "21"),
                ("24", "25"), ("25", "26"), ("26", "27"), ("27", "28"), ("28", "24"), ("29", "20"), ("30", "31"),
                ("31", "38"), ("32", "33"), ("33", "31"), ("34", "35"), ("35", "36"), ("36", "37"), ("37", "38"),
                ("38", "34"), ("39", "30"), ("40", "41"), ("41", "48"), ("42", "43"), ("43", "41"), ("44", "45"),
                ("45", "46"), ("46", "47"), ("47", "48"), ("48", "44"), ("49", "40"), ("50", "51"), ("51", "58"),
                ("52", "53"), ("53", "51"), ("54", "55"), ("55", "56"), ("56", "57"), ("57", "58"), ("58", "54"),
                ("59", "50")])
        @Assert(a, b)
    }

    @TestCase
    func case9(): Unit {
        let x: Array<(String, String)> = [("0", "0"), ("1", "1"), ("2", "2"), ("3", "3"), ("4", "4"), ("5", "5"),
            ("6", "6"), ("7", "7"), ("8", "8"), ("9", "9"), ("10", "10"), ("11", "11"), ("12", "12"), ("13", "13"),
            ("14", "14"), ("15", "15"), ("16", "16"), ("17", "17"), ("18", "18"), ("19", "19"), ("20", "20"),
            ("21", "21"), ("22", "22"), ("23", "23"), ("24", "24"), ("25", "25"), ("26", "26"), ("27", "27"),
            ("28", "28"), ("29", "29"), ("30", "30"), ("31", "31"), ("32", "32"), ("33", "33"), ("34", "34"),
            ("35", "35"), ("36", "36"), ("37", "37"), ("38", "38"), ("39", "39"), ("40", "40"), ("41", "41"),
            ("42", "42"), ("43", "43"), ("44", "44"), ("45", "45"), ("46", "46"), ("47", "47"), ("48", "48"),
            ("49", "49"), ("50", "50"), ("51", "51"), ("52", "52"), ("53", "53"), ("54", "54"), ("55", "55"),
            ("56", "56"), ("57", "57"), ("58", "58"), ("59", "59")]
        let a = HashMap(x)
        let b = HashMap(
            [("60", "61"), ("61", "68"), ("62", "63"), ("63", "61"), ("64", "65"), ("65", "66"), ("66", "67"),
                ("67", "68"), ("69", "60"), ("70", "71"), ("71", "78"), ("72", "73"), ("73", "71"), ("74", "75"),
                ("75", "76"), ("76", "77"), ("77", "78"), ("79", "70"), ("80", "81"), ("81", "88"), ("82", "83"),
                ("83", "81"), ("84", "85"), ("85", "86"), ("86", "87"), ("87", "88"), ("89", "80"), ("90", "91"),
                ("91", "98"), ("92", "93"), ("93", "91"), ("94", "95"), ("95", "96"), ("96", "97"), ("97", "98"),
                ("99", "90"), ("190", "191"), ("191", "198"), ("192", "193"), ("193", "191"), ("194", "195"),
                ("195", "196"), ("196", "197"), ("197", "198"), ("199", "190"), ("290", "291"), ("291", "298"),
                ("292", "293"), ("293", "291"), ("294", "295"), ("295", "296"), ("296", "297"), ("297", "298"),
                ("299", "290")])
        @Assert(a, b)
    }

    @TestCase
    func case10(): Unit {
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
        let a = HashMap(x)
        let b = HashMap(
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
        @Assert(a, b)
    }

    @TestCase
    func case11(): Unit {
        let x: Array<(String, String)> = [("6___ddjfj____ddjjaf___wioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd",
            "app1eorange"), ("1", "1"), ("2", "2"), ("3", "3"),
            ("6___ddjfj____ddjjaf___wioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd2", "4"), ("5", "5"),
            ("6", "6")]
        let a = HashMap(x)
        let b = HashMap(
            [("6___ddjfj____ddjjaf___wioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd", "apple_orange"),
                ("1", "1"), ("2", "3"), ("3", "3"), ("4", "5"), ("5", "6"),
                ("6___ddjfj____ddjjaf___wioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd2", "7")])
        @Assert(a, b)
    }

    @TestCase
    func case12(): Unit {
        let x: Array<(String, String)> = [("6___ddjfj____ddjjaf___w\nioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd",
            "app1eorange"), ("1", "1"), ("2", "2"), ("3", "3"),
            ("6___ddjfj____ddjjaf___wioeriowieor___dd6___ddjfj____ddj\njaf___wioeriowieor___dd2", "4"), ("5", "5"),
            ("6", "6")]
        let a = HashMap(x)
        let b = HashMap(
            [("6___ddjfj____ddjjaf___w\nioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd", "apple_orange"),
                ("1", "1"), ("2", "3"), ("3", "3"), ("4", "5"), ("5", "6"),
                ("6___ddjfj____ddjjaf___wioeriowieor___dd6___ddjfj____ddj\njaf___wioeriowieor___dd2", "7")])
        @Assert(a, b)
    }

    @TestCase
    func case13(): Unit {
        let a = HashMap(
            [("6___ddjfj____ddjjaf___w\nioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd", [1, 5]),
                ("6___ddjf\nioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd", [1, 5])])
        let b = HashMap(
            [("6___ddjfj____ddjjaf___w\nioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd", [2, 5]),
                ("6___ddjf\nioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd", [1, 7])])
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: 
        Different sizes: 4(a) != 3(b)
        Missed keys in b: [5]
 */

/* SCAN-IN
    Assert Failed: 
        Different sizes: 1(a) != 2(b)
        Missed keys in a: [1]
 */

/* SCAN-IN
    Assert Failed: 
        Different values (left - a, right - b):
            [0]: 0 != 1
 */

/* SCAN-IN
    Assert Failed: 
        Missed keys in a: [0]
        Missed keys in b: [1]
 */

/* SCAN-IN
    Assert Failed: 
        Different values (left - a, right - b):
            ["0"]: "0" != "1"
            ["2"]: "2" != "3"
            ["4"]: "4" != "5"
            ["5"]: "5" != "6"
            ["6"]: "6" != "7"
 */

/* SCAN-IN
    Assert Failed: 
        Missed keys in a: ["12", "33", "45", "65"]
        Missed keys in b: ["1", "3", "5", "6"]
 */

/* SCAN-IN
    Assert Failed: 
        Missed keys in a: ["12", "2", "33", "45", "65"]
        Missed keys in b: ["1-", "2+", "3", "5", "6"]
 */

/* SCAN-IN
    Assert Failed: 
        Different sizes: 60(a) != 59(b)
        Missed keys in b: ["8"]
        Different values (left - a, right - b):
            ["0"]: "0" != "1"
            ["1"]: "1" != "8"
            ["2"]: "2" != "3"
            ["3"]: "3" != "1"
            ["4"]: "4" != "5"
            ["5"]: "5" != "6"
            ["6"]: "6" != "7"
            ["7"]: "7" != "8"
            ["9"]: "9" != "0"
            ["10"]: "10" != "11"
            ["11"]: "11" != "18"
            ["12"]: "12" != "13"
            ["13"]: "13" != "11"
            ["14"]: "14" != "15"
            ["15"]: "15" != "16"
            ["16"]: "16" != "17"
            ["17"]: "17" != "18"
            ["18"]: "18" != "14"
            ["19"]: "19" != "10"
            ["20"]: "20" != "21"
            ...further 39 different elements are omitted
 */

/* SCAN-IN
    Assert Failed: 
        Different sizes: 60(a) != 54(b)
        Missed keys in a: ["60", "61", "62", "63", "64", "65", "66", "67", "69", "70", "71", "72", "73", "74", "75", "76", "77", "79", "80", "81", ...further 34 different keys are omitted]
        Missed keys in b: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", ...further 40 different keys are omitted]
 */

/* SCAN-IN
    Assert Failed: 
        Different sizes: 60(a) != 54(b)
        Missed keys in a: [
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
        Missed keys in b: [
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
 */

/* SCAN-IN
    Assert Failed: 
        Missed keys in a: ["4"]
        Missed keys in b: ["6"]
        Different values (left - a, right - b):
            ["6___ddjfj____ddjjaf___wioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd"]:
                a: "app1e·orange"
                b: "apple_orange"
                    ===!=+======
            ["2"]: "2" != "3"
            ["6___ddjfj____ddjjaf___wioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd2"]: "4" != "7"
            ["5"]: "5" != "6"
 */

/* SCAN-IN
    Assert Failed: 
        Missed keys in a: ["4"]
        Missed keys in b: ["6"]
        Different values (left - a, right - b):
            [
                "6___ddjfj____ddjjaf___w
ioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd"
            ]:
                a: "app1e·orange"
                b: "apple_orange"
                    ===!=+======
            ["2"]: "2" != "3"
            [
                "6___ddjfj____ddjjaf___wioeriowieor___dd6___ddjfj____ddj
jaf___wioeriowieor___dd2"
            ]: "4" != "7"
            ["5"]: "5" != "6"
 */

/* SCAN-IN
    Assert Failed: 
        Different values (left - a, right - b):
            [
                "6___ddjfj____ddjjaf___w
ioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd"
            ]:
                Different elements (left - a["6___ddjfj____ddjjaf_..."], right - b["6___ddjfj____ddjjaf_..."]):
                    [0]: 1 != 2
            [
                "6___ddjf
ioeriowieor___dd6___ddjfj____ddjjaf___wioeriowieor___dd"
            ]:
                Different elements (left - a["6___ddjf ioeriowieor..."], right - b["6___ddjf ioeriowieor..."]):
                    [1]: 5 != 7
 */
