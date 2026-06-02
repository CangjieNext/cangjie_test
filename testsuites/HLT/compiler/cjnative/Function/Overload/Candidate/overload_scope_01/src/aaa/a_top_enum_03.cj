/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

package aaa

main(): Int64 {
    var a = foo(Int64(1))
    var b = match (a) {
        case _ => 0
    }
    if (b != 0) {
        return 2
    }
    var c = foo(1)
    var d = match (c) {
        case _ => 0
    }
    if (d != 0) {
        return 2
    }
    return 0
}

public func foo(x: Int32) {
    return 1
}

enum TimeUnit {
    foo | foo(Int64) | foo(Int64, String)
}
// ASSERT: scan sema_mismatched_types
