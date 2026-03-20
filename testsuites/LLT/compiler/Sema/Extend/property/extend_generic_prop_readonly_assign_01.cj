// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %n.cj -o %output %diag_json 2>&1 |compare %f

// Regression test: assigning to a readonly property in a generic extend should
// produce sema_cannot_assign_to_immutable, not crash or internal error.

class Foo<T> {}

extend<T> Foo<T> {
    public prop value: Int64 {
        get() { 0 }
    }
}

main() {
    var f = Foo<Int64>()
    f.value = 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
