/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC:  %run %run_opt echo 仓颉鸿蒙test | %output %run_args 2>&1
// ASSERT: scan Some(仓颉鸿蒙test)
import std.console.*

main() {
    let c = Console.stdIn.readln()
    if (c == "仓颉鸿蒙test") {
        return 0
    }
    return 0
}
