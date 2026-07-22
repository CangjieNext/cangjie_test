/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class CollectionToArrayTest {
    @TestCase
    func test_hashmap_toarray(): Unit {
        let map = HashMap<String, Int64>()
        @Expect(map.toArray().size == 0)
        map["a"] = 1
        map["b"] = 2
        let arr = map.toArray()
        @Expect(arr.size == 2)
    }

    @TestCase
    func test_hashmap_keys_toarray(): Unit {
        let map = HashMap<String, Int64>()
        map["x"] = 10
        map["y"] = 20
        let keys = map.keys().toArray()
        @Expect(keys.size == 2)
    }

    @TestCase
    func test_hashmap_values_toarray(): Unit {
        let map = HashMap<String, Int64>()
        map["x"] = 10
        map["y"] = 20
        let vals = map.values().toArray()
        @Expect(vals.size == 2)
    }

    @TestCase
    func test_hashset_toarray(): Unit {
        let set = HashSet<Int64>()
        @Expect(set.toArray().size == 0)
        set.add(1)
        set.add(2)
        set.add(3)
        let arr = set.toArray()
        @Expect(arr.size == 3)
    }

    @TestCase
    func test_arraylist_of(): Unit {
        let arr: Array<Int64> = [1, 2, 3]
        let list = ArrayList<Int64>.of(arr)
        @Expect(list.size == 3)
        @Expect(list[0] == 1)
        @Expect(list[2] == 3)
    }

    @TestCase
    func test_arraylist_first_last(): Unit {
        let list = ArrayList<Int64>()
        @Expect(list.first == None)
        @Expect(list.last == None)

        list.add(10)
        @Expect(list.first == Some(10))
        @Expect(list.last == Some(10))

        list.add(20)
        @Expect(list.first == Some(10))
        @Expect(list.last == Some(20))
    }

    @TestCase
    func test_arraylist_enumerate(): Unit {
        let list = ArrayList<Int64>()
        let empty = list.enumerate()
        @Expect(empty.size == 0)

        list.add(100)
        list.add(200)
        list.add(300)
        let pairs = list.enumerate()
        @Expect(pairs.size == 3)
        @Expect(pairs[0][0] == 0)
        @Expect(pairs[0][1] == 100)
        @Expect(pairs[2][0] == 2)
        @Expect(pairs[2][1] == 300)
    }

    @TestCase
    func test_linkedlist_enumerate(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(100)
        list.addLast(200)
        list.addLast(300)
        let pairs = list.enumerate()
        @Expect(pairs.size == 3)
        var idx = 0
        for (pair in pairs) {
            @Expect(pair[0] == idx)
            @Expect(pair[1] == Int64((idx + 1) * 100))
            idx++
        }
    }

    @TestCase
    func test_linkedlist_toarray(): Unit {
        let list = LinkedList<Int64>()
        @Expect(list.toArray().size == 0)
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        let arr = list.toArray()
        @Expect(arr.size == 3)
        @Expect(arr[0] == 1)
        @Expect(arr[2] == 3)
    }

    @TestCase
    func test_treemap_toarray(): Unit {
        let map = TreeMap<String, Int64>()
        @Expect(map.toArray().size == 0)
        map["c"] = 3
        map["a"] = 1
        map["b"] = 2
        let arr = map.toArray()
        @Expect(arr.size == 3)
        @Expect(arr[0][0] == "a")
        @Expect(arr[2][0] == "c")
    }
}
