/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./csv_skiplines_01.csv
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE-1: %run_stdx  %output %run_utest_opt %run_args --no-color  2>&1 | compare %f
// ASSERT: scan [ ERROR  ] CASE: test03
import std.collection.*
import stdx.unittest.data.*

@Test
public class Test_Csv_Reader_Skip_Lines {
    @TestCase[person in csv("csv_skiplines_01.csv", delimiter: r';', skipRows: [ 0u64 ])]
    func test01(person: HashMap<String, String>): Unit {
        @Expect(person["name1"].contains("name"))
        @Expect(person["age1"].contains("age"))
        @Expect(person["gender1"].contains("gender"))
        try {
            person["name0"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
    }

    @TestCase[person in csv("csv_skiplines_01.csv", delimiter: r';', skipRows: [ 0u64, 1u64, 2u64, 3u64, 4u64 ])]
    func test02(person: HashMap<String, String>): Unit {
        person["name5"]
        person["age5"]
        person["gender5"]
        try {
            person["name4"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
    }

    @TestCase[person in csv("csv_skiplines_01.csv", delimiter: r';', skipRows: [ 0u64, 1u64, 2u64, 3u64, 4u64, 5u64 ])]
    func test03(person: HashMap<String, String>): Unit {
        try {
            person["name5"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
        try {
            person["name0"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
    }

    @TestCase[person in csv("csv_skiplines_01.csv", delimiter: r';', skipRows: [ 1u64, 2u64, 3u64, 4u64, 5u64 ])]
    func test04(person: HashMap<String, String>): Unit {
        person["name0"]
        try {
            person["name5"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
    }

    @TestCase[person in csv("csv_skiplines_01.csv", delimiter: r';', skipRows: [ 6u64, 7u64, 1000u64 ])]
    func test05(person: HashMap<String, String>): Unit {
        @Expect(person["name0"].contains("name"))
        try {
            person["name5"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
    }
}
