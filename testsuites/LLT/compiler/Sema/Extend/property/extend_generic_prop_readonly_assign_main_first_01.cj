// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %n.cj -o %output %diag_json 2>&1 |compare %f

// Regression test for Issue #701: assigning to a readonly property in a
// specialized generic extend with main() BEFORE class/extend definitions
// (forward reference) must produce sema_cannot_assign_to_immutable, not ICE.

main(): Int64 {
    var b = B<Int32>()
    b.a = 0
    return 0
}

class B<T> {}

extend B<Int32> {
    public prop a: Int64 {
        get() { 1 }
    }
}
// ASSERT: scan sema_cannot_assign_to_immutable
