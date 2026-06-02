/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:  Aux file with some macros for testing

  @Structure:    complex-aux

  @MacroLib
*/

macro package aux_macros_01
import std.ast.*

public macro compile(x: Tokens) {
    x
}

public macro Float32Const(x: Tokens) {
    quote(56.9465_f32)
}

public macro toFloat32(x: Tokens) {
    quote(Float32($x))
}
