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

interface I {
    func test(): C1
}

class C3 {
    public func test(): C2 {
        C2()
    }
}

class A<T> where T <: C3 & I {}

func test<T>() where T <: C3 & I {
}

main(): Int64 {
    return 0
}
