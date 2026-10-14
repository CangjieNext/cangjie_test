// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 'foo' of IRoot reached from another package through ISub and through AppIface is one and the same
// default implementation, so extending 'C' with AppIface requests no implementation of 'foo'.

// DEPENDENCE: lib.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt lib.cj -o lib.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %f

package app

public import lib.*

public interface AppIface <: IRoot {}

extend C <: AppIface {}
