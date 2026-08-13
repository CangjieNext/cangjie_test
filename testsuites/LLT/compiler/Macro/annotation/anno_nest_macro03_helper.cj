// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package anno_nest_macro03_helper

public import std.ast.*

public interface CompositeDecl <: ToTokens {
    mut prop body: Body
}

extend ClassDecl <: CompositeDecl {}
