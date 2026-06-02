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

type A<T, k> = interfaceA<T, k>

interface interfaceA<T, K> where T <: Rune, K <: String {
    func a(a: T) {
        a
    }
    func b(b: K) {
        b
    }
}

class C {}

extend C <: A<Rune, String> {
    public static func c() {
        r'2'
    }
    public static func d() {
        "r'2'"
    }
}

class B <: A<Rune, String> {}

main(): Int64 {
    func a(a: B) {
        return B().a(r'2').toString() + B().b("r'2'") + C.c().toString() + C.d()
    }

    if (a(B()) == "2r'2'2r'2'") {
        return 0
    } else {
        return 1
    }
}
