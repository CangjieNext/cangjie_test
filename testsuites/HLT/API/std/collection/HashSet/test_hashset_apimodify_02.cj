/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*

@Test
class Test_hashset_apimodify_02 {
    @TestCase
    func test_hashmap_apimodify_01(): Unit {
        var map: HashSet<Int64> = HashSet<Int64>()
        var arr = Array<Int64>(20, {i => i})
        var map1: HashSet<Int64> = HashSet<Int64>([0, 1, 2, 3])
        var map2: HashSet<Int64> = HashSet<Int64>(arr)
        var map3: HashSet<Int64> = HashSet<Int64>([0, 1, 2, 51])
        var arr1 = Array<Int64>(15, {i => i})
        for (i in 0..20) {
            @Expect(map.add(i), true)
        }
        @Expect(map.capacity, 24)
        @Expect(map.contains(0),true)
        @Expect(map.contains(51),false)
        @Expect(map.contains(all:[0,1,2,3]),true)
        @Expect(map.contains(all:[0,1,2,51]),false)

        @Expect(map.subsetOf(map1),false)
        @Expect(map.subsetOf(map2),true)
        @Expect(map.subsetOf(map3),false)

        map.add(all: [50, 51, 52])
        @Expect(map.size, 23)
        map.remove(all: arr1)
        @Expect(map.size, 8)
    }

    @TestCase
    func test_hashmap_apimodify_02(): Unit {
        var map: HashSet<String> = HashSet<String>()
        var arr = Array<String>(20, {i => "${i}"})
        var map1: HashSet<String> = HashSet<String>(["0", "1", "2", "3"])
        var map2: HashSet<String> = HashSet<String>(arr)
        var map3: HashSet<String> = HashSet<String>(["0", "1", "2", "51"])
        var arr1 = Array<String>(15, {i => "${i}"})
        for (i in 0..20) {
            @Expect(map.add("${i}"), true)
        }
        @Expect(map.capacity, 24)
        @Expect(map.contains("0"),true)
        @Expect(map.contains("51"),false)
        @Expect(map.contains(all:["0","1","2","3"]),true)
        @Expect(map.contains(all:["0","1","2","51"]),false)

        @Expect(map.subsetOf(map1),false)
        @Expect(map.subsetOf(map2),true)
        @Expect(map.subsetOf(map3),false)

        map.add(all: ["50", "51", "52"])
        @Expect(map.size, 23)
        map.remove(all: arr1)
        @Expect(map.size, 8)
    }

    @TestCase
    func test_hashmap_apimodify_03(): Unit {
        var map: HashSet<String> = HashSet<String>()
        var arr = Array<String>(20, {i => "${i}"})
        var map1: HashSet<String> = HashSet<String>(["0", "1", "2", "3"])
        var map2: HashSet<String> = HashSet<String>(arr)
        var map3: HashSet<String> = HashSet<String>(["0", "1", "2", "51"])
        var arr1 = Array<String>(15, {i => "${i}"})
        for (i in 0..20) {
            @Expect(map.add("${i}"), true)
        }
        @Expect((map & map1).toArray(), ["0","1","2","3"])
        @Expect((map1 | map3).toArray(), ["0","1","2","3","51"])
        @Expect((map1 - map3).toArray(), ["3"])
    }

    @TestCase
    func test_hashmap_apimodify_04(): Unit {
        let map: HashSet<Int64> = HashSet<Int64>()
        for (i in 0..20) {
            @Expect(map.add(i), true)
        }
        try {
            map.removeIf(
                {
                    x: Int64 =>
                    map.remove(x)
                    return true
                }
            )
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }
    }
}
