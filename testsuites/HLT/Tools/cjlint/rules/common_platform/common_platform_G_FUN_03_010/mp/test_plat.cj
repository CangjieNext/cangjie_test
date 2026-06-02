/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific enum Either<L, R> where L <: Equatable<L>, R <: Equatable<R> {
    | Left2(L)
    | Right2(R)

    specific func goo(x:L): Unit {
        print(x)
    }
    specific func foo<M>(x:M): Unit{
        print(x)
    }
}