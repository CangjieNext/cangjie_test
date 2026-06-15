// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %diag_json %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: scan sema_cannot_assign_to_immutable


main(): Int64 {
    var b = B<Int32>()
    b.a = 0
    return 0
}

class B<T> {}

extend B<Int32> {
    public prop a: Int64 {
        get() {
            return 1
        }
    }
}