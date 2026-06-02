/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan function 'sortBy' is deprecated. Use global function `public func sort<T>(data: ArrayList<T>, by!: (T, T) -> Ordering, stable!: Bool = false, descending!: Bool = false): Unit` in std.sort instead.

import std.collection.*
import std.random.*

main(): Unit {
    let r: Random = Random()
    let arr: Array<Int64> = Array<Int64>(70000, {_ => r.nextInt64()})
    let list = ArrayList(arr)
    list.sortBy(stable: true) {
        rht: Int64, lht: Int64 =>
        if (rht < lht) {
            return Ordering.LT
        }
        if (rht > lht) {
            return Ordering.GT
        }
        return Ordering.EQ
    }

    list.sortBy {
        rht: Int64, lht: Int64 =>
        if (rht < lht) {
            return Ordering.LT
        }
        if (rht > lht) {
            return Ordering.GT
        }
        return Ordering.EQ
    }
}
