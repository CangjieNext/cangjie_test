/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 3.140625
// ASSERT: scan 3.141111
// ASSERT: scan 3.141111

import std.console.*

main() {
    Console.stdErr.writeln(3.1411111111111f16)
    Console.stdErr.writeln(3.1411111111111f32)
    Console.stdErr.writeln(3.1411111111111f64)
    return 0
}
