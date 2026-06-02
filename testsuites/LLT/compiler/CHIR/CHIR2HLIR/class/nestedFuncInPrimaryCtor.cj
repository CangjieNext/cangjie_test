// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f %diag_json -o %output

class B {
    B(var a!: Int64 = 3, var b!: Int64 = {
            =>
            func test() {
                a++
            };
            1
        }()) {
    }
}
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_missing_entry
