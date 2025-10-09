/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a02_267

  @Level:         1

  @Assertion: 6.1.2.1(2)
              The syntax of the primary constructor is as follows:
              classPrimaryInit
                : classNonStaticMemberModifier? className '(' classPrimaryInitParamLists? ')'
                  '{'
                    superCallExression?
                    ( expression
                    | variableDeclaration
                    | functionDefinition)*
                  '}'
                ;
              className
                : identifier
                ;
              classPrimaryInitParamLists
                : unnamedParameterList (NL* COMMA NL* namedParameterList)? (NL* COMMA NL* classNamedInitParamList)? NL* COMMA?
                | unnamedParameterList (NL* COMMA NL* classUnnamedInitParamList)? (NL* COMMA NL* classNamedInitParamList)? NL* COMMA?
                | classUnnamedInitParamList (NL* COMMA NL* classNamedInitParamList)? NL* COMMA?
                | namedParameterList (NL* COMMA NL* classNamedInitParamList)? NL* COMMA?
                | classNamedInitParamList NL* COMMA?
                ;
              classUnnamedInitParamList
                : classUnnamedInitParam (',' classUnnamedInitParam)*
                ;
              classNamedInitParamList
                : classNamedInitParam (',' classNamedInitParam)*
                ;
              classUnnamedInitParam
                : classNonStaticMemberModifier? ('let'|'var') identifier ':' type
                ;
              classNamedInitParam
                : classNonStaticMemberModifier? ('let'|'var') identifier'!' ':' type ('=' expression)?
                ;
              classNonStaticMemberModifier
                : 'public'
                | 'protected'
                | 'private'
                ;

  @Description: Check that the parameter list can end in a trailing ',' symbol

  @Mode: run

  @Negative: no

  @Structure: single
*/

class Yfow {
  Yfow(a: Int64, b!: Bool,) {}
}

main() {
}