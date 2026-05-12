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
// ASSERT: scan function 'parse' is deprecated. Use member function `public static func parse(str: String, format: String): DateTime` instead.

import std.time.*

main(): Unit {
    DateTime.parse("Thu, 20 Jun 2024 14:42:33 UTC", DateTimeFormat.of(DateTimeFormat.RFC1123))
}
