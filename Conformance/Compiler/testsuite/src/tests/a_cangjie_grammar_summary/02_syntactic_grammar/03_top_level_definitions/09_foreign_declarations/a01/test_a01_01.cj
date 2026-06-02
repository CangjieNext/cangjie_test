/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_09_a01_01

  @Level:         1
  @Assertion:   A.2.3.9(1)
                foreignDeclaration
                    : FOREIGN NL* (foreignBody | foreignMemberDeclaration)
                    ;
                foreignBody
                    : LCURL end* foreignMemberDeclaration* end* RCURL
                    ;
                foreignMemberDeclaration
                    : (classDefinition
                    | interfaceDefinition
                    | functionDefinition
                    | macroExpression
                    | variableDeclaration) end*
                    ;

  @Description: Check some foreign declarations.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
  @Issue:       6535
*/

// foreign 仅支持声明函数
foreign func foo(): Unit

foreign {
    func foo2(): Unit
    func foo3(): Unit
}

main() {
    return 0
}