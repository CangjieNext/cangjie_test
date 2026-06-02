/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package aaa

main(): Int64 {
    var a = foo(Int32(1))
    var c = foo(1)
    return 0
}

public func foo(x: Int32) {
    return 1
}

enum TimeUnit {
    foo | foo(Int32) | foo(Int64, String)
}
