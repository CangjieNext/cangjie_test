/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class C1 {}

class C2 <: C1 {}

struct A<X> {
    public func test<T>(x: T) where T <: C1 {
        x
    }
}

main() {
    A<Int64>().test<C2>(C2())
    return 0
}
