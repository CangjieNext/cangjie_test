/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan Different values (left - HashMap < String, Int64 >([("1", 1),("2", 2),("3", 3),("4", 4),("5", 5)]), right - HashMap < String, Int64 >([("1", 1),("2", 2),("3", 3),("4", 4),("5", 10)]))
// ASSERT: scan-3 Missed keys in HashMap < String, Int64 >
// ASSERT: scan Missed keys in map2:
// ASSERT: scan-2 further 10 different elements are omitted

import std.collection.*

@Test
public class Test_AssertEqual_Hashmap {
    @TestCase
    func test_assert_hashmap_size(): Unit {
        @Expect(HashMap<String, Int64>([("10", 1), ("20", 2), ("30", 3)]), HashMap<String, Int64>([]))
    }

    @TestCase
    func test_assert_hashmap_small(): Unit {
        @Expect(HashMap<String, Int64>([("1", 1), ("2", 2), ("3", 3), ("4", 4), ("5", 5)]), 
        HashMap<String, Int64>([("1", 1), ("2", 2), ("3", 3), ("4", 4), ("5", 10)]))
        @Expect(HashMap<String, Int64>([("1", 1), ("2", 2), ("3", 3), ("4", 4), ("5", 5)]), 
        HashMap<String, Int64>([("1", 1), ("2", 2), ("3", 3), ("4", 4), ("10", 5)]))
    }

    @TestCase
    func test_assert_hashmap_20_keys(): Unit {
        var map1 = HashMap<String, Int64>()
        var map2 = HashMap<String, Int64>()
        for (i in 10..30) {
            map1[i.toString()] = i
            map2["start: ${i}"] = i
        }
        @Expect(map1, map2)
    }

    @TestCase
    func test_assert_hashmap_20_values(): Unit {
        var map1 = HashMap<Int64, String>()
        var map2 = HashMap<Int64, String>()
        for (i in 0..30) {
            map1[i] = "start ${i}"
            map2[i] = "start: ${i}"
        }
        @Expect(map1, map2)
    }

    @TestCase
    func test_assert_hashmap_key_and_value(): Unit {
        var map1 = HashMap<Int64, String>()
        var map2 = HashMap<Int64, String>()
        for (i in 0..30) {
            map1[i] = i.toString()
            map2[i] = "start: ${i}"
        }
        @Expect(map1, map2)
    }
}
