/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %link-python %f -o %output
// RUN-EXEC-PIPE-1: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan-0 what?

import std.ffi.python.*
import std.log.*

var i = Python.load(loglevel: INFO)

main(): Int64 {
    var sys = Python.Import("sys")
    var test = sys["exit"]([1])
    print("what?")
    return 0
}
