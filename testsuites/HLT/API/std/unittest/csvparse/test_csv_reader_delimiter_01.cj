/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./csv_delimiter_01.csv
// DEPENDENCE: ./csv_delimiter_02.csv
// DEPENDENCE: ./csv_delimiter_03.csv
// DEPENDENCE: ./csv_delimiter_04.csv
// DEPENDENCE: ./csv_delimiter_05.csv
// DEPENDENCE: ./csv_delimiter_06.csv
// DEPENDENCE: ./csv_delimiter_07.csv
// DEPENDENCE: ./csv_delimiter_08.csv
// DEPENDENCE: ./csv_delimiter_09.csv
// DEPENDENCE: ./csv_delimiter_10.csv
// DEPENDENCE: ./csv_delimiter_11.csv
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE-1: %run_stdx  %output %run_utest_opt %run_args --no-color  2>&1 | compare %f
// ASSERT: scan [ ERROR  ] CASE: test05
// ASSERT: scan [ ERROR  ] CASE: test09

import std.collection.*
import stdx.unittest.data.*

@Test
public class Test_Csv_Reader_Delimiter {
    @TestCase[person in csv("csv_delimiter_01.csv")]
    func test01(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "name")
        @Expect(person["age"] == "age")
    }

    @TestCase[person in csv("csv_delimiter_02.csv", delimiter: r';')]
    func test02(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "xiaowang" || person["name"] == "xiaoli")
        @Expect(person["age"] == "18" || person["age"] == "20")
    }

    @TestCase[person in csv("csv_delimiter_03.csv", delimiter: r' ')]
    func test03(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "xiaowang" || person["name"] == "xiaoli")
        @Expect(person["age"] == "18" || person["age"] == "20")
    }

    @TestCase[person in csv("csv_delimiter_04.csv", delimiter: r'隔')]
    func test04(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "xiaowang" || person["name"] == "xiaoli")
        @Expect(person["age"] == "18" || person["age"] == "20")
    }

    // 换行符
    @TestCase[person in csv("csv_delimiter_05.csv", delimiter: r'\n')]
    func test05(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "xiaowang" || person["name"] == "xiaoli")
        @Expect(person["age"] == "18" || person["age"] == "20")
    }

    // 是否以crlf结尾
    @TestCase[person in csv("csv_delimiter_06.csv", delimiter: r';')]
    func test06(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "xiaowang" || person["name"] == "xiaoli")
        @Expect(person["age"] == "18" || person["age"] == "20")
    }

    // 元素数量
    @TestCase[person in csv("csv_delimiter_07.csv", delimiter: r';')]
    func test07(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "xiaowang" || person["name"] == "xiaoli")
        @Expect(person["age"] == "18" || person["age"] == "98")
        @Expect(person["gender"] == "male" || person["gender"] == "female")
        @Expect(person["school"] == "aaa" || person["school"] == "abc")
        @Expect(person["class"] == "bbb" || person["class"] == "bbc")
        @Expect(person["parents"] == "ccc" || person["parents"] == "cccb")
        @Expect(person["fruit"] == "apple")
        @Expect(person["song"] == "swift" || person["song"] == "li")
    }

    @TestCase[person in csv("csv_delimiter_08.csv", delimiter: r',')]
    func test08(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "xiaowang" || person["name"] == "xiaoli")
        @Expect(person["age"] == "18" || person["age"] == "20")
    }


    @TestCase[person in csv("csv_delimiter_09.csv", delimiter: r'\n')]
    func test09(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "xiaowang" || person["name"] == "xiaoli")
        @Expect(person["age"] == "18" || person["age"] == "20")
        @Expect(person["gender"] == "male" || person["gender"] == "female")
    }

    // 多余的分隔符
    @TestCase[person in csv("csv_delimiter_10.csv")]
    func test10(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "xiaowang" || person["name"] == "xiaoli")
        @Expect(person["age"] == "18" || person["age"] == "20")
    }


    // 多余的空格
    @TestCase[person in csv("csv_delimiter_11.csv", delimiter: r';')]
    func test11(person: HashMap<String, String>): Unit {
        @Expect(person["name"] == "xiao wang" || person["name"] == "xiaoli ")
        @Expect(person["age"] == " 18" || person["age"] == "20")
        @Expect(person["gender"] == "m" || person["gender"] == "f")
    }
}
