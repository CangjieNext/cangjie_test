/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: test.py
// EXEC: %compiler %cmp_opt %link-python %f -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args 2>&1 | compare %f

import std.ffi.python.*
import std.log.*

var i = Python.load()

main(): Int64 {
    var test = Python.Import("test")
    test["bar"]([1.toPyObj()])
    test["bar"]([true.toPyObj()])
    test["bar"]([false.toPyObj()])
    test["bar"]([1.0.toPyObj()])
    test["bar"](["test".toPyObj()])
    test["bar"](['t'.toPyObj()])
    Python.unload()
    return 0
}
/* SCAN
1
True
False
1.0
test
t
 */
