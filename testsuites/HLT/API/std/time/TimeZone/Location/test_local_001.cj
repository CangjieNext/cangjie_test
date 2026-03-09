/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: check.py
// EXEC: %compiler %cmp_opt %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_args > result.txt
// EXEC: check.py result.txt

import std.time.*
import std.regex.*

main(): Unit {
    let currentDateTime = DateTime.now(timeZone: TimeZone.Local)
    let zoneIdPattern = Regex("^UTC[+-](?:[01][0-9]|2[0-3]):[0-5][0-9]$")
    @Assert(zoneIdPattern.matches(currentDateTime.zoneId))
    @Assert(!currentDateTime.zoneOffset.toString().isEmpty())
    println(currentDateTime.zoneOffset.toString())
}
