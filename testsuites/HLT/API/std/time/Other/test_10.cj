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
// ASSERT: scan-5 2022-12-30T12:56:34+08:00

import std.time.*
import std.collection.*

main(): Int64 {
    println(DateTime.parse("223012 +08:00 12:56:34", "yyddMM OOOO HH:mm:ss"))
    println(DateTime.parse("221230 +08:00 34:12:56", "yyMMdd OOOO ss:HH:mm"))
    println(DateTime.parse("34:12:56 123022 +08:00", "ss:HH:mm MMddyy OOOO"))
    println(DateTime.parse("+08:00 34:12:56 123022", "OOOO ss:HH:mm MMddyy"))
    println(DateTime.parse("12 +08:00 30 34 12 56 22", "MM OOOO dd ss HH mm yy"))

    return 0
}
