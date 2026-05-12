/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// ERRCHECK: %compiler %cmp_opt %f %link-python -o %output

import std.ffi.python.*
import std.log.*
import std.math.*

var x = Python.load()

main(): Int64 {
    var i: Float16 = 0.1
    var a = i.toPyObj()
    return 0
}
// ASSERT: scan sema_undeclared_identifier
