/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

type str = String

struct A<T> where T <: str {
    public var a: str = "yueshu"
    public init(a!: str = "yueshu") {
        this.a = a
    }
}

main(): Int64 {
    var a: A<str> = A<str>()
    if (a.a == "yueshu") {
        return 0
    } else {
        return 1
    }
}

// ASSERT: scan sema_upper_bound_must_be_class_or_interface
