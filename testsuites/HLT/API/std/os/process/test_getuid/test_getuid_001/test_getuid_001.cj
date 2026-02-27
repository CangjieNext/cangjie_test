/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not iOS and not Windows) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS and not Windows) RUN-EXEC-PIPE: a=`%run %run_opt %output %run_args` && b=`id -u` && test $a = $b && echo $? | compare %f
// (not Windows) ASSERT: scan-not 1

import std.posix.*

main() {
    var result: UInt32 = getuid()
    print(result.toString())
    return 0
}
