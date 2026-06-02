// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %diag_json %n.cj -o %n.%suffix

class A<T> where T <: Bool {
    func foo(a: T) {
        if (a) {
            var _ = 1
        }
    }
    func foo1(a: T) {
        while (a) {
            var _ = 1
        }
    }
    func foo2(a: T) {
        do {
            var _ = 1
        } while (a)
    }
}

main() {
    var a = A<Bool>()
    a.foo(true)
    a.foo(false)
    return 0
}
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
