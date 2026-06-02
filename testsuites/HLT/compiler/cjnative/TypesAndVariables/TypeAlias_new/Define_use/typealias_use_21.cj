/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface InterfaceA<T> where T <: ?Bool {
    static func foo(x: T) {
        return x
    }
}

type IA<T> = InterfaceA<T>

class A <: IA<Option<Bool>> {}

main(): Int64 {
    var a: Option<Bool> = A.foo(Option<Bool>.Some(true))
    var b: Bool = match (a) {
        case Some(x) => x
        case _ => false
    }
    if (b) {
        return 0
    }
    return 1
}

// ASSERT: scan sema_upper_bound_must_be_class_or_interface
