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
// ASSERT: scan function 'stableSort' is deprecated. Use global function `public func sort<T>(data: Array<T>, stable!: Bool = false, descending!: Bool = false): Unit where T <: Comparable<T>` instead.
// ASSERT: scan function 'stableSort' is deprecated. Use global function `public func sort<T>(data: Array<T>, by!: (T, T) -> Ordering, stable!: Bool = false, descending!: Bool = false): Unit` instead.
import std.sort.*

main() {
    var arr: Array<Int64> = Array<Int64>()
    stableSort(arr[0..0])
    stableSort(arr[0..0], test)
}

func test(t1: Int64, t2: Int64): Ordering {
    if (t1 > t2) {
        return Ordering.GT
    } else if (t1 < t2) {
        return Ordering.LT
    }
    return Ordering.EQ
}
