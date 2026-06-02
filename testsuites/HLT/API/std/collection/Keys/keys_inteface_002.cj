/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: keys_test_logic.cj
// EXEC-PIPE: %compiler %cmp_opt %f keys_test_logic.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.collection.*

main() {
    var hashmap1 = HashMap<String, Int64>([("a", 8), ("b", 9), ("c", 10)])
    var hashmap2 = HashMap<String, Int64>()
    var keys1 = hashmap1.keys()
    var keys2 = hashmap2.keys()
    var casesuite = TestKeys()
    var delete_k: Array<String> = ["a", "b"]
    if (casesuite.testcontains(keys1, "d", false) != 0) {
        return 1
    }
    if (casesuite.testcontains(keys1, "a", true) != 0) {
        return 2
    }
    if (casesuite.testcontainsAll(keys1, keys2, true) != 0) {
        return 3
    }
    if (casesuite.testcontainsAll(keys2, keys1, false) != 0) {
        return 4
    }

    if (casesuite.testisEmpty(keys1, false) != 0) {
        return 5
    }
    if (casesuite.testisEmpty(keys2, true) != 0) {
        return 6
    }
    var exp_k1: Array<String> = ["a", "b", "c"]
    var exp_k2: Array<String> = []
    if (casesuite.testiterator(keys1, exp_k1) != 0) {
        return 7
    }
    if (casesuite.testiterator(keys2, exp_k2) != 0) {
        return 8
    }
    return 0
}
