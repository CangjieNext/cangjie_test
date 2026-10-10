/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.sort.*

var lessThanCalls = 0
var keyCalls = 0
var throwingCalls = 0

class StableEntry {
    let key: Int32
    let sequence: Int32

    public init(key: Int32, sequence: Int32) {
        this.key = key
        this.sequence = sequence
    }
}

func reverseCompare(left: Int32, right: Int32): Ordering {
    return right.compare(left)
}

func countingLessThan(left: Int32, right: Int32): Bool {
    lessThanCalls++
    return left < right
}

func countingKey(value: String): Int64 {
    keyCalls++
    return value.size
}

func compareStableEntry(left: StableEntry, right: StableEntry): Ordering {
    return left.key.compare(right.key)
}

func throwingCompare(left: Int32, right: Int32): Ordering {
    throwingCalls++
    if (throwingCalls == 3) {
        throw Exception("expected comparator failure")
    }
    return left.compare(right)
}

main(): Int64 {
    var byData: Array<Int32> = [3, 1, 2, 1]
    sort(byData, by: reverseCompare, stable: true)
    if (byData != [3, 2, 1, 1]) {
        return 1
    }

    var lessThanData: Array<Int32> = [3, 1, 2, 1]
    sort(lessThanData, lessThan: countingLessThan, stable: false)
    if (lessThanData != [1, 1, 2, 3] || lessThanCalls == 0) {
        return 2
    }

    var keyData: Array<String> = ["bbb", "a", "cc", "d"]
    sort(keyData, key: countingKey, stable: true)
    if (keyData != ["a", "d", "cc", "bbb"] || keyCalls == 0) {
        return 3
    }

    var descendingData: Array<Int32> = [3, 1, 2, 1]
    sort(descendingData, stable: true, descending: true)
    if (descendingData != [3, 2, 1, 1]) {
        return 4
    }

    var stableEntries = [StableEntry(2, 0), StableEntry(1, 1), StableEntry(2, 2), StableEntry(1, 3)]
    sort(stableEntries, by: compareStableEntry, stable: true)
    if (stableEntries[0].sequence != 1 || stableEntries[1].sequence != 3 ||
        stableEntries[2].sequence != 0 || stableEntries[3].sequence != 2) {
        return 5
    }

    var caught = false
    var throwingData: Array<Int32> = [4, 3, 2, 1]
    try {
        sort(throwingData, by: throwingCompare)
    } catch (_: Exception) {
        caught = true
    }
    if (!caught || throwingCalls != 3) {
        return 6
    }
    return 0
}
