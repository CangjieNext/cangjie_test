/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

open class X {}

class A<T, K> where T <: (X, Int64), K <: X {}

extend<T, K> A<(T, K), T> where K <: Int64 {
    public func f1(): Bool {
        true
    }
}

main(): Int64 {
    var res = A<(X, Int64), X>().f1()
    if (res) {
        return 0
    }
    0
}
