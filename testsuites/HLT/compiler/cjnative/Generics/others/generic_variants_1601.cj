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
    if (B<Int32>().a != 1) {
        return 1
    }
    return 0
}

open class A<T> {
    public func foo() {
        return 1
    }
}

class B<T> <: A<T> where T <: Int64 {
    public prop a: Int64 {
        get() {
            return foo()
        }
    }
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
