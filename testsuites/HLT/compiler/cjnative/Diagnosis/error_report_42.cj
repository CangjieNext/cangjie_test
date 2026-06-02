/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {}

class Sub <: Base {
    public func ff(x: Sub, y!: Int32 = 0): Int32 {
        4
    }
    public func ff(x: Sub): Int32 {
        5
    }
}

main(): Int64 {
    var b = Sub().ff
    return 0
}
// ASSERT: scan sema_ambiguous_use
