/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

import std.collection.*

@Test
public class Test_AssertEqual_Hashmap {
    @TestCase
    func test_assert_hashmap_empty(): Unit {
        @Expect(HashMap<String, Int64>([("1", 1), ("2", 2), ("3", 3)]), HashMap<String, Int64>([]))
    }

    @TestCase
    func test_assert_hashmap_20_keys(): Unit {
        var map1 = HashMap<String, Int64>()
        var map2 = HashMap<String, Int64>()
        for (i in 0..30) {
            map1[i.toString()] = i
            map2["start: ${i} : end"] = i
        }
        @Expect(map1, map2)
    }

    @TestCase
    func test_assert_hashmap_20_values(): Unit {
        var map1 = HashMap<Int64, String>()
        var map2 = HashMap<Int64, String>()
        for (i in 0..30) {
            map1[i] = i.toString()
            map2[i] = "start: ${i} : end"
        }
        @Expect(map1, map2)
    }
}

/* SCAN-IN
    Expect Failed: 
        Different values (left - map1, right - map2):
            [0]:
                map1: "0"
                map2: "start: 0 : end"
            [1]:
                map1: "1"
                map2: "start: 1 : end"
            [2]:
                map1: "2"
                map2: "start: 2 : end"
            [3]:
                map1: "3"
                map2: "start: 3 : end"
            [4]:
                map1: "4"
                map2: "start: 4 : end"
            [5]:
                map1: "5"
                map2: "start: 5 : end"
            [6]:
                map1: "6"
                map2: "start: 6 : end"
            [7]:
                map1: "7"
                map2: "start: 7 : end"
            [8]:
                map1: "8"
                map2: "start: 8 : end"
            [9]:
                map1: "9"
                map2: "start: 9 : end"
            [10]:
                map1: "10"
                map2: "start: 10 : end"
            [11]:
                map1: "11"
                map2: "start: 11 : end"
            [12]:
                map1: "12"
                map2: "start: 12 : end"
            [13]:
                map1: "13"
                map2: "start: 13 : end"
            [14]:
                map1: "14"
                map2: "start: 14 : end"
            [15]:
                map1: "15"
                map2: "start: 15 : end"
            [16]:
                map1: "16"
                map2: "start: 16 : end"
            [17]:
                map1: "17"
                map2: "start: 17 : end"
            [18]:
                map1: "18"
                map2: "start: 18 : end"
            [19]:
                map1: "19"
                map2: "start: 19 : end"
            ...further 10 different elements are omitted
 */
