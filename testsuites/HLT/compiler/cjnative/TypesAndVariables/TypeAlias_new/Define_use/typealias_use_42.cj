/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

type fl = Float16

struct A<T> where T <: fl {
    public func f1(a: T): Int64 {
        return 3
    }
    public static func f2(a: T): T {
        return a
    }
}

main(): Int64 {
    if (A<fl>().f1(3.33) == 3 && A<fl>.f2(3.33) == 3.33) {
        return 0
    } else {
        return 1
    }
}

// ASSERT: scan sema_upper_bound_must_be_class_or_interface
