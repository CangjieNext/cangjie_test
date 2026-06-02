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

type int = Int64

extend int {
    public func a(a: int) {
        a
    }
}

enum enumA<T> where T <: int {
    | A

    public func a(a: T) {
        a + Int64(1).a(a)
    }
    public static func b(a: T) {
        Int64(1).a(4)
    }
}

main(): Int64 {
    if (enumA<int>.b(2) == 4 && enumA<int>.A.a(5) == 10) {
        return 0
    } else {
        return 1
    }
}
