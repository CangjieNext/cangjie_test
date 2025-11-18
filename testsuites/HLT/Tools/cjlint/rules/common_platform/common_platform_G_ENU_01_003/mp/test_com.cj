/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common enum Either<L, R> where L <: Equatable<L>, R <: Equatable<R> {
    | Left(L)
    | Right(R)

    common func goo(x:L): Unit
    common func foo<M>(x:M): Unit
}

