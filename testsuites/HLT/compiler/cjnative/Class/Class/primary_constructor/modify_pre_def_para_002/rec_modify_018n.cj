/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

enum B {
    C | D

    func foo() {
        10
    }
}

struct A {
    A(
        var a!: B = B.C,
        var c!: Int64 = 0,
        var b!: Int64 = {
            =>
            a = B.D
            c = !a.foo()
            !a.foo()
        }()
    ) {
    }
}

main() {
    return 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
