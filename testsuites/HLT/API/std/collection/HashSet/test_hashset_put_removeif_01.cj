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
class Test_hashset_put_removeif_01 {
    @TestCase
    func test_hashset_put_removeif_01(): Unit {
        let map2: HashMap<Int64, Int64> = HashMap<Int64, Int64>([(0, 0), (1, 1), (3, 9), (4, 8)])
        try {
            map2.removeIf(
                {
                    key: Int64, _: Int64 =>
                    map2.remove(key)
                    return true
                }
            )
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }
    }
}
