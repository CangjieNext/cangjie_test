/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var a = foo
    var b = match (foo) {
        case x: () -> Unit => 1
        case x: (Int32) -> Int64 => 0
        case x: (Int64) -> Int64 => 3
        case _ => 4
    }
    if (b != 0) {
        return 1
    }
    foo
    var c = match {
        case true => foo
        case _ => foo
    }
    return 0
}

public func foo(x: Int32) {
    return Int64(x)
}

public func foo(x: Int64) {
    return Int64(x)
}

public func foo(x: Int64, y: String) {
    return Int64(x)
}
// ASSERT: scan sema_ambiguous_use
