/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan (1, 2, 3, 4, 5, 6, 7, 8, 9)

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load()

main(): Int64 {
    var a = PySlice(1..10)
    var b = PyTuple(
        [0.toPyObj(), 1.toPyObj(), 2.toPyObj(), 3.toPyObj(), 4.toPyObj(), 5.toPyObj(), 6.toPyObj(), 7.toPyObj(),
            8.toPyObj(), 9.toPyObj()])
    print(b["__getitem__"]([a]))
    Python.unload()
    return 0
}
