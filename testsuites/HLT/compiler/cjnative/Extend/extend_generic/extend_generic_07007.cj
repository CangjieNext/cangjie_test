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

struct A<T> {}

extend<T> A<T> {
    func f2(): Int64 {
        f1 {i => i * i}
    }
}

extend<T> A<(T, Int64)> {
    func f1(fn: (Int64) -> Int64) {
        fn(1)
    }
}

main(): Int64 {
    var res = A<(Int64, Int64)>().f2()
    if (res == 1) {
        return 0
    }
    return 1
}
