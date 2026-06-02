/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<X> {
    public func f<Y>(x: Int64): Y where Y <: Int64 {
        x
    }
}

main() {
    A<Int64>().f<Int64>(1)
    0
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
