/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:  Stub aux macro lib for LangRunner tests

  @Structure:    complex-aux

  @MacroLib
*/

macro package aux_stub_pkg
import std.ast.*

macro stub(x: Tokens): Tokens {
    Tokens()
}
