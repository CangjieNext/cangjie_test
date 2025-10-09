package p

class A<X, Y, Z> where X <: Int32, Y <: Int64, Z <: Unit {}

type i________<x, y, z> = A<x, y, z>

type I1 <X, Y, Z> = A<X, Y, Z>
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
