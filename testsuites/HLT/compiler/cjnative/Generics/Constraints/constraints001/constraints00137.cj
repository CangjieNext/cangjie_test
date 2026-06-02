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

interface I {
    operator func ()(x: Int) {
        x - 1
    }
}

class A {}

extend A <: I {}

func test1<T1>(a1: T1) where T1 <: I {
    func test2<T2>(a2: T2) where T2 <: T1 {
        func test3<T3>(a3: T3) where T3 <: T2 {
            func test4<T4>(a4: T4) where T4 <: T3 {
                func test5<T5>(a5: T5) where T5 <: T4 {
                    return a5(1)
                }
                test5<T4>(a4)
            }
            test4<T3>(a3)
        }
        test3<T2>(a2)
    }
    test2<T1>(a1)
}

main(): Int64 {
    return test1<I>(A())
}
