/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T> {
    a

    public func b(x: T) {
        0
    }
}

main(): Int64 {
    var i = A<Int64>.a
    i.b(true)
}
// ASSERT: scan sema_cannot_convert_literal
