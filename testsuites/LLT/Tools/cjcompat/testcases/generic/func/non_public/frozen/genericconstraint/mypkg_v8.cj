// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V8
public open class B {}
public open class A <: B {}
func global_func_03<T1, T2>() where T1 <: A & B, T2 <: A { 0 }
public func global_func_04<T1, T2>() where T1 <: A, T2 <: A { 0 }
@Frozen public func global_func_05<T1, T2>() where T1 <: A, T2 <: A { global_func_03<T1, T2>() }
