/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

interface A<T> {
    operator func *(b: A<T>): Bool {
        this.a
        super.b
        return true
    }
}

class A_B<T> <: A<T> {}

main(): Int64 {
    var a: A<Int32> = A_B<Int32>()
    var b: A<Int32> = A_B<Int32>()
    if (!(b * a)) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_not_member_of
// ASSERT: scan sema_use_super_in_interface
