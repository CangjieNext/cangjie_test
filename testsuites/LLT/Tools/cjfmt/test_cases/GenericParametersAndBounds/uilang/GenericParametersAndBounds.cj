// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func x<T  , R, Z>() where T    <: R, R <:   Z {}

interface I1   <T,    R, Z>    where T <: R, R   <: Z {}

interface I2<T,    R, Z> where T <: R,    R <:    Z {}

class C<T,
 R, 
 Z> <: I2<T, 
 R, Z> where T <: R, R 
 <: Z {}

struct S<   T, R  , Z  >   <:  G<T, R, Z> where T <: R, R <: Z {}

type G<T,  R , Z> = I1 <T ,  R,  Z>

enum E < T, R, Z> where T  <:  R, R <: Z {
    A
}

extend<T , R ,  Z> C<T , R ,  Z> <: I1<T , R ,   Z> where T <: R , R  <:  Z {}