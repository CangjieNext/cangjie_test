/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan function 'trimLeft' is deprecated. Use member function ` public func trimStart(): String` instead.
// ASSERT: scan function 'trimRight' is deprecated. Use member function ` public func trimEnd(): String` instead.

import std.unicode.*

main(): Unit {
    let str = "hello world"
    str.trimLeft()
    str.trimRight()

    let str2 = "hello world"
    str2.trimStart()
    str2.trimEnd()
}
