/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 2400-02-29T00:59:59+17:59
// ASSERT: scan 2019-10-12T07:20:50Z

import std.time.*
import std.collection.*

main(): Int64 {
    println(DateTime.parse("2400-02-29T00:59:59+17:59"))
    println(DateTime.parse("2019-10-12T07:20:50Z"))

    return 0
}
