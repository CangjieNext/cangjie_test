/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./csv_quote_escape_Char_02.csv
// DEPENDENCE: ./csv_quote_escape_Char_03.csv
// DEPENDENCE: ./csv_quote_escape_Char_04.csv
// DEPENDENCE: ./csv_quote_escape_Char_05.csv
// DEPENDENCE: ./csv_quote_escape_Char_06.csv
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx  %output %run_utest_opt %run_args

import std.collection.*
import stdx.unittest.data.*

@Test
public class Test_Csv_Reader_Packed_Elements {

    @TestCase[person in csv("csv_quote_escape_Char_02.csv", delimiter: r';', quoteChar: r' ', escapeChar: r' ')]
    func test02(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "wang" || person["name"] == "liu")
        @Expect(person["age"] == "18" || person["age"] == "20")
    }

    @TestCase[person in csv("csv_quote_escape_Char_03.csv", delimiter: r';', quoteChar: r'空', escapeChar: r'空')]
    func test03(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "wang" || person["name"] == "liu")
        @Expect(person["age"] == "18" || person["age"] == "20")
    }

    @TestCase[person in csv("csv_quote_escape_Char_04.csv", delimiter: r';', quoteChar: r'"', escapeChar: r'"')]
    func test04(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "wa;;;ng" || person["name"] == ";liu")
        @Expect(person["age"] == "1;8" || person["age"] == "20;")
    }

    @TestCase[person in csv("csv_quote_escape_Char_05.csv", delimiter: r';', quoteChar: r'"', escapeChar: r'"')]
    func test05(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "wang" || person["name"] == "liu")
        @Expect(person["age"] == "1\r\n8" || person["age"] == "20")
    }

    // double-quotes
    @TestCase[person in csv("csv_quote_escape_Char_06.csv", delimiter: r';', quoteChar: r'"', escapeChar: r'"')]
    func test06(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "wang" || person["name"] == "\"\"b\"b\"b")
        @Expect(person["age"] == "18" || person["age"] == "20")
    }
}
