/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface InterfaceA<T> {
    static func foo(x: T) {
        return x
    }
}

type IA<T> = InterfaceA<T>

type C = I

class A<T> {}

extend<T> A<T> <: IA<Option<Bool>> {}

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
