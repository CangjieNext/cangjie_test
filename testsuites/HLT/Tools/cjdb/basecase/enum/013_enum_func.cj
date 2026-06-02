/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum A {
    AAA
}

enum B<T, R> {
    X(T) | Y(R)
}

func test01<T>(a: T): T {
    return a
}

func test02(): A {
    A.AAA
}

func test03(): B<Int64, Bool> {
    B<Int64, Bool>.X(1)
}

main(): Int64 {
    let op1 = test01<A>(A.AAA)
    let op2 = test01<A>(AAA)
    let op3 = test01<B<Int64, Bool>>(B<Int64, Bool>.X(1))
    let op4 = test02()
    let op5 = test03()
    return 0
}
