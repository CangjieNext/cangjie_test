/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: values_test_logic.cj
// EXEC-PIPE: %compiler %cmp_opt %f values_test_logic.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.collection.*

main() {
    var hashmap1 = HashMap<String, Int64>([("a", 8), ("b", 9), ("c", 10)])
    var hashmap2 = HashMap<String, Int64>()
    var values1 = hashmap1.values()
    var values2 = hashmap2.values()
    var casesuite = TestValue()
    if (casesuite.testisEmpty(values1, false) != 0) {
        return 1
    }
    if (casesuite.testisEmpty(values2, true) != 0) {
        return 2
    }
    var exp_v1: Array<Int64> = [8, 9, 10]
    var exp_v2: Array<Int64> = []
    if (casesuite.testiterator(values1, exp_v1) != 0) {
        return 5
    }
    if (casesuite.testiterator(values2, exp_v2) != 0) {
        return 6
    }
    return 0
}
