/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./tsv_quote_escape_Char_01.tsv
// DEPENDENCE: ./tsv_quote_escape_Char_02.tsv
// DEPENDENCE: ./tsv_quote_escape_Char_03.tsv
// DEPENDENCE: ./tsv_quote_escape_Char_04.tsv
// DEPENDENCE: ./tsv_quote_escape_Char_05.tsv
// DEPENDENCE: ./tsv_quote_escape_Char_06.tsv
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.collection.*
import stdx.unittest.data.*

@Test
public class Test_Tsv_Reader_Packed_Elements {
    @TestCase[person in tsv("tsv_quote_escape_Char_01.tsv", quoteChar: r'"', escapeChar: r'"')]
    func test01(person: HashMap<String, String>): Unit {
        @Expect(person["chinese name"] == "小王" || person["chinese name"] == "小明")
        @Expect(person[" left"] == " a")
        @Expect(person["right "] == "b ")
    }

    @TestCase[person in tsv("tsv_quote_escape_Char_02.tsv", quoteChar: r' ', escapeChar: r' ')]
    func test02(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "wang" || person["name"] == "liu")
        @Expect(person["age"] == "18" || person["age"] == "20")
    }

    @TestCase[person in tsv("tsv_quote_escape_Char_03.tsv", quoteChar: r'空', escapeChar: r'空')]
    func test03(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "wang" || person["name"] == "liu")
        @Expect(person["age"] == "18" || person["age"] == "20")
    }

    @TestCase[person in tsv("tsv_quote_escape_Char_04.tsv", quoteChar: r'"', escapeChar: r'"')]
    func test04(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "wa\t\t\tng" || person["name"] == "\tliu")
        @Expect(person["age"] == "1\t8" || person["age"] == "20\t")
    }

    @TestCase[person in tsv("tsv_quote_escape_Char_05.tsv", quoteChar: r'"', escapeChar: r'"')]
    func test05(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "wang" || person["name"] == "liu")
        @Expect(person["age"] == "1\r\n8" || person["age"] == "20")
    }

    // double-quotes
    @TestCase[person in tsv("tsv_quote_escape_Char_06.tsv", quoteChar: r'"', escapeChar: r'"')]
    func test06(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "wang" || person["name"] == "\"\"b\"b\"b")
        @Expect(person["age"] == "18" || person["age"] == "20")
    }
}
