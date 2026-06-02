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
    if (casesuite.testretainAll(set1, delete_v1, delete_v1) != 0) {
        return 1
    }
    return 0
}
