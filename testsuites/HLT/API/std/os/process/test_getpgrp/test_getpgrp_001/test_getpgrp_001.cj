/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (!target_win) EXEC: %compiler %cmp_opt %f -o %output
// (!target_win) RUN-EXEC-PIPE: a=`%run %run_opt %output %run_args` && b=`pid=$$ && ps -p $pid -o pgid=` && if [ "$a" = "$b" ]; then echo "test_passed" fi | compare %f
// (!target_win) ASSERT: scan test_passed

import std.posix.*

main(): Unit {
    println(getpgrp())
}
