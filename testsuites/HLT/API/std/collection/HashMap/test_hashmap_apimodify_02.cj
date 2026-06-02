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
class Test_hashmap_apimodify_02 {
    @TestCase
    func test_hashmap_apimodify_01(): Unit {
        var map: HashMap<Int64, String> = HashMap<Int64, String>()
        var arr = Array<String>(20, {i => "${i + 1}"})
        var arr1 = Array<Int64>(15, {i => i})
        for (i in 0..20) {
            @Expect(map.add(i, "${i+1}"), Option<String>.None)
            @Expect(map.get(i), Option<String>.Some("${i+1}"))
        }
        @Expect(map.capacity, 24)
        @Expect(map.contains(0),true)
        @Expect(map.contains(51),false)
        @Expect(map.contains(all:[0,1,2,3]),true)
        @Expect(map.contains(all:[0,1,2,51]),false)

        var keyscon = map.keys()
        for (j in 0..20) {
            @Expect(keyscon.contains(j),true)
        }
        var valuescon = map.values()

        @Expect(valuescon.toArray(), arr)

        map.add(all: [(50, "cangjie"), (51, "仓颉鸿蒙"), (52, "$$%#@$")])
        @Expect(map.size, 23)
        map.remove(all: arr1)
        @Expect(map.size, 8)
    }

    @TestCase
    func test_hashmap_apimodify_02(): Unit {
        let map: HashMap<Int64, String> = HashMap<Int64, String>()
        var arr = Array<String>(20, {i => "${i + 1}"})
        var arr1 = Array<Int64>(15, {i => i})
        for (i in 0..20) {
            @Expect(map.add(i, "${i+1}"), Option<String>.None)
            @Expect(map.get(i), Option<String>.Some("${i+1}"))
        }
        try {
            map.removeIf(
                {
                    x: Int64, _: String =>
                    map.remove(x)
                    return true
                }
            )
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }
    }
}
