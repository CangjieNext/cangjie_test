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
public class Test_addIfAbsent_01 {
    let map = HashMap<Int64, Int64>()
    let map_str = HashMap<String, String>()
    let N = 5000

    @TestCase
    func test_blankhashmap_int_01(): Unit {
        for (i in 0..N) {
            @Expect(map.contains(i), false)
            var res = map.addIfAbsent(i, i + 1)
            @Expect(res, None)
            @Expect(map[i], i+1)
        }
    }

    @TestCase
    func test_blankhashmap_int_02(): Unit {
        for (i in 0..N) {
            @Expect(map.contains(i), true)
            var res = map.addIfAbsent(i, i + 10)
            @Expect(res, Some(i + 1))
            @Expect(map[i], i+1)
        }
    }

    @TestCase
    func test_blankhashmap_str_03(): Unit {
        for (i in 0..N) {
            @Expect(map_str.contains("${i}"), false)
            var res = map_str.addIfAbsent("${i}", "${i + 1}")
            @Expect(res, None)
            @Expect(map_str["${i}"], "${i+1}")
        }
    }

    @TestCase
    func test_blankhashmap_str_04(): Unit {
        for (i in 0..N) {
            @Expect(map_str.contains("${i}"), true)
            var res = map_str.addIfAbsent("${i}", "${i + 10}")
            @Expect(res, Some("${i + 1}"))
            @Expect(map_str["${i}"], "${i+1}")
        }
    }
}
