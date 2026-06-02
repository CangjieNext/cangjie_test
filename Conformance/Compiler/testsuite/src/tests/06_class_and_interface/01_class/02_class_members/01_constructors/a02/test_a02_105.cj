/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a02_105

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

  @Description: Check that the super invocation can not be placed in between
                other elements of the constructor body

  @Mode: compileonly

  @Negative: yes

  @Structure: single
*/

open class DH {
}

class Uyeqg <: DH {
  Uyeqg() {
    func f() {}
    let x = 1
    super()
    var z = x + 3
    print(z)
  }
}

main() {
}