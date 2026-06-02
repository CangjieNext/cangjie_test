/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_01_a01_01

  @Level:         1
  @Assertion:   A.2.3.1(1)
                classDefinition
                    : (classModifierList NL*)? CLASS NL* identifier
                    (NL* typeParameters NL*)?
                    (NL* UPPERBOUND NL* superClassOrInterfaces)?
                    (NL* genericConstraints)?
                    NL* classBody
                    ;
                superClassOrInterfaces
                    : superClass (NL* BITAND NL* superInterfaces)?
                    | superInterfaces
                    ;
                classModifierList
                    : classModifier+
                    ;
                classModifier
                    : PUBLIC
                    | ABSTRACT
                    | OPEN
                    ;
                typeParameters
                    : LT NL* identifier (NL* COMMA NL* identifier)* NL* GT
                    ;
                superClass
                    : classType
                    ;
                classType
                    : (identifier NL* DOT NL*)* identifier (NL* typeParameters)?
                    ;
                typeArguments
                    : LT NL* type (NL* COMMA NL* type)* NL* GT
                    ;
                superInterfaces
                    : interfaceType (NL* COMMA NL* interfaceType )*
                    ;
                interfaceType
                    : classType
                    ;
                genericConstraints
                    : WHERE NL* (identifier | THISTYPE) NL* UPPERBOUND NL* upperBounds 
                    (NL* COMMA NL* (identifier | THISTYPE) NL* UPPERBOUND NL* upperBounds)*
                    ;
                upperBounds
                    : userType (NL* BITAND NL* userType)*
                    ;
                classBody
                    : LCURL end*
                        classMemberDeclaration* NL*
                        classPrimaryInit? NL*
                        classMemberDeclaration* end* RCURL
                    ;

                classMemberDeclaration
                    : (classInit
                    | staticInit
                    | variableDeclaration
                    | functionDefinition
                    | operatorFunctionDefinition
                    | macroExpression
                    | associatedTypeDefinition
                    | propertyDefinition
                    ) end*
                    ;
                classInit
                    : (classNonStaticMemberModifier NL*)? INIT NL* functionParameters NL* block
                    ;
                staticInit
                    : STATIC INIT LPAREN RPAREN
                    LCURL
                    expressionOrDeclarations?
                    RCURL
                    ;
                classPrimaryInit
                    : (classNonStaticMemberModifier NL*)? className NL* LPAREN NL*
                          classPrimaryInitParamLists
                      NL* RPAREN NL*
                      LCURL NL*
                          (SUPER callSuffix)? end
                          expressionOrDeclarations?
                      NL* RCURL
                    ;
                className
                    : identifier
                    ;
                classPrimaryInitParamLists
                    : unnamedParameterList (NL* COMMA NL* namedParameterList)?
                     (NL* COMMA NL* classNamedInitParamList)?
                    | unnamedParameterList (NL* COMMA NL* classUnnamedInitParamList)?
                     (NL* COMMA NL* classNamedInitParamList)?
                    | classUnnamedInitParamList (NL* COMMA NL* classNamedInitParamList)?
                    | namedParameterList (NL* COMMA NL* classNamedInitParamList)?
                    | classNamedInitParamList
                    ;
                classUnnamedInitParamList
                    : classUnnamedInitParam (NL* COMMA NL* classUnnamedInitParam)*
                    ;
                classNamedInitParamList
                    : classNamedInitParam (NL* COMMA NL* classNamedInitParam)*
                    ;

                classUnnamedInitParam
                    : (classNonSMemberModifier NL*)? (LET | VAR) NL* identifier NL* COLON NL* type
                    ;

                classNamedInitParam
                    : (classNonSMemberModifier NL*)? (LET | VAR) NL* identifier NL* NOT NL* COLON NL* type
                     (NL* ASSIGN NL* expression)?
                    ;

                classNonStaticMemberModifier
                    : PUBLIC
                    | PRIVATE
                    | PROTECTED
                    ;

                associatedTypeDefinition
                    : TYPE_ALIAS NL* identifier NL* ASSIGN type NL*
                    ;


  @Description: Check trivial class declaration.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

class myClass{
    public let cl1: Int32 = 13
    public let cl2: Int32
    public var vl1: Int32 = 14
    public var vl2: Int32
    protected let cl3: Int32 = 15
    protected let cl4: Int32
    protected var vl3: Int32 = 16
    protected var vl4: Int32
    private let cl5: Int32 = 17
    private let cl6: Int32
    private var vl5: Int32 = 18
    private var vl6: Int32
    let cl7: Int32 = 19
    let cl8: Int32
    var vl7: Int32 = 20
    var vl8: Int32
    static let cl9: Int32 = 21
    static var vl9: Int32 = 22
    myClass (){
        cl2 = 123
        vl2 = 231
        cl4 = 345
        vl4 = 543
        cl6 = 456
        vl6 = 654
        cl8 = 789
        vl8 = 987
    }
}

main() {
    return 0
}