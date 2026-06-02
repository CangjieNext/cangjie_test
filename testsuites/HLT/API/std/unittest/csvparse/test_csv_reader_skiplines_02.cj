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
// RUN-EXEC-PIPE-1: %run_stdx  %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan-1 REASON: Test case body was never executed. Provided strategy has zero elements.

import std.collection.*
import stdx.unittest.data.*

@Test
public class Test_Csv_Reader_Skip_Lines {
    @TestCase[person in csv("csv_skiplines_01.csv", delimiter: r';', skipColumns: [ 0u64 ])]
    func test01(person: HashMap<String, String>): Unit {
        @Expect(person["age0"].contains("age"))
        @Expect(person["gender0"].contains("gender"))
        try {
            person["name0"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
    }

    @TestCase[person in csv("csv_skiplines_01.csv", delimiter: r';', skipColumns: [ 0u64, 1u64 ])]
    func test02(person: HashMap<String, String>): Unit {
        @Expect(person["gender0"].contains("gender"))
        try {
            person["name0"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
        try {
            person["age0"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
    }

    @TestCase[person in csv("csv_skiplines_01.csv", delimiter: r';', skipColumns: [ 0u64, 1u64, 2u64 ])]
    func test03(person: HashMap<String, String>): Unit {
        try {
            person["name0"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
        try {
            person["age0"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
        try {
            person["gender0"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
    }

    @TestCase[person in csv("csv_skiplines_01.csv", delimiter: r';', skipColumns: [ 1u64, 2u64, 3u64, 4u64, 5u64 ])]
    func test04(person: HashMap<String, String>): Unit {
        @Expect(person["name0"].contains("name"))
        try {
            person["age0"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
    }
}
