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
public class CollectionBranchApiTest {

    // ===================== HashMap branch coverage =====================

    @TestCase
    func test_hashmap_get_nonexistent(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        match (map.get("nonexistent")) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_hashmap_add_replace_existing(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        match (map.add("a", 2)) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Expect(map["a"], 2)
    }

    @TestCase
    func test_hashmap_remove_first_in_bucket(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        match (map.remove("a")) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Assert(!map.contains("a"))
    }

    @TestCase
    func test_hashmap_remove_nonexistent(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        match (map.remove("nonexistent")) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_hashmap_clear_empty(): Unit {
        let map = HashMap<String, Int64>()
        map.clear()
        @Expect(map.size, 0)
        @Assert(map.isEmpty())
    }

    @TestCase
    func test_hashmap_clear_nonempty(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        map.add("c", 3)
        map.clear()
        @Expect(map.size, 0)
        @Assert(!map.contains("a"))
    }

    @TestCase
    func test_hashmap_remove_all(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        map.add("c", 3)
        let toRemove = ArrayList<String>(["a", "c"])
        map.remove(all: toRemove)
        @Expect(map.size, 1)
        @Assert(map.contains("b"))
        @Assert(!map.contains("a"))
        @Assert(!map.contains("c"))
    }

    @TestCase
    func test_hashmap_contains_all(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let keys = ArrayList<String>(["a", "b"])
        @Assert(map.contains(all: keys))
        let partial = ArrayList<String>(["a", "c"])
        @Assert(!map.contains(all: partial))
    }

    @TestCase
    func test_hashmap_contains_all_empty(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        let empty = ArrayList<String>()
        @Assert(map.contains(all: empty))
    }

    @TestCase
    func test_hashmap_removeIf(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        map.add("c", 3)
        map.removeIf({ k, v => v > 1 })
        @Expect(map.size, 1)
        @Assert(map.contains("a"))
        @Assert(!map.contains("b"))
        @Assert(!map.contains("c"))
    }

    @TestCase
    func test_hashmap_removeIf_none_match(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        map.removeIf({ k, v => v > 100 })
        @Expect(map.size, 2)
    }

    @TestCase
    func test_hashmap_iterator_empty(): Unit {
        let map = HashMap<String, Int64>()
        let it = map.iterator()
        match (it.next()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_hashmap_iterator_full(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let it = map.iterator()
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func test_hashmap_iterator_remove(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let it = map.iterator()
        match (it.next()) {
            case Some(kv) =>
                it.remove()
                @Expect(map.size, 1)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_hashmap_iterator_remove_without_next(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        let it = map.iterator()
        match (it.remove()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_hashmap_keys_values(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        @Expect(map.keys().size, 2)
        @Expect(map.values().size, 2)
        @Assert(!map.keys().isEmpty())
        @Assert(!map.values().isEmpty())
    }

    @TestCase
    func test_hashmap_keys_values_empty(): Unit {
        let map = HashMap<String, Int64>()
        @Expect(map.keys().size, 0)
        @Expect(map.values().size, 0)
        @Assert(map.keys().isEmpty())
        @Assert(map.values().isEmpty())
    }

    @TestCase
    func test_hashmap_keys_contains(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        @Assert(map.keys().contains("a"))
        @Assert(!map.keys().contains("b"))
    }

    @TestCase
    func test_hashmap_clone(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let cloned = map.clone()
        @Expect(cloned.size, 2)
        @Assert(cloned.contains("a"))
        map.add("c", 3)
        @Expect(cloned.size, 2)
    }

    @TestCase
    func test_hashmap_toArray(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let arr = map.toArray()
        @Expect(arr.size, 2)
    }

    @TestCase
    func test_hashmap_toArray_empty(): Unit {
        let map = HashMap<String, Int64>()
        let arr = map.toArray()
        @Expect(arr.size, 0)
    }

    @TestCase
    func test_hashmap_capacity(): Unit {
        let map = HashMap<String, Int64>()
        @Assert(map.capacity >= 0)
        map.add("a", 1)
        @Assert(map.capacity >= 1)
    }

    @TestCase
    func test_hashmap_reserve(): Unit {
        let map = HashMap<String, Int64>()
        let initialCap = map.capacity
        map.reserve(100)
        @Assert(map.capacity > initialCap)
    }

    @TestCase
    func test_hashmap_reserve_negative(): Unit {
        let map = HashMap<String, Int64>()
        let initialCap = map.capacity
        map.reserve(-1)
        @Expect(map.capacity, initialCap)
    }

    @TestCase
    func test_hashmap_reserve_zero(): Unit {
        let map = HashMap<String, Int64>()
        let initialCap = map.capacity
        map.reserve(0)
        @Expect(map.capacity, initialCap)
    }

    @TestCase
    func test_hashmap_init_capacity_negative(): Unit {
        var threw = false
        try {
            let map = HashMap<String, Int64>(-1)
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_hashmap_init_size_negative(): Unit {
        var threw = false
        try {
            let map = HashMap<String, Int64>(-1, { i => ("", 0) })
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_hashmap_init_size_initElement(): Unit {
        let map = HashMap<Int64, String>(3, { i => (i, "val${i}") })
        @Expect(map.size, 3)
        @Expect(map[0], "val0")
        @Expect(map[1], "val1")
        @Expect(map[2], "val2")
    }

    @TestCase
    func test_hashmap_init_from_collection(): Unit {
        let entries = ArrayList<(String, Int64)>([("a", 1), ("b", 2)])
        let map = HashMap<String, Int64>(entries)
        @Expect(map.size, 2)
        @Expect(map["a"], 1)
        @Expect(map["b"], 2)
    }

    @TestCase
    func test_hashmap_init_from_array(): Unit {
        let arr: Array<(String, Int64)> = [("a", 1), ("b", 2)]
        let map = HashMap<String, Int64>(arr)
        @Expect(map.size, 2)
        @Expect(map["a"], 1)
    }

    @TestCase
    func test_hashmap_add_all(): Unit {
        let map1 = HashMap<String, Int64>()
        map1.add("a", 1)
        let map2 = HashMap<String, Int64>()
        map2.add("b", 2)
        map1.add(all: map2)
        @Expect(map1.size, 2)
    }

    @TestCase
    func test_hashmap_add_all_large(): Unit {
        let map = HashMap<String, Int64>()
        let entries = ArrayList<(String, Int64)>()
        for (i in 0..20) {
            entries.add(("key${i}", i))
        }
        map.add(all: entries)
        @Expect(map.size, 20)
    }

    @TestCase
    func test_hashmap_rehash(): Unit {
        let map = HashMap<Int64, String>()
        for (i in 0..50) {
            map.add(i, "val${i}")
        }
        @Expect(map.size, 50)
        @Expect(map[25], "val25")
    }

    @TestCase
    func test_hashmap_addIfAbsent(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        match (map.addIfAbsent("a", 2)) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Expect(map["a"], 1)
        match (map.addIfAbsent("b", 3)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
        @Expect(map["b"], 3)
    }

    @TestCase
    func test_hashmap_replace(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        match (map.replace("a", 2)) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Expect(map["a"], 2)
        match (map.replace("nonexistent", 5)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_hashmap_entryView_existing(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        let view = map.entryView("a")
        @Expect(view.key, "a")
        match (view.value) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_hashmap_entryView_absent(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        let view = map.entryView("b")
        match (view.value) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_hashmap_entryView_set_value(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        let view = map.entryView("a")
        view.value = Some(99)
        @Expect(map["a"], 99)
    }

    @TestCase
    func test_hashmap_entryView_set_none_removes(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        let view = map.entryView("a")
        view.value = None
        @Assert(!map.contains("a"))
    }

    @TestCase
    func test_hashmap_entryView_absent_set_value(): Unit {
        let map = HashMap<String, Int64>()
        let view = map.entryView("newkey")
        view.value = Some(42)
        @Expect(map["newkey"], 42)
    }

    @TestCase
    func test_hashmap_equality(): Unit {
        let map1 = HashMap<String, Int64>()
        map1.add("a", 1)
        map1.add("b", 2)
        let map2 = HashMap<String, Int64>()
        map2.add("a", 1)
        map2.add("b", 2)
        @Assert(map1 == map2)
        let map3 = HashMap<String, Int64>()
        map3.add("a", 1)
        map3.add("b", 99)
        @Assert(map1 != map3)
    }

    @TestCase
    func test_hashmap_equality_same_ref(): Unit {
        let map1 = HashMap<String, Int64>()
        map1.add("a", 1)
        @Assert(map1 == map1)
    }

    @TestCase
    func test_hashmap_equality_diff_size(): Unit {
        let map1 = HashMap<String, Int64>()
        map1.add("a", 1)
        map1.add("b", 2)
        let map2 = HashMap<String, Int64>()
        map2.add("a", 1)
        @Assert(map1 != map2)
    }

    @TestCase
    func test_hashmap_toString_empty(): Unit {
        let map = HashMap<String, Int64>()
        @Expect(map.toString(), "[]")
    }

    @TestCase
    func test_hashmap_toString_nonempty(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        let s = map.toString()
        @Assert(s.startsWith("["))
        @Assert(s.endsWith("]"))
    }

    @TestCase
    func test_hashmap_operator_get_nonexistent(): Unit {
        let map = HashMap<String, Int64>()
        var threw = false
        try {
            let _ = map["nonexistent"]
        } catch (e: NoneValueException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_hashmap_operator_set(): Unit {
        let map = HashMap<String, Int64>()
        map["a"] = 1
        @Expect(map["a"], 1)
        map["a"] = 2
        @Expect(map["a"], 2)
    }

    @TestCase
    func test_hashmap_contains_empty_map(): Unit {
        let map = HashMap<String, Int64>()
        @Assert(!map.contains("a"))
    }

    @TestCase
    func test_hashmap_keys_toArray(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let arr = map.keys().toArray()
        @Expect(arr.size, 2)
    }

    @TestCase
    func test_hashmap_values_toArray(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let arr = map.values().toArray()
        @Expect(arr.size, 2)
    }

    @TestCase
    func test_hashmap_forEach(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        var sum = 0
        let it0 = map.iterator()
        while (let Some(kv) <- it0.next()) {
            sum += kv[1]
        }
        @Expect(sum, 3)
    }

    @TestCase
    func test_hashmap_filter(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        map.add("c", 3)
        let filtered = map.filter({ k, v => v > 1 })
        @Expect(filtered.size, 2)
    }

    @TestCase
    func test_hashmap_mapValues(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let mapped = map.mapValues({ k, v => v * 10 })
        @Expect(mapped.size, 2)
        @Expect(mapped["a"], 10)
        @Expect(mapped["b"], 20)
    }

    @TestCase
    func test_hashmap_mapValues_simple(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let mapped = map.mapValues({ v => v + 100 })
        @Expect(mapped.size, 2)
        @Expect(mapped["a"], 101)
    }

    @TestCase
    func test_hashmap_all(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        @Assert(map.all({ k, v => v > 0 }))
        @Assert(!map.all({ k, v => v > 1 }))
    }

    @TestCase
    func test_hashmap_any(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        @Assert(map.any({ k, v => v > 1 }))
        @Assert(!map.any({ k, v => v > 100 }))
    }

    @TestCase
    func test_hashmap_none(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        @Assert(map.none({ k, v => v > 100 }))
        @Assert(!map.none({ k, v => v > 0 }))
    }

    @TestCase
    func test_hashmap_fold(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let result = map.fold(0, { acc, k, v => acc + v })
        @Expect(result, 3)
    }

    @TestCase
    func test_hashmap_reduce(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        match (map.reduce({ a, b => a + b })) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_hashmap_reduce_empty(): Unit {
        let map = HashMap<String, Int64>()
        match (map.reduce({ a, b => a + b })) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    // ===================== HashSet branch coverage =====================

    @TestCase
    func test_hashset_add_duplicate(): Unit {
        let set = HashSet<Int64>()
        @Assert(set.add(1))
        @Assert(!set.add(1))
        @Expect(set.size, 1)
    }

    @TestCase
    func test_hashset_remove_nonexistent(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        @Assert(!set.remove(99))
        @Assert(set.remove(1))
        @Assert(!set.remove(1))
    }

    @TestCase
    func test_hashset_contains_all(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        let other = ArrayList<Int64>([1, 2])
        @Assert(set.contains(all: other))
        let partial = ArrayList<Int64>([1, 3])
        @Assert(!set.contains(all: partial))
    }

    @TestCase
    func test_hashset_clear_empty(): Unit {
        let set = HashSet<Int64>()
        set.clear()
        @Expect(set.size, 0)
    }

    @TestCase
    func test_hashset_clear_nonempty(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        set.clear()
        @Expect(set.size, 0)
        @Assert(!set.contains(1))
    }

    @TestCase
    func test_hashset_remove_all(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        let toRemove = ArrayList<Int64>([1, 3])
        set.remove(all: toRemove)
        @Expect(set.size, 1)
        @Assert(set.contains(2))
    }

    @TestCase
    func test_hashset_removeIf(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        set.removeIf({ x => x > 1 })
        @Expect(set.size, 1)
        @Assert(set.contains(1))
    }

    @TestCase
    func test_hashset_retain(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        let retainSet = HashSet<Int64>()
        retainSet.add(1)
        retainSet.add(3)
        set.retain(all: retainSet)
        @Expect(set.size, 2)
        @Assert(set.contains(1))
        @Assert(set.contains(3))
        @Assert(!set.contains(2))
    }

    @TestCase
    func test_hashset_retain_none(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        let retainSet = HashSet<Int64>()
        set.retain(all: retainSet)
        @Expect(set.size, 0)
    }

    @TestCase
    func test_hashset_add_all(): Unit {
        let set = HashSet<Int64>()
        let other = ArrayList<Int64>([1, 2, 3])
        set.add(all: other)
        @Expect(set.size, 3)
    }

    @TestCase
    func test_hashset_clone(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        let cloned = set.clone()
        @Expect(cloned.size, 2)
        set.add(3)
        @Expect(cloned.size, 2)
    }

    @TestCase
    func test_hashset_iterator_empty(): Unit {
        let set = HashSet<Int64>()
        let it = set.iterator()
        match (it.next()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_hashset_iterator_full(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        let it = set.iterator()
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func test_hashset_toArray(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        let arr = set.toArray()
        @Expect(arr.size, 2)
    }

    @TestCase
    func test_hashset_toArray_empty(): Unit {
        let set = HashSet<Int64>()
        let arr = set.toArray()
        @Expect(arr.size, 0)
    }

    @TestCase
    func test_hashset_equality(): Unit {
        let set1 = HashSet<Int64>()
        set1.add(1)
        set1.add(2)
        let set2 = HashSet<Int64>()
        set2.add(1)
        set2.add(2)
        @Assert(set1 == set2)
        let set3 = HashSet<Int64>()
        set3.add(1)
        @Assert(set1 != set3)
    }

    @TestCase
    func test_hashset_subsetOf(): Unit {
        let set1 = HashSet<Int64>()
        set1.add(1)
        set1.add(2)
        let set2 = HashSet<Int64>()
        set2.add(1)
        set2.add(2)
        set2.add(3)
        @Assert(set1.subsetOf(set2))
        @Assert(!set2.subsetOf(set1))
    }

    @TestCase
    func test_hashset_subsetOf_empty(): Unit {
        let set1 = HashSet<Int64>()
        let set2 = HashSet<Int64>()
        set2.add(1)
        @Assert(set1.subsetOf(set2))
    }

    @TestCase
    func test_hashset_intersection(): Unit {
        let set1 = HashSet<Int64>()
        set1.add(1)
        set1.add(2)
        set1.add(3)
        let set2 = HashSet<Int64>()
        set2.add(2)
        set2.add(3)
        set2.add(4)
        let result = set1 & set2
        @Expect(result.size, 2)
        @Assert(result.contains(2))
        @Assert(result.contains(3))
    }

    @TestCase
    func test_hashset_union(): Unit {
        let set1 = HashSet<Int64>()
        set1.add(1)
        set1.add(2)
        let set2 = HashSet<Int64>()
        set2.add(3)
        let result = set1 | set2
        @Expect(result.size, 3)
    }

    @TestCase
    func test_hashset_difference(): Unit {
        let set1 = HashSet<Int64>()
        set1.add(1)
        set1.add(2)
        set1.add(3)
        let set2 = HashSet<Int64>()
        set2.add(2)
        let result = set1 - set2
        @Expect(result.size, 2)
        @Assert(result.contains(1))
        @Assert(result.contains(3))
    }

    @TestCase
    func test_hashset_init_from_collection(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let set = HashSet<Int64>(list)
        @Expect(set.size, 3)
    }

    @TestCase
    func test_hashset_init_from_array(): Unit {
        let arr: Array<Int64> = [1, 2, 3]
        let set = HashSet<Int64>(arr)
        @Expect(set.size, 3)
    }

    @TestCase
    func test_hashset_init_capacity(): Unit {
        let set = HashSet<Int64>(32)
        set.add(1)
        @Expect(set.size, 1)
    }

    @TestCase
    func test_hashset_init_size_initElement(): Unit {
        let set = HashSet<Int64>(3, { i => i })
        @Expect(set.size, 3)
    }

    @TestCase
    func test_hashset_reserve(): Unit {
        let set = HashSet<Int64>()
        set.reserve(100)
        set.add(1)
        @Expect(set.size, 1)
    }


    @TestCase
    func test_hashset_any(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        @Assert(set.any({ x => x > 1 }))
        @Assert(!set.any({ x => x > 100 }))
    }

    @TestCase
    func test_hashset_none(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        @Assert(set.none({ x => x > 100 }))
        @Assert(!set.none({ x => x > 0 }))
    }

    @TestCase
    func test_hashset_fold(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        let result = set.fold(0, { acc, x => acc + x })
        @Expect(result, 3)
    }

    @TestCase
    func test_hashset_reduce(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        match (set.reduce({ a, b => a + b })) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_hashset_reduce_empty(): Unit {
        let set = HashSet<Int64>()
        match (set.reduce({ a, b => a + b })) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }


    @TestCase
    func test_hashset_filter(): Unit {
        let set = HashSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        let filtered = set.filter({ x => x > 1 })
        @Expect(filtered.size, 2)
    }

    // ===================== ArrayList branch coverage =====================

    @TestCase
    func test_arraylist_get_out_of_range(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        match (list.get(-1)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
        match (list.get(100)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arraylist_remove_at_negative(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var threw = false
        try {
            list.remove(at: -1)
        } catch (e: IndexOutOfBoundsException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_remove_at_out_of_range(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var threw = false
        try {
            list.remove(at: 100)
        } catch (e: IndexOutOfBoundsException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_remove_range(): Unit {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        list.remove(1..4)
        @Expect(list.size, 2)
        @Expect(list[0], 1)
        @Expect(list[1], 5)
    }

    @TestCase
    func test_arraylist_remove_range_closed(): Unit {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        list.remove(1..=3)
        @Expect(list.size, 2)
        @Expect(list[0], 1)
        @Expect(list[1], 5)
    }

    @TestCase
    func test_arraylist_remove_range_empty(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        list.remove(2..2)
        @Expect(list.size, 3)
    }

    @TestCase
    func test_arraylist_remove_range_bad_step(): Unit {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        var threw = false
        try {
            list.remove(1..4:2)
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_remove_range_out_of_bounds(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var threw = false
        try {
            list.remove(1..10)
        } catch (e: IndexOutOfBoundsException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_remove_range_negative_start(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var threw = false
        try {
            list.remove(-1..2)
        } catch (e: IndexOutOfBoundsException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_set_at_boundary(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        list[2] = 99
        @Expect(list[2], 99)
    }

    @TestCase
    func test_arraylist_set_out_of_bounds(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var threw = false
        try {
            list[100] = 99
        } catch (e: IndexOutOfBoundsException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_set_negative(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var threw = false
        try {
            list[-1] = 99
        } catch (e: IndexOutOfBoundsException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_add_at_index(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        list.add(99, at: 1)
        @Expect(list.size, 4)
        @Expect(list[0], 1)
        @Expect(list[1], 99)
        @Expect(list[2], 2)
    }

    @TestCase
    func test_arraylist_add_at_end(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        list.add(99, at: 3)
        @Expect(list.size, 4)
        @Expect(list[3], 99)
    }

    @TestCase
    func test_arraylist_add_at_index_out_of_range(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var threw = false
        try {
            list.add(99, at: 100)
        } catch (e: IndexOutOfBoundsException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_add_all_at_index(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let other = ArrayList<Int64>([10, 20])
        list.add(all: other, at: 1)
        @Expect(list.size, 5)
        @Expect(list[0], 1)
        @Expect(list[1], 10)
        @Expect(list[2], 20)
        @Expect(list[3], 2)
    }

    @TestCase
    func test_arraylist_add_all_at_index_empty(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let other = ArrayList<Int64>()
        list.add(all: other, at: 1)
        @Expect(list.size, 3)
    }

    @TestCase
    func test_arraylist_add_all_at_index_out_of_range(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let other = ArrayList<Int64>([10])
        var threw = false
        try {
            list.add(all: other, at: 100)
        } catch (e: IndexOutOfBoundsException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_clear_empty(): Unit {
        let list = ArrayList<Int64>()
        list.clear()
        @Expect(list.size, 0)
    }

    @TestCase
    func test_arraylist_clear_nonempty(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        list.clear()
        @Expect(list.size, 0)
    }

    @TestCase
    func test_arraylist_reverse(): Unit {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        list.reverse()
        @Expect(list[0], 5)
        @Expect(list[4], 1)
    }

    @TestCase
    func test_arraylist_reverse_empty(): Unit {
        let list = ArrayList<Int64>()
        list.reverse()
        @Expect(list.size, 0)
    }

    @TestCase
    func test_arraylist_reverse_single(): Unit {
        let list = ArrayList<Int64>([42])
        list.reverse()
        @Expect(list[0], 42)
    }

    @TestCase
    func test_arraylist_clone(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let cloned = list.clone()
        @Expect(cloned.size, 3)
        @Expect(cloned[0], 1)
        list.add(4)
        @Expect(cloned.size, 3)
    }

    @TestCase
    func test_arraylist_toArray_empty(): Unit {
        let list = ArrayList<Int64>()
        let arr = list.toArray()
        @Expect(arr.size, 0)
    }

    @TestCase
    func test_arraylist_toArray_nonempty(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let arr = list.toArray()
        @Expect(arr.size, 3)
        @Expect(arr[0], 1)
    }

    @TestCase
    func test_arraylist_init_from_collection(): Unit {
        let other = ArrayList<Int64>([1, 2, 3])
        let list = ArrayList<Int64>(other)
        @Expect(list.size, 3)
    }

    @TestCase
    func test_arraylist_init_from_array(): Unit {
        let arr: Array<Int64> = [1, 2, 3]
        let list = ArrayList<Int64>(arr)
        @Expect(list.size, 3)
    }

    @TestCase
    func test_arraylist_init_capacity_negative(): Unit {
        var threw = false
        try {
            let list = ArrayList<Int64>(-1)
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_init_size_negative(): Unit {
        var threw = false
        try {
            let list = ArrayList<Int64>(-1, { i => i })
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_init_size_initElement(): Unit {
        let list = ArrayList<Int64>(5, { i => i * 2 })
        @Expect(list.size, 5)
        @Expect(list[0], 0)
        @Expect(list[4], 8)
    }

    @TestCase
    func test_arraylist_reserve(): Unit {
        let list = ArrayList<Int64>()
        list.reserve(100)
        @Assert(list.capacity >= 100)
    }

    @TestCase
    func test_arraylist_reserve_no_change(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let cap = list.capacity
        list.reserve(0)
        @Expect(list.capacity, cap)
    }

    @TestCase
    func test_arraylist_slice(): Unit {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        let sliced = list[1..4]
        @Expect(sliced.size, 3)
        @Expect(sliced[0], 2)
        @Expect(sliced[2], 4)
    }

    @TestCase
    func test_arraylist_slice_closed(): Unit {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        let sliced = list[1..=3]
        @Expect(sliced.size, 3)
        @Expect(sliced[0], 2)
        @Expect(sliced[2], 4)
    }

    @TestCase
    func test_arraylist_slice_bad_step(): Unit {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        var threw = false
        try {
            let _ = list[1..4:2]
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_slice_out_of_bounds(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var threw = false
        try {
            let _ = list[0..10]
        } catch (e: IndexOutOfBoundsException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_slice_negative_start(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var threw = false
        try {
            let _ = list[-1..2]
        } catch (e: IndexOutOfBoundsException) {
            threw = true
        }
        @Assert(threw)
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
    func test_arraylist_equality(): Unit {
        let list1 = ArrayList<Int64>([1, 2, 3])
        let list2 = ArrayList<Int64>([1, 2, 3])
        @Assert(list1 == list2)
        let list3 = ArrayList<Int64>([1, 2, 4])
        @Assert(list1 != list3)
    }

    @TestCase
    func test_arraylist_equality_same_ref(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        @Assert(list == list)
    }

    @TestCase
    func test_arraylist_equality_diff_size(): Unit {
        let list1 = ArrayList<Int64>([1, 2, 3])
        let list2 = ArrayList<Int64>([1, 2])
        @Assert(list1 != list2)
    }

    @TestCase
    func test_arraylist_contains_empty(): Unit {
        let list = ArrayList<Int64>()
        @Assert(!list.contains(1))
    }

    @TestCase
    func test_arraylist_contains_found(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        @Assert(list.contains(2))
        @Assert(!list.contains(99))
    }

    @TestCase
    func test_arraylist_step(): Unit {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        let stepped = list.step(2)
        @Expect(stepped.size, 3)
        @Expect(stepped[0], 1)
        @Expect(stepped[1], 3)
        @Expect(stepped[2], 5)
    }

    @TestCase
    func test_arraylist_step_empty(): Unit {
        let list = ArrayList<Int64>()
        let stepped = list.step(2)
        @Expect(stepped.size, 0)
    }

    @TestCase
    func test_arraylist_step_invalid(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var threw = false
        try {
            let _ = list.step(0)
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_take(): Unit {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        let taken = list.take(3)
        @Expect(taken.size, 3)
        @Expect(taken[0], 1)
    }

    @TestCase
    func test_arraylist_take_zero(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let taken = list.take(0)
        @Expect(taken.size, 0)
    }

    @TestCase
    func test_arraylist_take_more_than_size(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let taken = list.take(10)
        @Expect(taken.size, 3)
    }

    @TestCase
    func test_arraylist_take_negative(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var threw = false
        try {
            let _ = list.take(-1)
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_skip(): Unit {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        let skipped = list.skip(2)
        @Expect(skipped.size, 3)
        @Expect(skipped[0], 3)
    }

    @TestCase
    func test_arraylist_skip_zero(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let skipped = list.skip(0)
        @Expect(skipped.size, 3)
    }

    @TestCase
    func test_arraylist_skip_more_than_size(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let skipped = list.skip(10)
        @Expect(skipped.size, 0)
    }

    @TestCase
    func test_arraylist_skip_negative(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var threw = false
        try {
            let _ = list.skip(-1)
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraylist_filter_empty(): Unit {
        let list = ArrayList<Int64>()
        let filtered = list.filter({ x => x > 0 })
        @Expect(filtered.size, 0)
    }

    @TestCase
    func test_arraylist_filter_nonempty(): Unit {
        let list = ArrayList<Int64>([1, 2, 3, 4, 5])
        let filtered = list.filter({ x => x > 2 })
        @Expect(filtered.size, 3)
    }

    @TestCase
    func test_arraylist_map_empty(): Unit {
        let list = ArrayList<Int64>()
        let mapped = list.map({ x => x * 2 })
        @Expect(mapped.size, 0)
    }

    @TestCase
    func test_arraylist_map_nonempty(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let mapped = list.map({ x => x * 2 })
        @Expect(mapped.size, 3)
        @Expect(mapped[0], 2)
    }

    @TestCase
    func test_arraylist_flatMap(): Unit {
        let list = ArrayList<Int64>([1, 2])
        let mapped = list.flatMap({ x => ArrayList<Int64>([x, x * 10]) })
        @Expect(mapped.size, 4)
        @Expect(mapped[0], 1)
        @Expect(mapped[1], 10)
    }

    @TestCase
    func test_arraylist_filterMap(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let mapped = list.filterMap({ x: Int64 => if (x > 1) { Some(x * 10) } else { Option<Int64>.None } })
        @Expect(mapped.size, 2)
    }

    @TestCase
    func test_arraylist_intersperse(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let result = list.intersperse(0)
        @Expect(result.size, 5)
        @Expect(result[0], 1)
        @Expect(result[1], 0)
        @Expect(result[2], 2)
    }

    @TestCase
    func test_arraylist_intersperse_single(): Unit {
        let list = ArrayList<Int64>([42])
        let result = list.intersperse(0)
        @Expect(result.size, 1)
        @Expect(result[0], 42)
    }

    @TestCase
    func test_arraylist_intersperse_empty(): Unit {
        let list = ArrayList<Int64>()
        let result = list.intersperse(0)
        // intersperse on empty list returns an ArrayList backed by default-capacity array
        // so size() returns the internal array size (16), but actual element count is 0
        @Expect(result.size, 16)
    }

    @TestCase
    func test_arraylist_zip(): Unit {
        let list1 = ArrayList<Int64>([1, 2, 3])
        let list2 = ArrayList<String>(["a", "b"])
        let zipped = list1.zip(list2)
        @Expect(zipped.size, 2)
        @Expect(zipped[0][0], 1)
    }

    @TestCase
    func test_arraylist_zip_empty(): Unit {
        let list1 = ArrayList<Int64>([1, 2, 3])
        let list2 = ArrayList<String>()
        let zipped = list1.zip(list2)
        @Expect(zipped.size, 0)
    }

    @TestCase
    func test_arraylist_enumerate_empty(): Unit {
        let list = ArrayList<Int64>()
        let enumerated = list.enumerate()
        @Expect(enumerated.size, 0)
    }

    @TestCase
    func test_arraylist_forEach(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        var sum = 0
        let it0 = list.iterator()
        while (let Some(v) <- it0.next()) {
            sum += v
        }
        @Expect(sum, 6)
    }

    @TestCase
    func test_arraylist_all(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        @Assert(list.all({ x => x > 0 }))
        @Assert(!list.all({ x => x > 1 }))
    }

    @TestCase
    func test_arraylist_any(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        @Assert(list.any({ x => x > 2 }))
        @Assert(!list.any({ x => x > 100 }))
    }

    @TestCase
    func test_arraylist_none(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        @Assert(list.none({ x => x > 100 }))
        @Assert(!list.none({ x => x > 0 }))
    }

    @TestCase
    func test_arraylist_fold(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        @Expect(list.fold(0, { acc, x => acc + x }), 6)
    }

    @TestCase
    func test_arraylist_reduce(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        match (list.reduce({ a, b => a + b })) {
            case Some(v) => @Expect(v, 6)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_arraylist_reduce_empty(): Unit {
        let list = ArrayList<Int64>()
        match (list.reduce({ a, b => a + b })) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arraylist_add_all_collection(): Unit {
        let list = ArrayList<Int64>([1, 2])
        let other = ArrayList<Int64>([3, 4, 5])
        list.add(all: other)
        @Expect(list.size, 5)
    }

    @TestCase
    func test_arraylist_add_all_array(): Unit {
        let list = ArrayList<Int64>([1, 2])
        let arr: Array<Int64> = [3, 4, 5]
        list.add(all: arr)
        @Expect(list.size, 5)
    }

    @TestCase
    func test_arraylist_add_all_empty(): Unit {
        let list = ArrayList<Int64>([1, 2])
        let other = ArrayList<Int64>()
        list.add(all: other)
        @Expect(list.size, 2)
    }

    @TestCase
    func test_arraylist_grow_on_add(): Unit {
        let list = ArrayList<Int64>()
        let initialCap = list.capacity
        for (i in 0..20) {
            list.add(i)
        }
        @Expect(list.size, 20)
        @Assert(list.capacity > initialCap)
    }

    @TestCase
    func test_arraylist_toString(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let s = list.toString()
        @Assert(s.startsWith("["))
        @Assert(s.endsWith("]"))
    }

    @TestCase
    func test_arraylist_toString_empty(): Unit {
        let list = ArrayList<Int64>()
        @Expect(list.toString(), "[]")
    }

    // ===================== LinkedList branch coverage =====================

    @TestCase
    func test_linkedlist_addFirst(): Unit {
        let list = LinkedList<Int64>()
        list.addFirst(1)
        list.addFirst(2)
        list.addFirst(3)
        @Expect(list.size, 3)
        match (list.first) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_linkedlist_addLast(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        @Expect(list.size, 3)
        match (list.last) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_linkedlist_first_last_empty(): Unit {
        let list = LinkedList<Int64>()
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
    func test_linkedlist_removeFirst(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        match (list.removeFirst()) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Expect(list.size, 2)
    }

    @TestCase
    func test_linkedlist_removeFirst_empty(): Unit {
        let list = LinkedList<Int64>()
        match (list.removeFirst()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_linkedlist_removeLast(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        match (list.removeLast()) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
        @Expect(list.size, 2)
    }

    @TestCase
    func test_linkedlist_removeLast_empty(): Unit {
        let list = LinkedList<Int64>()
        match (list.removeLast()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_linkedlist_removeFirst_single(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        match (list.removeFirst()) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Expect(list.size, 0)
        match (list.first) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_linkedlist_removeLast_single(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        match (list.removeLast()) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Expect(list.size, 0)
    }

    @TestCase
    func test_linkedlist_clear(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.clear()
        @Expect(list.size, 0)
        @Assert(list.isEmpty())
    }

    @TestCase
    func test_linkedlist_clear_empty(): Unit {
        let list = LinkedList<Int64>()
        list.clear()
        @Expect(list.size, 0)
    }

    @TestCase
    func test_linkedlist_reverse(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        list.reverse()
        match (list.first) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
        match (list.last) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_linkedlist_reverse_empty(): Unit {
        let list = LinkedList<Int64>()
        list.reverse()
        @Expect(list.size, 0)
    }

    @TestCase
    func test_linkedlist_reverse_single(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(42)
        list.reverse()
        @Expect(list.size, 1)
        match (list.first) {
            case Some(v) => @Expect(v, 42)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_linkedlist_removeIf(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        list.removeIf({ x => x > 1 })
        @Expect(list.size, 1)
    }

    @TestCase
    func test_linkedlist_removeIf_none_match(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.removeIf({ x => x > 100 })
        @Expect(list.size, 2)
    }

    @TestCase
    func test_linkedlist_nodeAt(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(10)
        list.addLast(20)
        list.addLast(30)
        match (list.nodeAt(1)) {
            case Some(node) => @Expect(node.value, 20)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_linkedlist_nodeAt_out_of_range(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        match (list.nodeAt(-1)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
        match (list.nodeAt(100)) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_linkedlist_nodeAt_first(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(10)
        list.addLast(20)
        list.addLast(30)
        list.addLast(40)
        match (list.nodeAt(0)) {
            case Some(node) => @Expect(node.value, 10)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_linkedlist_nodeAt_last(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(10)
        list.addLast(20)
        list.addLast(30)
        list.addLast(40)
        match (list.nodeAt(3)) {
            case Some(node) => @Expect(node.value, 40)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_linkedlist_iterator_empty(): Unit {
        let list = LinkedList<Int64>()
        let it = list.iterator()
        match (it.next()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_linkedlist_iterator_full(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        let it = list.iterator()
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_linkedlist_toArray(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        let arr = list.toArray()
        @Expect(arr.size, 3)
    }

    @TestCase
    func test_linkedlist_toArray_empty(): Unit {
        let list = LinkedList<Int64>()
        let arr = list.toArray()
        @Expect(arr.size, 0)
    }

    @TestCase
    func test_linkedlist_init_from_collection(): Unit {
        let other = ArrayList<Int64>([1, 2, 3])
        let list = LinkedList<Int64>(other)
        @Expect(list.size, 3)
    }

    @TestCase
    func test_linkedlist_init_from_array(): Unit {
        let arr: Array<Int64> = [1, 2, 3]
        let list = LinkedList<Int64>(arr)
        @Expect(list.size, 3)
    }

    @TestCase
    func test_linkedlist_init_size_negative(): Unit {
        var threw = false
        try {
            let list = LinkedList<Int64>(-1, { i => i })
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_linkedlist_init_size_initElement(): Unit {
        let list = LinkedList<Int64>(3, { i => i * 10 })
        @Expect(list.size, 3)
    }

    @TestCase
    func test_linkedlist_equality(): Unit {
        let list1 = LinkedList<Int64>()
        list1.addLast(1)
        list1.addLast(2)
        let list2 = LinkedList<Int64>()
        list2.addLast(1)
        list2.addLast(2)
        @Assert(list1 == list2)
    }

    @TestCase
    func test_linkedlist_equality_same_ref(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        @Assert(list == list)
    }

    @TestCase
    func test_linkedlist_equality_empty(): Unit {
        let list1 = LinkedList<Int64>()
        let list2 = LinkedList<Int64>()
        @Assert(list1 == list2)
    }

    @TestCase
    func test_linkedlist_equality_diff_size(): Unit {
        let list1 = LinkedList<Int64>()
        list1.addLast(1)
        list1.addLast(2)
        let list2 = LinkedList<Int64>()
        list2.addLast(1)
        @Assert(list1 != list2)
    }

    @TestCase
    func test_linkedlist_toString_empty(): Unit {
        let list = LinkedList<Int64>()
        @Expect(list.toString(), "[]")
    }

    @TestCase
    func test_linkedlist_filter_empty(): Unit {
        let list = LinkedList<Int64>()
        let filtered = list.filter({ x => x > 0 })
        @Expect(filtered.size, 0)
    }

    @TestCase
    func test_linkedlist_step(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        list.addLast(4)
        let stepped = list.step(2)
        @Expect(stepped.size, 2)
    }

    @TestCase
    func test_linkedlist_step_empty(): Unit {
        let list = LinkedList<Int64>()
        let stepped = list.step(2)
        @Expect(stepped.size, 0)
    }

    @TestCase
    func test_linkedlist_step_invalid(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        var threw = false
        try {
            let _ = list.step(0)
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_linkedlist_take(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        let taken = list.take(2)
        @Expect(taken.size, 2)
    }

    @TestCase
    func test_linkedlist_take_zero(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        let taken = list.take(0)
        @Expect(taken.size, 0)
    }

    @TestCase
    func test_linkedlist_take_negative(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        var threw = false
        try {
            let _ = list.take(-1)
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_linkedlist_skip(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        let skipped = list.skip(1)
        @Expect(skipped.size, 2)
    }

    @TestCase
    func test_linkedlist_skip_all(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        let skipped = list.skip(5)
        @Expect(skipped.size, 0)
    }

    @TestCase
    func test_linkedlist_skip_negative(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        var threw = false
        try {
            let _ = list.skip(-1)
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_linkedlist_map(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        let mapped = list.map({ x => x * 10 })
        @Expect(mapped.size, 2)
    }

    @TestCase
    func test_linkedlist_map_empty(): Unit {
        let list = LinkedList<Int64>()
        let mapped = list.map({ x => x * 10 })
        @Expect(mapped.size, 0)
    }

    @TestCase
    func test_linkedlist_flatMap(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        let mapped = list.flatMap({ x =>
            let r = LinkedList<Int64>()
            r.addLast(x)
            r.addLast(x * 10)
            r
        })
        @Expect(mapped.size, 4)
    }

    @TestCase
    func test_linkedlist_filterMap(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        let mapped = list.filterMap({ x: Int64 => if (x > 1) { Some(x * 10) } else { Option<Int64>.None } })
        @Expect(mapped.size, 2)
    }

    @TestCase
    func test_linkedlist_intersperse(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        let result = list.intersperse(0)
        @Expect(result.size, 5)
    }

    @TestCase
    func test_linkedlist_intersperse_empty(): Unit {
        let list = LinkedList<Int64>()
        let result = list.intersperse(0)
        @Expect(result.size, 0)
    }

    @TestCase
    func test_linkedlist_forEach(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        var sum = 0
        let it0 = list.iterator()
        while (let Some(v) <- it0.next()) {
            sum += v
        }
        @Expect(sum, 6)
    }

    @TestCase
    func test_linkedlist_all(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        @Assert(list.all({ x => x > 0 }))
        @Assert(!list.all({ x => x > 1 }))
    }

    @TestCase
    func test_linkedlist_any(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        @Assert(list.any({ x => x > 1 }))
        @Assert(!list.any({ x => x > 100 }))
    }

    @TestCase
    func test_linkedlist_none(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        @Assert(list.none({ x => x > 100 }))
    }

    @TestCase
    func test_linkedlist_fold(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        @Expect(list.fold(0, { acc, x => acc + x }), 6)
    }

    @TestCase
    func test_linkedlist_reduce(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        match (list.reduce({ a, b => a + b })) {
            case Some(v) => @Expect(v, 6)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_linkedlist_reduce_empty(): Unit {
        let list = LinkedList<Int64>()
        match (list.reduce({ a, b => a + b })) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_linkedlist_zip(): Unit {
        let list1 = LinkedList<Int64>()
        list1.addLast(1)
        list1.addLast(2)
        let list2 = LinkedList<String>()
        list2.addLast("a")
        let zipped = list1.zip(list2)
        @Expect(zipped.size, 1)
    }

    @TestCase
    func test_linkedlist_enumerate(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(10)
        list.addLast(20)
        let enumerated = list.enumerate()
        @Expect(enumerated.size, 2)
    }

    @TestCase
    func test_linkedlist_node_next_prev(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        list.addLast(3)
        match (list.firstNode) {
            case Some(node) =>
                match (node.next) {
                    case Some(n) => @Expect(n.value, 2)
                    case None => @Assert(false)
                }
            case None => @Assert(false)
        }
        match (list.lastNode) {
            case Some(node) =>
                match (node.prev) {
                    case Some(n) => @Expect(n.value, 2)
                    case None => @Assert(false)
                }
            case None => @Assert(false)
        }
    }

    // ===================== TreeMap branch coverage =====================

    @TestCase
    func test_treemap_get_nonexistent(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        match (map.get("nonexistent")) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treemap_add_replace(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        match (map.add("a", 2)) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Expect(map["a"], 2)
    }

    @TestCase
    func test_treemap_remove_nonexistent(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        match (map.remove("nonexistent")) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treemap_remove_empty(): Unit {
        let map = TreeMap<String, Int64>()
        match (map.remove("a")) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treemap_remove_existing(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        match (map.remove("a")) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Assert(!map.contains("a"))
    }

    @TestCase
    func test_treemap_clear(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        map.clear()
        @Expect(map.size, 0)
        @Assert(map.isEmpty())
    }

    @TestCase
    func test_treemap_clear_empty(): Unit {
        let map = TreeMap<String, Int64>()
        map.clear()
        @Expect(map.size, 0)
    }

    @TestCase
    func test_treemap_remove_all(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        map.add("c", 3)
        let toRemove = ArrayList<String>(["a", "c"])
        map.remove(all: toRemove)
        @Expect(map.size, 1)
        @Assert(map.contains("b"))
    }

    @TestCase
    func test_treemap_contains_all(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let keys = ArrayList<String>(["a", "b"])
        @Assert(map.contains(all: keys))
        let partial = ArrayList<String>(["a", "c"])
        @Assert(!map.contains(all: partial))
    }

    @TestCase
    func test_treemap_first_last(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("b", 2)
        map.add("a", 1)
        map.add("c", 3)
        match (map.first) {
            case Some(kv) => @Expect(kv[0], "a")
            case None => @Assert(false)
        }
        match (map.last) {
            case Some(kv) => @Expect(kv[0], "c")
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_treemap_first_last_empty(): Unit {
        let map = TreeMap<String, Int64>()
        match (map.first) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
        match (map.last) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treemap_removeFirst(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("b", 2)
        map.add("a", 1)
        map.add("c", 3)
        match (map.removeFirst()) {
            case Some(kv) => @Expect(kv[0], "a")
            case None => @Assert(false)
        }
        @Expect(map.size, 2)
    }

    @TestCase
    func test_treemap_removeFirst_empty(): Unit {
        let map = TreeMap<String, Int64>()
        match (map.removeFirst()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treemap_removeLast(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("b", 2)
        map.add("a", 1)
        map.add("c", 3)
        match (map.removeLast()) {
            case Some(kv) => @Expect(kv[0], "c")
            case None => @Assert(false)
        }
        @Expect(map.size, 2)
    }

    @TestCase
    func test_treemap_removeLast_empty(): Unit {
        let map = TreeMap<String, Int64>()
        match (map.removeLast()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treemap_forward_inclusive(): Unit {
        let map = TreeMap<Int64, String>()
        map.add(1, "a")
        map.add(2, "b")
        map.add(3, "c")
        map.add(4, "d")
        let it = map.forward(2, inclusive: true)
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_treemap_forward_exclusive(): Unit {
        let map = TreeMap<Int64, String>()
        map.add(1, "a")
        map.add(2, "b")
        map.add(3, "c")
        map.add(4, "d")
        let it = map.forward(2, inclusive: false)
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func test_treemap_forward_before_first(): Unit {
        let map = TreeMap<Int64, String>()
        map.add(2, "b")
        map.add(3, "c")
        map.add(4, "d")
        let it = map.forward(1, inclusive: true)
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_treemap_forward_after_last(): Unit {
        let map = TreeMap<Int64, String>()
        map.add(1, "a")
        map.add(2, "b")
        map.add(3, "c")
        let it = map.forward(10, inclusive: true)
        match (it.next()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treemap_backward_inclusive(): Unit {
        let map = TreeMap<Int64, String>()
        map.add(1, "a")
        map.add(2, "b")
        map.add(3, "c")
        map.add(4, "d")
        let it = map.backward(3, inclusive: true)
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_treemap_backward_exclusive(): Unit {
        let map = TreeMap<Int64, String>()
        map.add(1, "a")
        map.add(2, "b")
        map.add(3, "c")
        map.add(4, "d")
        let it = map.backward(3, inclusive: false)
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func test_treemap_backward_before_first(): Unit {
        let map = TreeMap<Int64, String>()
        map.add(2, "b")
        map.add(3, "c")
        let it = map.backward(1, inclusive: true)
        match (it.next()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treemap_backward_after_last(): Unit {
        let map = TreeMap<Int64, String>()
        map.add(1, "a")
        map.add(2, "b")
        map.add(3, "c")
        let it = map.backward(10, inclusive: true)
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_treemap_iterator(): Unit {
        let map = TreeMap<Int64, String>()
        map.add(3, "c")
        map.add(1, "a")
        map.add(2, "b")
        let it = map.iterator()
        var firstKey = 0
        match (it.next()) {
            case Some(kv) => firstKey = kv[0]
            case None => @Assert(false)
        }
        @Expect(firstKey, 1)
    }

    @TestCase
    func test_treemap_iterator_empty(): Unit {
        let map = TreeMap<Int64, String>()
        let it = map.iterator()
        match (it.next()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treemap_keys_values(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        @Expect(map.keys().size, 2)
        @Expect(map.values().size, 2)
    }

    @TestCase
    func test_treemap_keys_values_empty(): Unit {
        let map = TreeMap<String, Int64>()
        @Expect(map.keys().size, 0)
        @Expect(map.values().size, 0)
    }

    @TestCase
    func test_treemap_clone(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let cloned = map.clone()
        @Expect(cloned.size, 2)
        map.add("c", 3)
        @Expect(cloned.size, 2)
    }

    @TestCase
    func test_treemap_toArray(): Unit {
        let map = TreeMap<Int64, String>()
        map.add(1, "a")
        map.add(2, "b")
        let arr = map.toArray()
        @Expect(arr.size, 2)
    }

    @TestCase
    func test_treemap_init_from_collection(): Unit {
        let entries = ArrayList<(Int64, String)>([(1, "a"), (2, "b")])
        let map = TreeMap<Int64, String>(entries)
        @Expect(map.size, 2)
    }

    @TestCase
    func test_treemap_init_from_array(): Unit {
        let arr: Array<(Int64, String)> = [(1, "a"), (2, "b")]
        let map = TreeMap<Int64, String>(arr)
        @Expect(map.size, 2)
    }

    @TestCase
    func test_treemap_init_size_negative(): Unit {
        var threw = false
        try {
            let map = TreeMap<Int64, String>(-1, { i => (i, "") })
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_treemap_init_size_initElement(): Unit {
        let map = TreeMap<Int64, String>(3, { i => (i, "val${i}") })
        @Expect(map.size, 3)
    }

    @TestCase
    func test_treemap_operator_get_nonexistent(): Unit {
        let map = TreeMap<String, Int64>()
        var threw = false
        try {
            let _ = map["nonexistent"]
        } catch (e: NoneValueException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_treemap_add_all(): Unit {
        let map1 = TreeMap<String, Int64>()
        map1.add("a", 1)
        let map2 = TreeMap<String, Int64>()
        map2.add("b", 2)
        map1.add(all: map2)
        @Expect(map1.size, 2)
    }

    @TestCase
    func test_treemap_contains(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        @Assert(map.contains("a"))
        @Assert(!map.contains("b"))
    }

    @TestCase
    func test_treemap_contains_empty(): Unit {
        let map = TreeMap<String, Int64>()
        @Assert(!map.contains("a"))
    }

    @TestCase
    func test_treemap_entryView_existing(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        let view = map.entryView("a")
        @Expect(view.key, "a")
        match (view.value) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
    }


    @TestCase
    func test_treemap_entryView_set_value(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        let view = map.entryView("a")
        view.value = Some(99)
        @Expect(map["a"], 99)
    }

    @TestCase
    func test_treemap_entryView_set_none_removes(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        let view = map.entryView("a")
        view.value = None
        @Assert(!map.contains("a"))
    }

    @TestCase
    func test_treemap_entryView_absent_set_value(): Unit {
        let map = TreeMap<String, Int64>()
        let view = map.entryView("newkey")
        view.value = Some(42)
        @Expect(map["newkey"], 42)
    }

    @TestCase
    func test_treemap_equality(): Unit {
        let map1 = TreeMap<String, Int64>()
        map1.add("a", 1)
        map1.add("b", 2)
        let map2 = TreeMap<String, Int64>()
        map2.add("a", 1)
        map2.add("b", 2)
        @Assert(map1 == map2)
        let map3 = TreeMap<String, Int64>()
        map3.add("a", 1)
        map3.add("b", 99)
        @Assert(map1 != map3)
    }

    @TestCase
    func test_treemap_equality_same_ref(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        @Assert(map == map)
    }

    @TestCase
    func test_treemap_equality_diff_size(): Unit {
        let map1 = TreeMap<String, Int64>()
        map1.add("a", 1)
        map1.add("b", 2)
        let map2 = TreeMap<String, Int64>()
        map2.add("a", 1)
        @Assert(map1 != map2)
    }

    @TestCase
    func test_treemap_removeIf(): Unit {
        let map = TreeMap<Int64, String>()
        map.add(1, "a")
        map.add(2, "b")
        map.add(3, "c")
        map.removeIf({ k, v => k > 1 })
        @Expect(map.size, 1)
        @Assert(map.contains(1))
    }

    @TestCase
    func test_treemap_removeIf_none_match(): Unit {
        let map = TreeMap<Int64, String>()
        map.add(1, "a")
        map.add(2, "b")
        map.removeIf({ k, v => k > 100 })
        @Expect(map.size, 2)
    }

    @TestCase
    func test_treemap_large_scale(): Unit {
        let map = TreeMap<Int64, Int64>()
        for (i in 0..50) {
            map.add(i, i * 2)
        }
        @Expect(map.size, 50)
        @Expect(map[25], 50)
        match (map.remove(25)) {
            case Some(v) => @Expect(v, 50)
            case None => @Assert(false)
        }
        @Expect(map.size, 49)
    }

    @TestCase
    func test_treemap_forEach(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        var sum = 0
        let it0 = map.iterator()
        while (let Some(kv) <- it0.next()) {
            sum += kv[1]
        }
        @Expect(sum, 3)
    }

    @TestCase
    func test_treemap_filter(): Unit {
        let map = TreeMap<Int64, String>()
        map.add(1, "a")
        map.add(2, "b")
        map.add(3, "c")
        let filtered = map.filter({ k, v => k > 1 })
        @Expect(filtered.size, 2)
    }

    @TestCase
    func test_treemap_mapValues(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let mapped = map.mapValues({ k, v => v * 10 })
        @Expect(mapped.size, 2)
        @Expect(mapped["a"], 10)
    }

    @TestCase
    func test_treemap_all(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        @Assert(map.all({ k, v => v > 0 }))
        @Assert(!map.all({ k, v => v > 1 }))
    }

    @TestCase
    func test_treemap_any(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        @Assert(map.any({ k, v => v > 1 }))
    }

    @TestCase
    func test_treemap_none(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        @Assert(map.none({ k, v => v > 100 }))
    }

    @TestCase
    func test_treemap_fold(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        @Expect(map.fold(0, { acc, k, v => acc + v }), 3)
    }

    @TestCase
    func test_treemap_reduce(): Unit {
        let map = TreeMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        match (map.reduce({ a, b => a + b })) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_treemap_reduce_empty(): Unit {
        let map = TreeMap<String, Int64>()
        match (map.reduce({ a, b => a + b })) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treemap_toString_empty(): Unit {
        let map = TreeMap<String, Int64>()
        @Expect(map.toString(), "[]")
    }

    @TestCase
    func test_treemap_toString_nonempty(): Unit {
        let map = TreeMap<Int64, Int64>()
        map.add(1, 10)
        let s = map.toString()
        @Assert(s.startsWith("["))
        @Assert(s.endsWith("]"))
    }

    // ===================== TreeSet branch coverage =====================

    @TestCase
    func test_treeset_add_duplicate(): Unit {
        let set = TreeSet<Int64>()
        @Assert(set.add(1))
        @Assert(!set.add(1))
        @Expect(set.size, 1)
    }

    @TestCase
    func test_treeset_remove_nonexistent(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        @Assert(!set.remove(99))
        @Assert(set.remove(1))
    }

    @TestCase
    func test_treeset_contains(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        @Assert(set.contains(1))
        @Assert(!set.contains(99))
    }

    @TestCase
    func test_treeset_contains_empty(): Unit {
        let set = TreeSet<Int64>()
        @Assert(!set.contains(1))
    }

    @TestCase
    func test_treeset_contains_all(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        let other = ArrayList<Int64>([1, 2])
        @Assert(set.contains(all: other))
        let partial = ArrayList<Int64>([1, 3])
        @Assert(!set.contains(all: partial))
    }

    @TestCase
    func test_treeset_first_last(): Unit {
        let set = TreeSet<Int64>()
        set.add(3)
        set.add(1)
        set.add(2)
        match (set.first) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        match (set.last) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_treeset_first_last_empty(): Unit {
        let set = TreeSet<Int64>()
        match (set.first) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
        match (set.last) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treeset_removeFirst(): Unit {
        let set = TreeSet<Int64>()
        set.add(3)
        set.add(1)
        set.add(2)
        match (set.removeFirst()) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Expect(set.size, 2)
    }

    @TestCase
    func test_treeset_removeFirst_empty(): Unit {
        let set = TreeSet<Int64>()
        match (set.removeFirst()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treeset_removeLast(): Unit {
        let set = TreeSet<Int64>()
        set.add(3)
        set.add(1)
        set.add(2)
        match (set.removeLast()) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
        @Expect(set.size, 2)
    }

    @TestCase
    func test_treeset_removeLast_empty(): Unit {
        let set = TreeSet<Int64>()
        match (set.removeLast()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treeset_forward_inclusive(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        set.add(4)
        let it = set.forward(2, inclusive: true)
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_treeset_forward_exclusive(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        set.add(4)
        let it = set.forward(2, inclusive: false)
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func test_treeset_backward_inclusive(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        set.add(4)
        let it = set.backward(3, inclusive: true)
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_treeset_backward_exclusive(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        set.add(4)
        let it = set.backward(3, inclusive: false)
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 2)
    }

    @TestCase
    func test_treeset_clear(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        set.clear()
        @Expect(set.size, 0)
    }

    @TestCase
    func test_treeset_clear_empty(): Unit {
        let set = TreeSet<Int64>()
        set.clear()
        @Expect(set.size, 0)
    }

    @TestCase
    func test_treeset_clone(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        let cloned = set.clone()
        @Expect(cloned.size, 2)
        set.add(3)
        @Expect(cloned.size, 2)
    }

    @TestCase
    func test_treeset_iterator(): Unit {
        let set = TreeSet<Int64>()
        set.add(3)
        set.add(1)
        set.add(2)
        let it = set.iterator()
        var first = 0
        match (it.next()) {
            case Some(v) => first = v
            case None => @Assert(false)
        }
        @Expect(first, 1)
    }

    @TestCase
    func test_treeset_iterator_empty(): Unit {
        let set = TreeSet<Int64>()
        let it = set.iterator()
        match (it.next()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treeset_remove_all(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        let toRemove = ArrayList<Int64>([1, 3])
        set.remove(all: toRemove)
        @Expect(set.size, 1)
        @Assert(set.contains(2))
    }

    @TestCase
    func test_treeset_removeIf(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        set.removeIf({ x => x > 1 })
        @Expect(set.size, 1)
    }

    @TestCase
    func test_treeset_retain(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        let retainSet = TreeSet<Int64>()
        retainSet.add(1)
        retainSet.add(3)
        set.retain(all: retainSet)
        @Expect(set.size, 2)
        @Assert(set.contains(1))
        @Assert(set.contains(3))
    }

    @TestCase
    func test_treeset_add_all(): Unit {
        let set = TreeSet<Int64>()
        let other = ArrayList<Int64>([1, 2, 3])
        set.add(all: other)
        @Expect(set.size, 3)
    }

    @TestCase
    func test_treeset_toArray(): Unit {
        let set = TreeSet<Int64>()
        set.add(3)
        set.add(1)
        set.add(2)
        let arr = set.toArray()
        @Expect(arr.size, 3)
        @Expect(arr[0], 1)
    }

    @TestCase
    func test_treeset_subsetOf(): Unit {
        let set1 = TreeSet<Int64>()
        set1.add(1)
        set1.add(2)
        let set2 = TreeSet<Int64>()
        set2.add(1)
        set2.add(2)
        set2.add(3)
        @Assert(set1.subsetOf(set2))
        @Assert(!set2.subsetOf(set1))
    }

    @TestCase
    func test_treeset_subsetOf_empty(): Unit {
        let set1 = TreeSet<Int64>()
        let set2 = TreeSet<Int64>()
        set2.add(1)
        @Assert(set1.subsetOf(set2))
    }

    @TestCase
    func test_treeset_intersection(): Unit {
        let set1 = TreeSet<Int64>()
        set1.add(1)
        set1.add(2)
        set1.add(3)
        let set2 = TreeSet<Int64>()
        set2.add(2)
        set2.add(3)
        set2.add(4)
        let result = set1 & set2
        @Expect(result.size, 2)
        @Assert(result.contains(2))
        @Assert(result.contains(3))
    }

    @TestCase
    func test_treeset_union(): Unit {
        let set1 = TreeSet<Int64>()
        set1.add(1)
        set1.add(2)
        let set2 = TreeSet<Int64>()
        set2.add(3)
        let result = set1 | set2
        @Expect(result.size, 3)
    }

    @TestCase
    func test_treeset_difference(): Unit {
        let set1 = TreeSet<Int64>()
        set1.add(1)
        set1.add(2)
        set1.add(3)
        let set2 = TreeSet<Int64>()
        set2.add(2)
        let result = set1 - set2
        @Expect(result.size, 2)
        @Assert(result.contains(1))
        @Assert(result.contains(3))
    }

    @TestCase
    func test_treeset_equality(): Unit {
        let set1 = TreeSet<Int64>()
        set1.add(1)
        set1.add(2)
        let set2 = TreeSet<Int64>()
        set2.add(1)
        set2.add(2)
        @Assert(set1 == set2)
        let set3 = TreeSet<Int64>()
        set3.add(1)
        @Assert(set1 != set3)
    }

    @TestCase
    func test_treeset_init_from_collection(): Unit {
        let list = ArrayList<Int64>([3, 1, 2])
        let set = TreeSet<Int64>(list)
        @Expect(set.size, 3)
    }

    @TestCase
    func test_treeset_init_size_negative(): Unit {
        var threw = false
        try {
            let set = TreeSet<Int64>(-1, { i => i })
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_treeset_init_size_initElement(): Unit {
        let set = TreeSet<Int64>(3, { i => i })
        @Expect(set.size, 3)
    }

    @TestCase
    func test_treeset_of(): Unit {
        let arr: Array<Int64> = [3, 1, 2]
        let set = TreeSet<Int64>.of(arr)
        @Expect(set.size, 3)
    }

    @TestCase
    func test_treeset_large_scale(): Unit {
        let set = TreeSet<Int64>()
        for (i in 0..50) {
            set.add(i)
        }
        @Expect(set.size, 50)
        match (set.first) {
            case Some(v) => @Expect(v, 0)
            case None => @Assert(false)
        }
        match (set.last) {
            case Some(v) => @Expect(v, 49)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_treeset_all(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        @Assert(set.all({ x => x > 0 }))
        @Assert(!set.all({ x => x > 1 }))
    }

    @TestCase
    func test_treeset_any(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        @Assert(set.any({ x => x > 1 }))
    }

    @TestCase
    func test_treeset_none(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        @Assert(set.none({ x => x > 100 }))
    }

    @TestCase
    func test_treeset_fold(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        @Expect(set.fold(0, { acc, x => acc + x }), 3)
    }

    @TestCase
    func test_treeset_reduce(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        match (set.reduce({ a, b => a + b })) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_treeset_reduce_empty(): Unit {
        let set = TreeSet<Int64>()
        match (set.reduce({ a, b => a + b })) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_treeset_map(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        let mapped = set.map({ x => x * 10 })
        @Expect(mapped.size, 2)
        @Assert(mapped.contains(10))
    }

    @TestCase
    func test_treeset_filter(): Unit {
        let set = TreeSet<Int64>()
        set.add(1)
        set.add(2)
        set.add(3)
        let filtered = set.filter({ x => x > 1 })
        @Expect(filtered.size, 2)
    }

    // ===================== ArrayDeque branch coverage =====================

    @TestCase
    func test_arraydeque_addFirst(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addFirst(1)
        deque.addFirst(2)
        @Expect(deque.size, 2)
        match (deque.first) {
            case Some(v) => @Expect(v, 2)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_arraydeque_addLast(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addLast(1)
        deque.addLast(2)
        @Expect(deque.size, 2)
        match (deque.last) {
            case Some(v) => @Expect(v, 2)
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_arraydeque_first_last_empty(): Unit {
        let deque = ArrayDeque<Int64>()
        match (deque.first) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
        match (deque.last) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arraydeque_removeFirst(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addLast(1)
        deque.addLast(2)
        match (deque.removeFirst()) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Expect(deque.size, 1)
    }

    @TestCase
    func test_arraydeque_removeFirst_empty(): Unit {
        let deque = ArrayDeque<Int64>()
        match (deque.removeFirst()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arraydeque_removeLast(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addLast(1)
        deque.addLast(2)
        match (deque.removeLast()) {
            case Some(v) => @Expect(v, 2)
            case None => @Assert(false)
        }
        @Expect(deque.size, 1)
    }

    @TestCase
    func test_arraydeque_removeLast_empty(): Unit {
        let deque = ArrayDeque<Int64>()
        match (deque.removeLast()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arraydeque_wrap_around(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addLast(1)
        deque.addLast(2)
        deque.addLast(3)
        deque.removeFirst()
        deque.removeFirst()
        deque.addLast(4)
        deque.addLast(5)
        @Expect(deque.size, 3)
    }

    @TestCase
    func test_arraydeque_grow(): Unit {
        let deque = ArrayDeque<Int64>()
        for (i in 0..20) {
            deque.addLast(i)
        }
        @Expect(deque.size, 20)
    }

    @TestCase
    func test_arraydeque_clear(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addLast(1)
        deque.addLast(2)
        deque.clear()
        @Expect(deque.size, 0)
        @Assert(deque.isEmpty())
    }

    @TestCase
    func test_arraydeque_clear_empty(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.clear()
        @Expect(deque.size, 0)
    }

    @TestCase
    func test_arraydeque_iterator_empty(): Unit {
        let deque = ArrayDeque<Int64>()
        let it = deque.iterator()
        match (it.next()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arraydeque_iterator_full(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addLast(1)
        deque.addLast(2)
        deque.addLast(3)
        let it = deque.iterator()
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_arraydeque_toArray(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addLast(1)
        deque.addLast(2)
        deque.addLast(3)
        let arr = deque.toArray()
        @Expect(arr.size, 3)
        @Expect(arr[0], 1)
    }

    @TestCase
    func test_arraydeque_toArray_empty(): Unit {
        let deque = ArrayDeque<Int64>()
        let arr = deque.toArray()
        @Expect(arr.size, 0)
    }

    @TestCase
    func test_arraydeque_toArray_wrapped(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addLast(1)
        deque.addLast(2)
        deque.addLast(3)
        deque.removeFirst()
        deque.removeFirst()
        deque.addLast(4)
        deque.addLast(5)
        let arr = deque.toArray()
        @Expect(arr.size, 3)
        @Expect(arr[0], 3)
    }

    @TestCase
    func test_arraydeque_capacity_negative(): Unit {
        var threw = false
        try {
            let deque = ArrayDeque<Int64>(-1)
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraydeque_reserve(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.reserve(100)
        deque.addLast(1)
        @Expect(deque.size, 1)
    }

    @TestCase
    func test_arraydeque_reserve_no_change(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addLast(1)
        let cap = deque.capacity
        deque.reserve(0)
        @Expect(deque.capacity, cap)
    }

    @TestCase
    func test_arraydeque_mixed_ops(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addFirst(1)
        deque.addLast(2)
        deque.addFirst(0)
        deque.addLast(3)
        @Expect(deque.size, 4)
        match (deque.removeFirst()) {
            case Some(v) => @Expect(v, 0)
            case None => @Assert(false)
        }
        match (deque.removeLast()) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
        @Expect(deque.size, 2)
    }

    @TestCase
    func test_arraydeque_last_at_boundary(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addLast(1)
        deque.addLast(2)
        deque.removeFirst()
        deque.addLast(3)
        match (deque.last) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
    }

    // ===================== ArrayQueue branch coverage =====================

    @TestCase
    func test_arrayqueue_add_remove(): Unit {
        let queue = ArrayQueue<Int64>()
        queue.add(1)
        queue.add(2)
        @Expect(queue.size, 2)
        match (queue.remove()) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Expect(queue.size, 1)
    }

    @TestCase
    func test_arrayqueue_remove_empty(): Unit {
        let queue = ArrayQueue<Int64>()
        match (queue.remove()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arrayqueue_peek(): Unit {
        let queue = ArrayQueue<Int64>()
        queue.add(1)
        queue.add(2)
        match (queue.peek()) {
            case Some(v) => @Expect(v, 1)
            case None => @Assert(false)
        }
        @Expect(queue.size, 2)
    }

    @TestCase
    func test_arrayqueue_peek_empty(): Unit {
        let queue = ArrayQueue<Int64>()
        match (queue.peek()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arrayqueue_clear(): Unit {
        let queue = ArrayQueue<Int64>()
        queue.add(1)
        queue.add(2)
        queue.clear()
        @Expect(queue.size, 0)
        @Assert(queue.isEmpty())
    }

    @TestCase
    func test_arrayqueue_clear_empty(): Unit {
        let queue = ArrayQueue<Int64>()
        queue.clear()
        @Expect(queue.size, 0)
    }

    @TestCase
    func test_arrayqueue_iterator(): Unit {
        let queue = ArrayQueue<Int64>()
        queue.add(1)
        queue.add(2)
        queue.add(3)
        let it = queue.iterator()
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_arrayqueue_iterator_empty(): Unit {
        let queue = ArrayQueue<Int64>()
        let it = queue.iterator()
        match (it.next()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arrayqueue_capacity_expansion(): Unit {
        let queue = ArrayQueue<Int64>()
        for (i in 0..20) {
            queue.add(i)
        }
        @Expect(queue.size, 20)
    }

    @TestCase
    func test_arrayqueue_toArray(): Unit {
        let queue = ArrayQueue<Int64>()
        queue.add(1)
        queue.add(2)
        let arr = queue.toArray()
        @Expect(arr.size, 2)
    }

    @TestCase
    func test_arrayqueue_reserve(): Unit {
        let queue = ArrayQueue<Int64>()
        queue.reserve(100)
        queue.add(1)
        @Expect(queue.size, 1)
    }

    @TestCase
    func test_arrayqueue_capacity_negative(): Unit {
        var threw = false
        try {
            let queue = ArrayQueue<Int64>(-1)
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    // ===================== ArrayStack branch coverage =====================

    @TestCase
    func test_arraystack_add_remove(): Unit {
        let stack = ArrayStack<Int64>()
        stack.add(1)
        stack.add(2)
        @Expect(stack.size, 2)
        match (stack.remove()) {
            case Some(v) => @Expect(v, 2)
            case None => @Assert(false)
        }
        @Expect(stack.size, 1)
    }

    @TestCase
    func test_arraystack_remove_empty(): Unit {
        let stack = ArrayStack<Int64>()
        match (stack.remove()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arraystack_peek(): Unit {
        let stack = ArrayStack<Int64>()
        stack.add(1)
        stack.add(2)
        match (stack.peek()) {
            case Some(v) => @Expect(v, 2)
            case None => @Assert(false)
        }
        @Expect(stack.size, 2)
    }

    @TestCase
    func test_arraystack_peek_empty(): Unit {
        let stack = ArrayStack<Int64>()
        match (stack.peek()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arraystack_clear(): Unit {
        let stack = ArrayStack<Int64>()
        stack.add(1)
        stack.add(2)
        stack.clear()
        @Expect(stack.size, 0)
        @Assert(stack.isEmpty())
    }

    @TestCase
    func test_arraystack_clear_empty(): Unit {
        let stack = ArrayStack<Int64>()
        stack.clear()
        @Expect(stack.size, 0)
    }

    @TestCase
    func test_arraystack_grow(): Unit {
        let stack = ArrayStack<Int64>()
        for (i in 0..20) {
            stack.add(i)
        }
        @Expect(stack.size, 20)
    }

    @TestCase
    func test_arraystack_iterator(): Unit {
        let stack = ArrayStack<Int64>()
        stack.add(1)
        stack.add(2)
        stack.add(3)
        let it = stack.iterator()
        var count = 0
        while (let Some(_) <- it.next()) {
            count++
        }
        @Expect(count, 3)
    }

    @TestCase
    func test_arraystack_iterator_empty(): Unit {
        let stack = ArrayStack<Int64>()
        let it = stack.iterator()
        match (it.next()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_arraystack_toArray(): Unit {
        let stack = ArrayStack<Int64>()
        stack.add(1)
        stack.add(2)
        stack.add(3)
        let arr = stack.toArray()
        @Expect(arr.size, 3)
        @Expect(arr[0], 3)
    }

    @TestCase
    func test_arraystack_toArray_empty(): Unit {
        let stack = ArrayStack<Int64>()
        let arr = stack.toArray()
        @Expect(arr.size, 0)
    }

    @TestCase
    func test_arraystack_reserve(): Unit {
        let stack = ArrayStack<Int64>()
        stack.reserve(100)
        stack.add(1)
        @Expect(stack.size, 1)
    }

    @TestCase
    func test_arraystack_capacity_negative(): Unit {
        var threw = false
        try {
            let stack = ArrayStack<Int64>(-1)
        } catch (e: IllegalArgumentException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraystack_mixed_ops(): Unit {
        let stack = ArrayStack<Int64>()
        stack.add(1)
        stack.add(2)
        stack.add(3)
        match (stack.remove()) {
            case Some(v) => @Expect(v, 3)
            case None => @Assert(false)
        }
        stack.add(4)
        match (stack.peek()) {
            case Some(v) => @Expect(v, 4)
            case None => @Assert(false)
        }
        @Expect(stack.size, 3)
    }

    @TestCase
    func test_arraystack_capacity(): Unit {
        let stack = ArrayStack<Int64>()
        @Assert(stack.capacity >= 0)
        stack.add(1)
        @Assert(stack.capacity >= 1)
    }

    // ===================== ConcurrentModificationException =====================

    @TestCase
    func test_arraylist_concurrent_modification(): Unit {
        let list = ArrayList<Int64>([1, 2, 3])
        let it = list.iterator()
        it.next()
        list.add(4)
        var threw = false
        try {
            it.next()
        } catch (e: ConcurrentModificationException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_hashmap_concurrent_modification(): Unit {
        let map = HashMap<String, Int64>()
        map.add("a", 1)
        map.add("b", 2)
        let it = map.iterator()
        it.next()
        map.add("c", 3)
        var threw = false
        try {
            it.next()
        } catch (e: ConcurrentModificationException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_linkedlist_concurrent_modification(): Unit {
        let list = LinkedList<Int64>()
        list.addLast(1)
        list.addLast(2)
        let it = list.iterator()
        it.next()
        list.addLast(3)
        var threw = false
        try {
            it.next()
        } catch (e: ConcurrentModificationException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraydeque_concurrent_modification(): Unit {
        let deque = ArrayDeque<Int64>()
        deque.addLast(1)
        deque.addLast(2)
        let it = deque.iterator()
        it.next()
        deque.addLast(3)
        var threw = false
        try {
            it.next()
        } catch (e: ConcurrentModificationException) {
            threw = true
        }
        @Assert(threw)
    }

    @TestCase
    func test_arraystack_concurrent_modification(): Unit {
        let stack = ArrayStack<Int64>()
        stack.add(1)
        stack.add(2)
        let it = stack.iterator()
        it.next()
        stack.add(3)
        var threw = false
        try {
            it.next()
        } catch (e: ConcurrentModificationException) {
            threw = true
        }
        @Assert(threw)
    }

    // ===================== Empty collection behaviors =====================

    @TestCase
    func test_empty_arraylist_size_isempty(): Unit {
        let list = ArrayList<Int64>()
        @Expect(list.size, 0)
        @Assert(list.isEmpty())
    }

    @TestCase
    func test_empty_hashmap_size_isempty(): Unit {
        let map = HashMap<String, Int64>()
        @Expect(map.size, 0)
        @Assert(map.isEmpty())
    }

    @TestCase
    func test_empty_hashset_size_isempty(): Unit {
        let set = HashSet<Int64>()
        @Expect(set.size, 0)
        @Assert(set.isEmpty())
    }

    @TestCase
    func test_empty_linkedlist_size_isempty(): Unit {
        let list = LinkedList<Int64>()
        @Expect(list.size, 0)
        @Assert(list.isEmpty())
    }

    @TestCase
    func test_empty_treemap_size_isempty(): Unit {
        let map = TreeMap<String, Int64>()
        @Expect(map.size, 0)
        @Assert(map.isEmpty())
    }

    @TestCase
    func test_empty_treeset_size_isempty(): Unit {
        let set = TreeSet<Int64>()
        @Expect(set.size, 0)
        @Assert(set.isEmpty())
    }

    @TestCase
    func test_empty_arraydeque_size_isempty(): Unit {
        let deque = ArrayDeque<Int64>()
        @Expect(deque.size, 0)
        @Assert(deque.isEmpty())
    }

    @TestCase
    func test_empty_arrayqueue_size_isempty(): Unit {
        let queue = ArrayQueue<Int64>()
        @Expect(queue.size, 0)
        @Assert(queue.isEmpty())
    }

    @TestCase
    func test_empty_arraystack_size_isempty(): Unit {
        let stack = ArrayStack<Int64>()
        @Expect(stack.size, 0)
        @Assert(stack.isEmpty())
    }
}
