/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./../../../../API/asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt %f asan.%middle -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare  %f
// ASSERT: scan main!
// ASSERT: scan-5 An exception has occurred:

import std.sync.*
import asan.*

class A <: Exception {}

var flag = 0

main() {
    for (_ in 0..5) {
        var f = spawn {
            flag += 1
            throw A()
        }
    }
    println("main!")

    while (flag != 5) {
        sleep(Duration.Zero)
    }

    asanGC()
    return 0
}
