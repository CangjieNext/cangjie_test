/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: set_test_logic.cj
// EXEC-PIPE: %compiler %cmp_opt %f set_test_logic.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*

main() {
    var hashset1 = HashSet<Int64>([8, 9, 10])
    var hashset2 = HashSet<Int64>()
    var set1 = hashset1.clone()
    var set2 = hashset2.clone()
    var casesuite = TestSet()
    var delete_v1 = HashSet<Int64>([8, 9])
    var put_v2: Array<Int64> = [11, 13]
    if (casesuite.testcontains(set1, 11, false) != 0) {
        return 1
    }
    if (casesuite.testcontains(set1, 9, true) != 0) {
        return 2
    }
    if (casesuite.testcontainsAll(set1, set2, true) != 0) {
        return 3
    }
    if (casesuite.testcontainsAll(set2, set1, false) != 0) {
        return 4
    }
    if (casesuite.testsubsetOf(set1, set2, true) != 0) {
        return 5
    }
    if (casesuite.testsubsetOf(set2, set1, false) != 0) {
        return 6
    }

    if (casesuite.testClear(set1) != 0) {
        return 9
    }
    if (casesuite.testClear(set2) != 0) {
        return 10
    }
    if (casesuite.testadd(set1, 18) != 0) {
        return 11
    }
    if (casesuite.testputAll(set1, put_v2) != 0) {
        return 12
    }
    return 0
}
