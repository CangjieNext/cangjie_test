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

interface I1<T> {
    func foo1(x: T): Int64 {
        return 1
    }
}

interface I2<T> {
    func foo2(x: T): Int32 {
        return 2
    }
}

// x of "init(x:T)" will be shadow x of "var x:T"
class B<T> <: I1<T> & I2<T> {
    public var x: T
    public init(x: T) {
        x = x
    }
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_cannot_assign_to_immutable
