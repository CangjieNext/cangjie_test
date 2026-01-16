/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform class A<X, Y> {
    public platform init(){}
}

public platform class C<X, Y> where X <: A<(X, Y), (Y, X)>, Y <: A<(Y, X), (X, Y)> {
    public platform init(){}
    public platform func f1(): Int64 {
        1
    }
}