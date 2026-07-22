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
public class CollectionEdgeApiTest {

    // === ArrayList.first / ArrayList.last ===
    @TestCase
    func test_arraylist_first_last(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        match (list.first) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        match (list.last) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_arraylist_first_empty(): Unit {
        let list = ArrayList<Int64>()
        match (list.first) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
        match (list.last) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arraylist_of(): Unit {
        let arr: Array<Int64> = [10, 20, 30]
        let list = ArrayList<Int64>.of(arr)
        @Expect(list.size, 3)
        @Expect(list[0], 10)
        @Expect(list[2], 30)
    }

    @TestCase
    func test_arraylist_enumerate(): Unit {
        let list = ArrayList<String>(["a", "b", "c"])
        let enumerated = list.enumerate()
        @Expect(enumerated.size, 3)
        @Expect(enumerated[0][1], "a")
        @Expect(enumerated[1][1], "b")
        @Expect(enumerated[2][1], "c")
        @Expect(enumerated[0][0], 0)
        @Expect(enumerated[2][0], 2)
    }

    @TestCase
    func test_arraylist_enumerate_empty(): Unit {
        let list = ArrayList<String>()
        let enumerated = list.enumerate()
        @Expect(enumerated.size, 0)
    }

    @TestCase
    func test_arraylist_toarray(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let arr = list.toArray()
        @Expect(arr.size, 3)
        @Expect(arr[0], 1)
        @Expect(arr[2], 3)
    }

    @TestCase
    func test_arraylist_toarray_empty(): Unit {
        let list = ArrayList<Int64>()
        let arr = list.toArray()
        @Expect(arr.size, 0)
    }

    @TestCase
    func test_arraylist_add_at(): Unit {
        let list = ArrayList<Int64>([1, 3])
        list.add(2, at: 1)
        @Expect(list.size, 3)
        @Expect(list[0], 1)
        @Expect(list[1], 2)
        @Expect(list[2], 3)
    }

    @TestCase
    func test_arraylist_capacity(): Unit {
        let list = ArrayList<Int64>(5)
        @Expect(list.capacity >= 5)
    }

    @TestCase
    func test_arraylist_init_with_capacity_negative(): Unit {
        try {
            let _ = ArrayList<Int64>(-1)
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_arraylist_init_with_function(): Unit {
        let list = ArrayList<Int64>(3, { i => i * 2 })
        @Expect(list.size, 3)
        @Expect(list[0], 0)
        @Expect(list[1], 2)
        @Expect(list[2], 4)
    }

    @TestCase
    func test_arraylist_zip(): Unit {
        let a = ArrayList<Int64>([1, 2, 3])
        let b = ArrayList<String>(["x", "y", "z"])
        let zipped = a.zip(b)
        @Expect(zipped.size, 3)
        @Expect(zipped[0][0], 1)
        @Expect(zipped[0][1], "x")
        @Expect(zipped[2][0], 3)
        @Expect(zipped[2][1], "z")
    }

    // === HashMap.toArray() ===
    @TestCase
    func test_hashmap_toarray(): Unit {
        let m = HashMap<String, Int64>()
        m["a"] = 1
        m["b"] = 2
        let arr = m.toArray()
        @Expect(arr.size, 2)
        // Order not guaranteed, check all keys present
        var foundA = false
        var foundB = false
        for (e in arr) {
            if (e[0] == "a" && e[1] == 1) {
                foundA = true
            }
            if (e[0] == "b" && e[1] == 2) {
                foundB = true
            }
        }
        @Assert(foundA && foundB)
    }

    @TestCase
    func test_hashmap_toarray_empty(): Unit {
        let m = HashMap<String, Int64>()
        let arr = m.toArray()
        @Expect(arr.size, 0)
    }

    @TestCase
    func test_hashmap_keys_toarray(): Unit {
        let m = HashMap<String, Int64>()
        m["k1"] = 10
        m["k2"] = 20
        let keys = m.keys()
        let arr = keys.toArray()
        @Expect(arr.size, 2)
    }

    @TestCase
    func test_hashmap_values_toarray(): Unit {
        let m = HashMap<String, Int64>()
        m["k1"] = 10
        m["k2"] = 20
        let vals = m.values()
        let arr = vals.toArray()
        @Expect(arr.size, 2)
    }

    @TestCase
    func test_hashmap_contains(): Unit {
        let m = HashMap<String, Int64>()
        m["key1"] = 100
        @Assert(m.contains("key1"))
        @Assert(!m.contains("nonexistent"))
    }

    @TestCase
    func test_hashmap_size(): Unit {
        let m = HashMap<String, Int64>()
        @Expect(m.size, 0)
        m["a"] = 1
        @Expect(m.size, 1)
        m["b"] = 2
        @Expect(m.size, 2)
    }

    // === HashSet.toArray() ===
    @TestCase
    func test_hashset_toarray(): Unit {
        let s = HashSet<Int64>()
        s.add(1)
        s.add(2)
        let arr = s.toArray()
        @Expect(arr.size, 2)
    }

    @TestCase
    func test_hashset_toarray_empty(): Unit {
        let s = HashSet<Int64>()
        let arr = s.toArray()
        @Expect(arr.size, 0)
    }

    @TestCase
    func test_hashset_contains(): Unit {
        let s = HashSet<String>()
        s.add("hello")
        @Assert(s.contains("hello"))
        @Assert(!s.contains("world"))
    }

    @TestCase
    func test_hashset_remove(): Unit {
        let s = HashSet<Int64>()
        s.add(1)
        s.add(2)
        @Assert(s.remove(1))
        @Assert(!s.contains(1))
        @Expect(s.size, 1)
        @Assert(!s.remove(999))
    }

    // === TreeMap ===
    @TestCase
    func test_treemap_first_last(): Unit {
        let m = TreeMap<String, Int64>()
        m["b"] = 2
        m["a"] = 1
        m["c"] = 3
        match (m.first) {
            case Some(e) => @Expect(e[0], "a")
            case None => @Assert(false)
        }
        match (m.last) {
            case Some(e) => @Expect(e[0], "c")
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_treemap_first_empty(): Unit {
        let m = TreeMap<String, Int64>()
        match (m.first) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
        match (m.last) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treemap_keys_values(): Unit {
        let m = TreeMap<Int64, String>()
        m[3] = "c"
        m[1] = "a"
        m[2] = "b"
        let ks = m.keys()
        @Expect(ks.size, 3)
        let vs = m.values()
        @Expect(vs.size, 3)
    }

    // === LinkedList ===
    @TestCase
    func test_linkedlist_first_last(): Unit {
        let ll = LinkedList<Int64>()
        ll.addLast(1)
        ll.addLast(2)
        ll.addLast(3)
        match (ll.first) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        match (ll.last) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_linkedlist_first_empty(): Unit {
        let ll = LinkedList<Int64>()
        match (ll.first) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
        match (ll.last) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_linkedlist_enumerate(): Unit {
        let ll = LinkedList<String>()
        ll.addLast("a")
        ll.addLast("b")
        let en = ll.enumerate()
        @Expect(en.size, 2)
    }

    @TestCase
    func test_linkedlist_toarray(): Unit {
        let ll = LinkedList<Int64>()
        ll.addLast(10)
        ll.addLast(20)
        let arr = ll.toArray()
        @Expect(arr.size, 2)
        @Expect(arr[0], 10)
        @Expect(arr[1], 20)
    }

    @TestCase
    func test_linkedlist_addfirst(): Unit {
        let ll = LinkedList<Int64>()
        ll.addFirst(1)
        ll.addFirst(2)
        match (ll.first) {
            case Some(v) => @Expect(v, 2)
            case None => @Assert(false)
        }
        match (ll.last) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_linkedlist_remove_first_last(): Unit {
        let ll = LinkedList<Int64>()
        ll.addLast(1)
        ll.addLast(2)
        ll.addLast(3)
        match (ll.removeFirst()) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Expect(ll.size, 2)
        match (ll.removeLast()) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
        @Expect(ll.size, 1)
    }

    // === ConcurrentModificationException ===
    @TestCase
    func test_arraylist_cme(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let it = list.iterator()
        let _ = it.next() // consume first
        list.add(4)        // modify list
        try {
            let _ = it.next()
            @Assert(false)
        } catch (e: ConcurrentModificationException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_arraylist_iterator_empty(): Unit {
        let list = ArrayList<Int64>()
        let it = list.iterator()
        match (it.next()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arraylist_clear(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        list.clear()
        @Expect(list.size, 0)
    }

    @TestCase
    func test_hashset_size_and_clear(): Unit {
        let s = HashSet<Int64>()
        s.add(1)
        s.add(2)
        @Expect(s.size, 2)
        s.clear()
        @Expect(s.size, 0)
    }

    @TestCase
    func test_treemap_contains_and_remove(): Unit {
        let m = TreeMap<String, Int64>()
        m["a"] = 1
        m["b"] = 2
        @Assert(m.contains("a"))
        m.remove("a")
        @Assert(!m.contains("a"))
        @Expect(m.size, 1)
    }

    @TestCase
    func test_arraylist_set(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        list[1] = 99
        @Expect(list[1], 99)
    }

    @TestCase
    func test_arraylist_iterator_loop(): Unit {
        let list = ArrayList<Int64>([10, 20, 30])
        var sum = 0
        for (v in list) {
            sum += v
        }
        @Expect(sum, 60)
    }

    @TestCase
    func test_hashmap_iterator_loop(): Unit {
        let m = HashMap<String, Int64>()
        m["a"] = 1
        m["b"] = 2
        var count = 0
        for (e in m) {
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func test_linkedlist_size(): Unit {
        let ll = LinkedList<Int64>()
        @Expect(ll.size, 0)
        ll.addLast(1)
        @Expect(ll.size, 1)
    }

    @TestCase
    func test_treemap_size(): Unit {
        let m = TreeMap<Int64, String>()
        @Expect(m.size, 0)
        m[1] = "a"
        @Expect(m.size, 1)
        m[2] = "b"
        @Expect(m.size, 2)
    }

    @TestCase
    func test_arraylist_add_all(): Unit {
        let list = ArrayList<Int64>([1, 2])
        list.add(all: ArrayList<Int64>([3, 4, 5]))
        @Expect(list.size, 5)
        @Expect(list[4], 5)
    }

    @TestCase
    func test_arraylist_add_all_empty(): Unit {
        let list = ArrayList<Int64>([1, 2])
        list.add(all: ArrayList<Int64>())
        @Expect(list.size, 2)
    }

    @TestCase
    func test_arraylist_get_out_of_range(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        match (list.get(5)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
        match (list.get(-1)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }
}
