/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {
    var a: Array<T>
    init(a: Array<T>) {
        this.a = a
    }
    protected operator func [](arg1: Int64, value!: T): Unit {
        a[arg1] = value
    }
}

main() {
    var b = A([1, 2, 3])
    b['c'] = 3
    b[1, 1] = 3
    1
}
// ASSERT: scan sema_cannot_assign_to_subscript
