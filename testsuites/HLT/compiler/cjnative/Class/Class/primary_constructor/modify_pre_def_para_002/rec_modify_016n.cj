/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct A {
    A(var a!: Unit = (), var b!: Unit = (a = ())) {
    }
}

main() {
    return 1
}
// ASSERT: scan sema_cannot_assign_to_immutable
