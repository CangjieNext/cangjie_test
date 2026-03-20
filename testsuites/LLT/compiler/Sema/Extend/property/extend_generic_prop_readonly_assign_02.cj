// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %n.cj -o %output %diag_json 2>&1 |compare %f

// Regression test: assigning to a readonly property in a two-type-param generic
// extend should produce sema_cannot_assign_to_immutable.

class Bar<T, U> {}

extend<T, U> Bar<T, U> {
    public prop count: Int64 {
        get() { 0 }
    }
}

main() {
    var b = Bar<Int64, String>()
    b.count = 5
}
// ASSERT: scan sema_cannot_assign_to_immutable
