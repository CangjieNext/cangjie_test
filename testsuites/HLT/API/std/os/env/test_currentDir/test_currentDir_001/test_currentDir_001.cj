/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (!target_win) EXEC: %compiler %cmp_opt %f -o %output
// (!target_win & !(target_ios | target_ios_simulator)) RUN-EXEC-PIPE: a=$PWD && b=`%run %run_opt %output %run_args` && if [ $a = $b ]; then echo "pass"; fi | compare %f
// (!target_win & !(target_ios | target_ios_simulator)) ASSERT: scan pass
// (!target_win & (target_ios | target_ios_simulator)) RUN-EXEC: %run %run_opt %output %run_args

import std.process.*
import std.fs.*

main(): Int64 {
    let str = FileInfo(Process.current.workingDirectory).path.toString()
    print(str)
    if (str.isEmpty()) {
        // in any case, cwd should not be empty.
        1
    } else {
        0
    }
}
