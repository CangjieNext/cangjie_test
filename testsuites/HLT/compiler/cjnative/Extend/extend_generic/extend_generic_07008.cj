/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_undeclared_identifier

class A<T, K> {}

extend<T, K> A<T, K> {
    func f2(a: T): T {
        f1(a, a)
    }
}

extend<T> A<T, T> {
    func f1(a: T, b: K): T {
        a
    }
}

main(): Int64 {
    var res = A<Int64, Int64>().f2(1)
    if (res == 1) {
        return 0
    }
    return 1
}
