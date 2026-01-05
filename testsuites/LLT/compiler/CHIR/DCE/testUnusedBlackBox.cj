// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan-not unused expression

import std.runtime.*

main(): Unit {
    var x___ = 1
    blackBox(x___)
}

/* SCAN
# blackBox should never trigger "unused expression" warning
# because its purpose is to prevent dead code elimination.
# Even if the argument appears unused, the blackBox call itself
# marks the value as used and should not be reported as unused.

0 warnings generated, 0 warnings printed.
*/

