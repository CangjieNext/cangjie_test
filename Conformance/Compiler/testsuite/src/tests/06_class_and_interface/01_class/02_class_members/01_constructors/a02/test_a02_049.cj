/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a02_049

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
                : unnamedParameterList (',' namedParameterList)? (',' classNamedInitParamList)?
                | unnamedParameterList (',' classUnnamedInitParamList)?
                  (',' classNamedInitParamList)?
                | classUnnamedInitParamList (',' classNamedInitParamList)?
                | namedParameterList (',' classNamedInitParamList)?
                | classNamedInitParamList
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

  @Description: Check that the primary constructor can not have two parameter lists:
                one with named parameters and the other with class named parameters

  @Mode: compileonly

  @Negative: yes

  @Structure: single
*/

class zazfjk {
  zazfjk(x!: Int64)(let m!: Int32, var o!: Float64) {}
}

main() {

}