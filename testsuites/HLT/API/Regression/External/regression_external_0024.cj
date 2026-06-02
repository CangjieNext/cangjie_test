/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan The current month is January,the previous month was December

import std.time.*

main() {
    let currentMonth = Month.January

    let preMonth = currentMonth - 1

    println("The current month is ${currentMonth.toString()},the previous month was ${preMonth.toString()}")
}
