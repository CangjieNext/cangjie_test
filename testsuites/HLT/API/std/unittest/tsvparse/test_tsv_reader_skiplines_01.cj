/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./tsv_skiplines_01.tsv
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE-1: %run_stdx %output %run_utest_opt %run_args --no-color  2>&1 | compare %f
// ASSERT: scan [ ERROR  ] CASE: test02

import std.collection.*
import stdx.unittest.data.*

@Test
public class Test_Tsv_Reader_Skip_Lines {
    @TestCase[person in tsv("tsv_skiplines_01.tsv", skipRows: [ 0u64 ], skipColumns: [ 0u64 ])]
    func test01(person: HashMap<String, String>): Unit {
        @Expect(person["age1"].contains("age"))
        @Expect(person["gender1"].contains("gender"))
        try {
            person["name0"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
        try {
            person["name1"]
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

    @TestCase[person in tsv("tsv_skiplines_01.tsv", skipRows: [ 0u64, 1u64 ], skipColumns: [ 0u64, 1u64, 2u64, 3u64 ])]
    func test02(person: HashMap<String, String>): Unit {
        person["gender5"]
        try {
            person["age5"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
        try {
            person["gender4"]
            @Expect(false)
        } catch (e: NoneValueException) {
            @Expect(e.message.contains("Value does not exist"))
        }
    }

    @TestCase[person in tsv("tsv_skiplines_01.tsv", skipRows: [ 1u64, 2u64 ], skipColumns: [ 1u64, 2u64, 3u64, 4u64, 5u64 ])]
    func test03(person: HashMap<String, String>): Unit {
        person["name0"]
        try {
            person["name1"]
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

    @TestCase[person in tsv("tsv_skiplines_01.tsv", skipRows: [ 1u64, 2u64, 3u64, 5u64 ], skipColumns: [ 1u64, 2u64 ])]
    func test04(person: HashMap<String, String>): Unit {
        @Expect(person["name0"], "name4")
    }
}
