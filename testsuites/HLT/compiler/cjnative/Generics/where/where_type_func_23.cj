/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Aoo<T> where T <: (A) -> Int8 & (B) -> Int16 {
    public var a: T
    public init(x: T) {
        a = x
    }
}

func foo(x: A): Int8 {
    return 1
}

func goo(x: B): Int8 {
    return 2
}

open class A {}

class B <: A {}

main() {
    var a1 = Aoo<(B) -> Int16>(goo)
    var a2 = Aoo<(A) -> Int16>(foo)
    return 0
}

// ASSERT: scan sema_generic_type_argument_not_match_constraint
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
