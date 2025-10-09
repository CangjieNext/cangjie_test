/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a02_105

  @Level:         1

  @Assertion: 2.1.10.2(2)
              The syntax of the primary constructor is as follows:
              structPrimaryInit
                : (structNonStaticMemberModifier)? structName '('
                  structPrimaryInitParamLists? ')'
                  '{'
                  expressionOrDeclarations?
                  '}'
                ;
              structName
                : identifier
                ;
              structPrimaryInitParamLists
                : unnamedParameterList (NL* COMMA NL* namedParameterList)? (NL* COMMA NL* structNamedInitParamList)? NL* COMMA?
                | unnamedParameterList (NL* COMMA NL* structUnnamedInitParamList)? (NL* COMMA NL* structNamedInitParamList)? NL* COMMA?
                | structUnnamedInitParamList (NL* COMMA NL* structNamedInitParamList)? NL* COMMA?
                | namedParameterList (NL* COMMA NL* structNamedInitParamList)? NL* COMMA?
                | structNamedInitParamList NL* COMMA?
                ;
              structUnnamedInitParamList
                : structUnnamedInitParam (',' structUnnamedInitParam)*
                ;
              structNamedInitParamList
                : structNamedInitParam (',' structNamedInitParam)*
                ;
              structUnnamedInitParam
                : structNonStaticMemberModifier? ('let' | 'var') identifier ':' type
                ;
              structNamedInitParam
                : structNonStaticMemberModifier? ('let' | 'var') identifier '!' ':' type
                ('=' expression)?
                ;

  @Description: Check that the parameter list can end in a trailing ',' symbol

  @Mode: run

  @Negative: no

  @Structure: single
*/

struct Yfow {
    Yfow(a: Int64, b!: Bool,) {}
}

main() {
}