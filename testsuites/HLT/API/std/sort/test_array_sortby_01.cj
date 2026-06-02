/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output 
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan true

import std.sort.*
import std.random.*

main(): Unit {
    let r: Random = Random()
    let arr: Array<Int64> = Array<Int64>(70000, {_ => r.nextInt64()})
    arr.sortBy(stable: true) {
        rht: Int64, lht: Int64 =>
        if (rht < lht) {
            return Ordering.LT
        }
        if (rht > lht) {
            return Ordering.GT
        }
        return Ordering.EQ
    }

    println(isAse(arr))

    arr.sortBy(stable: true) {
        rht: Int64, lht: Int64 =>
        if (rht > lht) {
            return Ordering.GT
        }
        return Ordering.EQ
    }

    arr.sortBy(stable: true) {
        rht: Int64, lht: Int64 =>
        if (rht < lht) {
            return Ordering.LT
        }
        return Ordering.GT
    }

    arr.sortBy(stable: true) {
        rht: Int64, lht: Int64 =>
        if (rht < lht) {
            return Ordering.LT
        }

        return Ordering.EQ
    }

    arr.sortBy(stable: true) {
        rht: Int64, lht: Int64 => return Ordering.GT
    }

    arr.sortBy(stable: true) {
        rht: Int64, lht: Int64 => return Ordering.LT
    }

    arr.sortBy(stable: true) {
        rht: Int64, lht: Int64 => return Ordering.EQ
    }
}

func isAse(t: Array<Int64>) {
    var item: Int64 = t[0]
    for (i in 1..t.size) {
        if (item > t[i]) {
            return false
        }
        item = t[i]
    }
    return true
}
