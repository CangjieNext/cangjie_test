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
class Test_hashmap_put_removeif_01 {
    @TestCase
    func test_hashmap_put_removeif_01(): Unit {
        let set1: HashSet<Int64> = HashSet<Int64>([0, 2, 3, 4, 5, 6])
        try {
            set1.removeIf(
                {
                    x =>
                    set1.remove(x)
                    return true
                }
            )
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }

        try {
            set1.removeIf(
                {
                    x =>
                    set1.remove(x)
                    return false
                }
            )
        } catch (e: ConcurrentModificationException) {
            @Expect(e.message, "The predicate cannot contain a modify operation.")
        }
    }
}
