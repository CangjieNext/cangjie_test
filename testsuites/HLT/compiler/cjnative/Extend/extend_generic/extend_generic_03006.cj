/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_generic_type_argument_not_match_constraint
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

open class X {}

class A<T, K> where T <: (X, Int64), K <: X {}

extend<T> A<(T, Int64), T> {
    public func f1(): Bool {
        true
    }
}

main(): Int64 {
    var res = A<(X, Int32), X>().f1()
    if (res) {
        return 0
    }
    0
}
