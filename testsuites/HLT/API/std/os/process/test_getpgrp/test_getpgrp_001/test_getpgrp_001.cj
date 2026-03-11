/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (!target_ios) EXEC: %compiler %cmp_opt %f -o %output
// (!target_ios) RUN-EXEC-PIPE: a=`%run %run_opt %output %run_args` && b=`pid=$$ && ps -p $pid -o pgid=` && test $a = $b && echo $? | compare %f
// (!target_ios) ASSERT: scan-not 1

import std.posix.*

main() {
    var result: Int32 = getpgrp()
    print(result.toString())
    return 0
}
