// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %diag_json %n.cj -o %n.%suffix



extend String {
    func escape() {
        return 0
    }
}

class A<T> where T <: String {
    public func foo(a: T) {
        a.escape()
    }
}

main() {
    0
}
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
