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

type bo = Bool

interface I {
    static func a() {
        true
    }
}

extend bo <: I {
    public static func a() {
        true
    }
}

interface interfaceA<T> where T <: bo {
    func f1(a: T): T {
        !a
    }
    static func f2(a: T) {
        return a.toString()
    }
}

class B <: interfaceA<Bool> {}

main(): Int64 {
    if (B.f2(bo.a()) == "true" && B().f1(false)) {
        return 0
    } else {
        return 1
    }
}
