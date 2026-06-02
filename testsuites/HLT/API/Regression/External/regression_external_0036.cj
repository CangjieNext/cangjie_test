/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args  | compare %f
// ASSERT: scan for stdout: my string format has 30 chars
// ASSERT: scan-not for stderr: my string format has 30 chars

import std.console.*

main() {
    let stdout = Console.stdOut
    let stderr = Console.stdErr
    stdout.writeln("for stdout: my string format has 30 chars\n")
    stderr.writeln("for stderr: my string format has 30 chars\n")
}
