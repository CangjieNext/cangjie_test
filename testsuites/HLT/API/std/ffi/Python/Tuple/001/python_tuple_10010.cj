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
// ASSERT: scan count is 50
// ASSERT: scan len is 100

import std.ffi.python.*
import std.log.*
import std.collection.*
import std.math.*

var x = Python.load(loglevel: INFO)

main(): Int64 {
    var a = PyTuple(Array<PyObj>(100) {
        i => if (i % 2 == 0) {
            return 0.toPyObj()
        } else {
            return 1.toPyObj()
        }
    })
    var x = a["count"]([1.toPyObj()])
    println("count is ${x}")
    println("len is ${Python["len"]([a])}")
    Python.unload()
    return 0
}
