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

  @Description: Check topLevelObject expression usages.
  @Level:         1

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: aux_macros_01.cj
*/

import aux_macros_01.*

// classDefinition
class A {}

// interfaceDefinition
interface I {}

// functionDefinition
func foo() {}

// variableDeclaration
var v = 0
let l = 0

// enumDefinition
enum E {
    | A
    | B
}

// structDefinition
struct S {}

// typeAlias
type TA = (Int64, Int64)

// extendDefinition
extend String {}

// foreignDeclaration
foreign func bar(): Unit

// macroExpression
@Identity(var y = 0)

main() {}

