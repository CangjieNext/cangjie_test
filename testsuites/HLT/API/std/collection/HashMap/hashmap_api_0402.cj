/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

var m: HashMap<Int8, String> = HashMap<Int8, String>()

main(): Int64 {
    try {
        m = HashMap<Int8, String>(4611686018427387905)
    } catch (e: OutOfMemoryError) {
        return 0
    }
    return 1
}
