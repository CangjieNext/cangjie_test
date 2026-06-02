/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %export cjHeapSize=1gb && %run %run_opt %output %run_utest_opt %run_args

import std.collection.*

@Test
public class Test_AssertEqual_Collection_Equal {
    @TestCase
    func case_assert_equal_array(): Unit {
        let arr1 = ArrayList<Int64>(4 * 1024 * 1024, {i => i})
        let arr2 = ArrayList<Int64>(4 * 1024 * 1024, {i => i})
        let arr3 = Array<String>(1024 * 1024, repeat: "")
        let arr4 = Array<String>(1024 * 1024, repeat: "")
        @Expect(arr1, arr2)
        @Expect(arr3, arr4)
        @Expect(arr1[1024], arr2[1024])
        @Expect(arr3[0], arr4[1024])
    }

    @TestCase
    func case_assert_equal_hashmap(): Unit {
        let map1 = HashMap<String, Int64>(200000)
        let map2 = HashMap<String, Int64>(100000)
        let map3 = HashMap<Int64, Int64>(100000)
        let map4 = HashMap<Int64, Int64>(100000)
        for (i in 0..65536) {
            map1.add(i.toString(), i)
            map2.add(i.toString(), i)
            map3.add(i, i)
            map4.add(i, i)
        }
        @Expect(map1, map2)
        @Expect(map3, map4)
        @Expect(map1["1024"], map2["1024"])
    }

    @TestCase
    func case_assert_equal_linkedlist(): Unit {
        let list1 = LinkedList<Int64>(4 * 1024 * 1024, {i => i})
        let list2 = LinkedList<Int64>(4 * 1024 * 1024, {i => i})
        let list3 = LinkedList<String>(1024 * 1024, {i => i.toString()})
        let list4 = LinkedList<String>(1024 * 1024, {i => i.toString()})
        @Expect(list1, list2)
        @Expect(list3, list4)
        @Expect(list1.toArray(), list2.toArray())
    }

    @TestCase
    func case_assert_equal_hashset(): Unit {
        let set1 = HashSet<String>(200000)
        let set2 = HashSet<String>(100000)
        let set3 = HashSet<Int64>(100000)
        let set4 = HashSet<Int64>(100000)
        for (i in 0..65536) {
            set1.add(i.toString())
            set2.add(i.toString())
            set3.add(i)
            set4.add(i)
        }
        @Expect(set1, set2)
        @Expect(set3, set4)
    }

    @TestCase
    func case_assert_equal_treemap(): Unit {
        let map1 = TreeMap<String, Int64>()
        let map2 = TreeMap<String, Int64>()
        let map3 = TreeMap<Int64, Int64>()
        let map4 = TreeMap<Int64, Int64>()
        for (i in 0..65536) {
            map1.add(i.toString(), i)
            map2.add(i.toString(), i)
            map3.add(i, i)
            map4.add(i, i)
        }
        @Expect(map1, map2)
        @Expect(map3, map4)
        @Expect(map1["1024"], map2["1024"])
    }
}
