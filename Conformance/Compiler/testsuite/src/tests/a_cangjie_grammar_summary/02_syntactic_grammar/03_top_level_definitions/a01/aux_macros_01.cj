/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: topLevelObject
              : classDefinition
              | interfaceDefinition
              | functionDefinition
              | variableDeclaration
              | enumDefinition
              | structDefinition
              | typeAlias
              | extendDefinition
              | foreignDeclaration
              | macroDefinition
              | macroExpression
              ;

  @Description: Check "topLevelObject = macroDefinition" case.

  @Structure: complex-aux

  @MacroLib
*/

macro package aux_macros_01
import std.ast.*

// macroDefinition
public macro Identity(tokens: Tokens): Tokens {
    tokens
}

