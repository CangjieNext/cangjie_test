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
public class Test_entryview_03 {
    let map = HashMap<Int64, Int64>()
    let map_str = HashMap<String, String>()
    let N = 5000

    @TestCase
    func test_blankhashmap_entryview_01(): Unit {
        for (i in 0..N) {
            @Expect(map.contains(i), false)
            var res = map.entryView(i)
            @Expect(res.value.isNone(), true)
            @Expect(res.key , i)
            @Expect(res.value, None)
            res.value = i + 1
            @Expect(res.value, i+1)
        }
    }

    @TestCase
    func test_blankhashmap_entryview_02(): Unit {
        for (i in 0..N) {
            @Expect(map_str.contains("${i}"), false)
            var res = map_str.entryView("${i}")
            @Expect(res.value.isNone(), true)
            @Expect(res.key , "${i}")
            @Expect(res.value, None)
            res.value = "${i + 1}"
            @Expect(res.value, "${i+1}")
        }
    }
}
