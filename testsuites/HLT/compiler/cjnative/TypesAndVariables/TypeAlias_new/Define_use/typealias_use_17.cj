/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

type un = Unit

class classA<T> where T <: un {
    public var a: T
    public init(i: T) {
        a = i
    }
}

main(): Int64 {
    var a: classA<un> = classA<un>(())
    if (a.a == ()) {
        return 0
    } else {
        return 1
    }
}

// ASSERT: scan sema_upper_bound_must_be_class_or_interface
