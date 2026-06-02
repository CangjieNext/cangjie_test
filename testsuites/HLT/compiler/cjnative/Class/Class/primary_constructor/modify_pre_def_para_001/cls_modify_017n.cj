/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    A(
        var a!: Int64 = 1,
        var b!: Bool = a > {
            =>
            a = 3
            2
        }()
    ) {
    }
}

main() {
    return 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
