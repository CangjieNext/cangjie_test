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
    if (A<String, Int64>().a != 1) {
        return 1
    }
    if (A<Base, Data>().a != 1) {
        return 1
    }
    return 0
}

class A<T, V> where T <: V {
    public prop a: Int64 {
        get() {
            return 1
        }
    }
}

class Data <: Base {}

open class Base {}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
