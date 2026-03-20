// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %n.cj -o %output %diag_json 2>&1 |compare %f

// Regression test: assigning to a readonly property via member access on a
// generic extend instance should produce sema_cannot_assign_to_immutable.

class Container<T> {
    public var inner: T
    public init(v: T) { inner = v }
}

class Wrapper<T> {}

extend<T> Wrapper<T> {
    public prop label: String {
        get() { "wrapper" }
    }
}

main() {
    var w = Wrapper<Int64>()
    w.label = "new"
}
// ASSERT: scan sema_cannot_assign_to_immutable
