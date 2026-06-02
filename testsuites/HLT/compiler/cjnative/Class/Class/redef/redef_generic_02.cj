/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    return 0
}

open class Boo<T> {
    public static func foo<V>(x: T, y: V) where V <: Int32 {
        return y
    }
}

class Coo <: Boo<Int32> {
    public static redef func foo<V>(x: Int32, y: V) where V <: Int64 {
        return y
    }
}
// ASSERT: scan sema_generic_constraint_not_looser
