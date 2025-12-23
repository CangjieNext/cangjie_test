/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: stdin_read.txt
// EXEC: %compiler %cmp_opt -o %output %f
// (not iOS) RUN-EXEC-PIPE-0: %run %run_opt %output %run_args < stdin_read.txt 2>&1 | compare %f
// ASSERT: scan Some(a)

import std.console.*

main() {
    let c = Console.stdIn.read()
    println(c)
    return 0
}
