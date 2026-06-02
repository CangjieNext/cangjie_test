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
public class Test_addIfAbsent_02 {
    var map = Option<HashMap<Int64, Int64>>.None
    var map_str = Option<HashMap<String, String>>.None
    let N = 5000

    public func PreData(): Unit {
        let map1 = HashMap<Int64, Int64>()
        for (i in 0..N) {
            map1.add(i, i + 1)
        }
        map = Option<HashMap<Int64, Int64>>.Some(map1)
    }

    public func PreData_str(): Unit {
        let map1 = HashMap<String, String>()
        for (i in 0..N) {
            map1.add("${i}", "${i + 1}")
        }
        map_str = Option<HashMap<String, String>>.Some(map1)
    }

    @TestCase
    func test_init_valuemap_int_01(): Unit {
        PreData()
        for (i in 0..N) {
            @Expect(map.getOrThrow().contains(i), true)
            var res = map.getOrThrow().addIfAbsent(i, i + 10)
            @Expect(res, Some(i + 1))
            @Expect(map.getOrThrow()[i], i+1)
        }
    }

    @TestCase
    func test_init_valuemap_int_02(): Unit {
        PreData()
        map.getOrThrow().clear()
        for (i in 0..N) {
            @Expect(map.getOrThrow().contains(i), false)
            var res = map.getOrThrow().addIfAbsent(i, i + 10)
            @Expect(res, None)
            @Expect(map.getOrThrow()[i], i+10)
        }
    }

    @TestCase
    func test_init_valuemap_str_03(): Unit {
        PreData_str()
        for (i in 0..N) {
            @Expect(map_str.getOrThrow().contains("${i}"), true)
            var res = map_str.getOrThrow().addIfAbsent("${i}", "${i + 10}")
            @Expect(res, Some("${i + 1}"))
            @Expect(map_str.getOrThrow()["${i}"], "${i+1}")
        }
    }

    @TestCase
    func test_init_valuemap_str_04(): Unit {
        PreData_str()
        map_str.getOrThrow().clear()
        for (i in 0..N) {
            @Expect(map_str.getOrThrow().contains("${i}"), false)
            var res = map_str.getOrThrow().addIfAbsent("${i}", "${i + 10}")
            @Expect(res, None)
            @Expect(map_str.getOrThrow()["${i}"], "${i+10}")
        }
    }

    @TestCase
    func test_init_valuemap_put_05(): Unit {
        let map = HashMap<Int64, Int64>()
        for (i in 0..N / 2) {
            map.addIfAbsent(i, i + 1)
        }
        for (i in N / 2..N) {
            map.add(i, i + 1)
        }
        for (i in 0..N) {
            @Expect(map.contains(i), true)
            var res = map.addIfAbsent(i, i + 10)
            @Expect(res, Some(i + 1))
            @Expect(map[i], i+1)
        }
    }
}
