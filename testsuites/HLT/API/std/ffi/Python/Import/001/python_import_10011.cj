/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: my_dir_2
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan hello_my_test

import std.ffi.python.*
import std.log.*

var x = Python.load(loglevel: INFO)

main(): Int64 {
    var a = Python.Import("my_dir_2.my_test")
    if (a.isAvailable()) {
        Python.unload()
        return 0
    }
    Python.unload()
    return 1
}
