/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

type str = String

extend str {
    public static prop i: str {
        get() {
            var a: str = "extend"
            return a
        }
    }
}

struct A<T> where T <: str {
    public var a: str = str.i
    public init() {}
}

main(): Int64 {
    var a: A<str> = A<str>()
    if (a.a == "extend") {
        return 0
    } else {
        return 1
    }
}
