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
// ASSERT: scan [19]:
// ASSERT: scan-not [20]:
// ASSERT: scan further 10 different elements are omitted
// ASSERT: scan Missed elements in HashSet < String >()
// ASSERT: scan-2 further 20 different elements are omitted

import std.collection.*

@Test
public class Test_AssertEqual_Other_Collections {
    @TestCase
    func test_assert_linkedlist() {
        @Expect(LinkedList<Int64>(), LinkedList<Int64>(5, {i => i}))
        @Expect(LinkedList<Int64>(5, {i => i + 1}), LinkedList<Int64>(5, {i => i}))
        @Expect(LinkedList<Int64>(30, {i => i + 1}), LinkedList<Int64>(30, {i => i}))
    }

    @TestCase
    func test_assert_treemap() {
        @Expect(TreeMap<String, Int64>([("10", 1), ("20", 2), ("30", 3)]), TreeMap<String, Int64>([]))

        @Expect(TreeMap<String, Int64>([("1", 1), ("2", 2), ("3", 3), ("4", 4), ("5", 5)]), 
        TreeMap<String, Int64>([("1", 1), ("2", 2), ("3", 3), ("4", 4), ("5", 10)]))
        @Expect(TreeMap<String, Int64>([("1", 1), ("2", 2), ("3", 3), ("4", 4), ("5", 5)]), 
        TreeMap<String, Int64>([("1", 1), ("2", 2), ("3", 3), ("4", 4), ("10", 5)]))

        var map1 = TreeMap<Int64, String>()
        var map2 = TreeMap<Int64, String>()
        for (i in 0..30) {
            map1[i] = "start= ${i}"
            map2[i] = "start: ${i}"
        }
        @Expect(map1, map2)
    }

    @TestCase
    func test_assert_hashset() {
        @Expect(HashSet<String>(), HashSet<String>(5, {i => i.toString()}))
        @Expect(HashSet<Int64>(5, {i => i}), HashSet<Int64>(5, {i => i + 1}))
        var set1 = HashSet<Int64>(40, {i => i})
        var set2 = HashSet<Int64>(40, {i => 100 + i})
        @Expect(set1, set2)
    }
}


/* SCAN-IN
        Different sizes: 0(LinkedList < Int64 >()) != 5(LinkedList < Int64 >(5, { i =>
    i
}))
*/
 
/* SCAN-IN
        Different elements (left - LinkedList < Int64 >(5, { i =>
    i + 1
}), right - LinkedList < Int64 >(5, { i =>
    i
})):
*/
 
/* SCAN-IN
        Different elements (left - LinkedList < Int64 >(30, { i =>
    i + 1
}), right - LinkedList < Int64 >(30, { i =>
    i
})):
*/
 
/* SCAN-IN
        Different sizes: 0(HashSet < String >()) != 5(HashSet < String >(5, { i =>
    i.toString()
}))
*/
 
/* SCAN-IN
        Missed elements in HashSet < Int64 >(5, { i =>
    i
}): [5]
        Missed elements in HashSet < Int64 >(5, { i =>
    i + 1
}): [0]
*/