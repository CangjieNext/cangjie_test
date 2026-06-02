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
    if (C<String>().m != 1) {
        return 1
    }
    return 0
}

open class A<T> {
    public func foo() {
        return 1
    }
}

interface I<T> <: A<T> {
    prop m: Int64 {
        get() {
            return foo()
        }
    }
}

class C<T> <: I<T> {}
// ASSERT: scan sema_interface_inherit_non_interface
// ASSERT: scan sema_undeclared_identifier
