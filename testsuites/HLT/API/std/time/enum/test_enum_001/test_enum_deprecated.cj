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
// ASSERT: scan function 'value' is deprecated. Use member function `public func toInteger(): Int64` instead.
// ASSERT: scan function 'value' is deprecated. Use member function `public func toInteger(): Int64` instead.

import std.time.*

main(): Unit {
    DayOfWeek.of(1).value()
    Month.of(12).value()
}
