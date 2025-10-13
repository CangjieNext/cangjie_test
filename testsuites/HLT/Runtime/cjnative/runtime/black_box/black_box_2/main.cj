/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package tmp_test

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.runtime.*

func compute(): Int64 {
    1
}

func myBenchmark(): Unit {
    var sum = 0
    for (x in 0..10000) {
        sum += compute()
        blackBox(sum)
    }
}

main(): Int64 {
    myBenchmark()
    return 0
}
