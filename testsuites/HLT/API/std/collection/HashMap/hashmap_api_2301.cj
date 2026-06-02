/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan NoneValueException: Value does not exist!

import std.collection.*

var hashmap1: HashMap<Int8, String> = HashMap<Int8, String>([(1, "a"), (3, "b")])

main(): Int64 {
    try {
        hashmap1[10]
        ()
    } catch (e: NoneValueException) {
        print("NoneValueException: Value does not exist!")
    }
    return 0
}
