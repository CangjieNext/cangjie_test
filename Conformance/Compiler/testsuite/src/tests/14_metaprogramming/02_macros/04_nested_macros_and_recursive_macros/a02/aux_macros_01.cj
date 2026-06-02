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

public macro Outer(x: Tokens): Tokens {
    x
}

public macro Inner(x: Tokens): Tokens {
    x
}

public macro OuterDbg(x: Tokens): Tokens {
    if (x.size > 0) {
      return quote(true)
    } else {
      return quote(false)
    }
}

public macro InnerDbg(x: Tokens): Tokens {
    quote("InnerDbg")
}
