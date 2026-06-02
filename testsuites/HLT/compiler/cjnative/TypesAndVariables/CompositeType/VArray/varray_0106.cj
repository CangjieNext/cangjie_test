/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct A {
    let a: VArray<Int64, $1> = [1]
}

main() {
    var a = A()
    a.a[0] = 0
    return a.a[0]
}
// ASSERT: scan sema_cannot_assign_to_immutable
