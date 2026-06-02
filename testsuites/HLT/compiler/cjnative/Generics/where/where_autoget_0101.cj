/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface Ice1 {}

interface Ice2 {}

class B<T> <: Ice1 & Ice2 where T <: Ice1 & Ice2 {
    public static var a: Int32 = 1
}

class A<T> {
    public operator func *(b: A<B<T>>): Bool {
        true
    }
}

extend Int32 <: Ice1 & Ice2 {}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
