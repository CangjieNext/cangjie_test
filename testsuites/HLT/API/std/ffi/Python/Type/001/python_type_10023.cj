/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// ERRCHECK: %compiler %cmp_opt %link-python %f -o %output

import std.ffi.python.*
import std.log.*

var i = Python.load()

main(): Int64 {
    Python["print"]([1.toPyObj(), 1])
    return 0
}
// ASSERT: scan sema_no_match_operator_function_call
// ASSERT: scan sema_cannot_convert_literal
