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

public macro Inner(input: Tokens): Tokens { 
    assertParentContext("Outer") 
    setItem("key1", "value1") 
    setItem("key2", "value2") 
    // ...
    input
} 

public macro Outer(input: Tokens): Tokens {
    let messages = getChildMessages("Inner") 
    for (m in messages) { 
        let value1 = m.getString("key1") 
        let value2 = m.getString("key2") 
        // ...
    }
    input
}
