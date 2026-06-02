// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f %diag_json -o %output

func fooa(a: Unit) {
    1
}

struct A {
    let a = 1
    A(a!: Int64 = 1, b!: Int64 = fooa(a = 3)) {}
}

main() {
    0
}
// ASSERT: scan sema_cannot_assign_to_immutable
