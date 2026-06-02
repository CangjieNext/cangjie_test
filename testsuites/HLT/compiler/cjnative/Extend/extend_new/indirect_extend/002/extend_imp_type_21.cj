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

interface InterfaceA<T> where T <: ?Bool {
    static func foo(x: T) {
        return x
    }
}

type IA<T> = InterfaceA<T>

type C = I

class A<T> {}

extend<T> A<T> <: IA<Option<Bool>> {
    public operator func |(b: A<Option<Bool>>): Int64 {
        0
    }
}

interface I {
    operator func |(b: A<Option<Bool>>): Int64 {
        0
    }
}

extend<T> A<T> <: C {}

main(): Int64 {
    var c = A<Option<Bool>>() | A<Option<Bool>>()
    var a: Option<Bool> = A<Option<Bool>>.foo(Option<Bool>.Some(true))
    var b: Bool = match (a) {
        case Some(x) => x
        case _ => false
    }
    if (b && c == 0) {
        return 0
    }
    return 1
}
