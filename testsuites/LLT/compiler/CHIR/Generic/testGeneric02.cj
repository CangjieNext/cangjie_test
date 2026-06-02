// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %diag_json %n.cj -o %n.%suffix

class C<T, V> where T <: Int8, V <: Int8 {
    func f(a: T) {
        return a + a
    }
    func g(a: T) {
        return a + 1
    }
    func g(a: T, b: V) {
        return a + b
    }
    func g(a: T, b: Int8, c: V) {
        return 1 + a + 1 + b + 1 + c + 1
    }
}

main() {
    return 0
}
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
