/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color

import std.random.*
import std.collection.*

let random = Random(42)

@Test
func arbitrary_generates_all_values_of_hashmap_with_bools() {
    let ITERS = 10
    var expected = [
        (true, true),
        (true, false),
        (false, false),
        (false, true)
    ]

    for (_ in 0..ITERS) {
        let hmap = HashMap<Bool, Bool>.arbitrary(random).next()

        for ((k1, v1) in hmap) {
            for ((k2, v2) in expected) {
                if (k1 == k2 && v2 == v2) {
                    expected = expected
                        |> filter {p: (Bool, Bool) => p[0] != k1 && p[1] != v1}
                        |> collectArray

                    break
                }
            }
        }
    }

    @Assert(expected.size == 0)
}
