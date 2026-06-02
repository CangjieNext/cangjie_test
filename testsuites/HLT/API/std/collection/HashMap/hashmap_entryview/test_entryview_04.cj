/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.collection.*

@Test
public class Test_entryview_04 {
    var map = Option<HashMap<Int64, Int64>>.None
    var map_str = Option<HashMap<String, String>>.None
    let N = 5000
    var sum = 0

    public override func beforeEach(): Unit {
        sum = 0
    }
    public func PreData(): Unit {
        let map1 = HashMap<Int64, Int64>()
        for (i in 0..N / 2) {
            map1.add(i, i + 1)
        }
        for (i in N / 2..N) {
            map1.addIfAbsent(i, i + 1)
        }
        map = Option<HashMap<Int64, Int64>>.Some(map1)
    }

    public func PreData_str(): Unit {
        let map1 = HashMap<String, String>()
        for (i in 0..N / 2) {
            map1.add("${i}", "${i + 1}")
        }
        for (i in N / 2..N) {
            map1.addIfAbsent("${i}", "${i + 1}")
        }
        map_str = Option<HashMap<String, String>>.Some(map1)
    }

    @TestCase
    func test_valuehashmap_entryview_01(): Unit {
        PreData()
        for (i in 0..N) {
            @Expect(map.getOrThrow().contains(i), true)
            var res = map.getOrThrow().entryView(i)
            @Expect(res.value.isNone(), false)
            @Expect(res.key, i)
            @Expect(res.value, i+1)
            res.value = i + 10
            @Expect(res.value, i+10)
        }
    }

    @TestCase
    func test_valuehashmap_entryview_02(): Unit {
        PreData_str()
        for (i in 0..N) {
            @Expect(map_str.getOrThrow().contains("${i}"), true)
            var res = map_str.getOrThrow().entryView("${i}")
            @Expect(res.value.isNone(), false)
            @Expect(res.key, "${i}")
            @Expect(res.value, "${i+1}")
            res.value = "${i + 10}"
            @Expect(res.value, "${i+10}")
        }
    }

    @TestCase
    func concurrentModificationExceptionTest(): Unit {
        let map = HashMap<String, Int64>(N, {i => ("${i}", i)})
        var entry = map.entryView("0")
        @Expect(entry.value.isNone(), false)
        entry.value = 1

        map.remove("0")
        try {
            entry.key
        } catch (e: ConcurrentModificationException) {
            sum += 1
        }
        @Expect(sum, 1)

        try {
            entry.value
        } catch (e: ConcurrentModificationException) {
            sum += 1
        }
        @Expect(sum, 2)

        try {
            entry.value = 17
        } catch (e: ConcurrentModificationException) {
            sum += 1
        }
        @Expect(sum, 3)
    }
}
