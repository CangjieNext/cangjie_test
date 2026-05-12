/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-ERRCHECK: %run %run_opt %output %run_args
// (iOS) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not main!
// ASSERT: scan An exception has occurred:

import std.sync.*

class A <: Exception {}

main() {
    var f = spawn {
        throw A()
    }
    f.get()
    println("main!")
    sleep(Duration.second)
    return 0
}
