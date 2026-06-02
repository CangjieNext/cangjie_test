/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

type li = Array<Bool>

class A<T> where T <: li {
    public func f1(a: T): Bool {
        return a[0]
    }
    public static func f2(a: T): T {
        return a
    }
}

main(): Int64 {
    if (A<li>().f1([true]) && A<li>.f2([true])[0]) {
        return 0
    } else {
        return 1
    }
}

// ASSERT: scan sema_upper_bound_must_be_class_or_interface
