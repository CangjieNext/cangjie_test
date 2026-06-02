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
class C {
    var item = 100
}

extend<T> Option<T> <: I<T> where T <: Int64 {
    public prop pa: T {
        get() {
            match (this) {
                case Some(a) => a
                case None => throw Exception()
            }
        }
    }
}

interface I<T> where T <: Int64 {
    prop pa: T
}

main() {
    let c = C()
    let c1 = Some(c)
    let r1 = c1?.item
    return r1.pa - 100
}
