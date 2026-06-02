/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description: Macro for the test
  @Structure: complex-aux
  @MacroLib
*/

macro package aux_a11

import std.ast.*

public macro check(value: Tokens) {
    quote({ => Assert.isTrue((return $value) is Nothing); return $value }(); f($value))
}