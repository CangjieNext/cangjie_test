/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (JS) EXEC: cp -r %stdpath .
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan [1, 2, 3]\n[aaa, bbb, ccc]\n

import std.collection.HashMap

main() {
    let map = HashMap<Int64, String>([(1, "aaa"), (2, "bbb"), (3, "ccc")])

    let keysArray = map.keys().toArray()
    let valuesArray = map.values().toArray()

    println(keysArray)
    println(valuesArray)
}
