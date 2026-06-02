/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_06_a01_01

  @Level:         1
  @Assertion:   A.2.3.6(1)
                structDefinition
                    : (structModifier NL*)? STRUCT NL* identifier (NL* typeParameters NL*)?
                    (NL* UPPERBOUND NL* superInterfaces)?
                    (NL* genericConstraints)? NL* structBody
                    ;

                structBody
                    : LCURL end*
                        structMemberDeclaration* NL*
                        structPrimaryInit? NL*
                        structMemberDeclaration*
                    end* RCURL
                    ;
                structMemberDeclaration
                    : (structInit
                    | staticInit
                    | variableDeclaration
                    | functionDefinition
                    | operatorFunctionDefinition
                    | macroExpression
                    | associatedTypeDefinition
                    | propertyDefinition
                    ) end*
                    ;
                structInit
                    : (structNonStaticMemberModifier NL*)? INIT NL* functionParameters NL* block
                    ;
                staticInit
                    : STATIC INIT LPAREN RPAREN
                    LCURL
                    expressionOrDeclarations?
                    RCURL
                    ;
                structPrimaryInit
                    : (structNonStaticMemberModifier NL*)? structName NL*
                     LPAREN NL* structPrimaryInitParamLists? NL* RPAREN NL*
                    LCURL NL*
                        expressionOrDeclarations?
                    NL* RCURL
                    ;
                structName
                    : identifier
                    ;
                structPrimaryInitParamLists
                    : unnamedParameterList (NL* COMMA NL* namedParameterList)?
                     (NL* COMMA NL* structNamedInitParamList)?
                    | unnamedParameterList (NL* COMMA NL* structUnnamedInitParamList)?
                     (NL* COMMA NL* structNamedInitParamList)?
                    | structUnnamedInitParamList (NL* COMMA NL* structNamedInitParamList)?
                    | namedParameterList (NL* COMMA NL* structNamedInitParamList)?
                    | structNamedInitParamList
                    ;
                structUnnamedInitParamList
                    : structUnnamedInitParam (NL* COMMA NL* structUnnamedInitParam)*
                    ;
                structNamedInitParamList
                    : structNamedInitParam (NL* COMMA NL* structNamedInitParam)*
                    ;
                structUnnamedInitParam
                    : (structNonStaticMemberModifier NL*)? (LET | VAR) NL* identifier NL* COLON NL* type
                    ;
                structNamedInitParam
                    : (structNonStaticMemberModifier NL*)? (LET | VAR) NL* identifier NL* NOT NL* COLON NL* type
                     (NL* ASSIGN NL* expression)?
                    ;
                structModifier
                    : PUBLIC
                    ;
                structNonStaticMemberModifier
                    : PUBLIC
                    | PRIVATE
                    ;


  @Description: Check trivial struct declaration.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

struct S1 { }

public struct TestA0101 { }

main() {
    return 0
}