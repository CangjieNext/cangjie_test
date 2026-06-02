/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_03_a01_01

  @Level:         1
  @Assertion:   A.2.3.3(1) 
                functionDefinition
                    :(functionModifierList NL*)? FUNC
                    NL* identifier
                    (NL* typeParameters NL*)?
                    NL* functionParameters
                    (NL* COLON NL* type)?
                    (NL* genericConstraints)?
                    (NL* block)?
                    ;
                operatorFunctionDefinition
                    : (functionModifierList NL*)? OPERATOR NL* FUNC
                    NL* overloadedOperators
                    (NL* typeParameters NL*)?
                    NL* functionParameters
                    (NL* COLON NL* type)?
                    (NL* genericConstraints)?
                    (NL* block)?
                    ;

                functionParameters
                    : (LPAREN (NL* unnamedParameterList ( NL* COMMA NL* namedParameterList)? )?
                        NL* RPAREN NL*)
                    | (LPAREN NL* (namedParameterList NL*)? RPAREN NL*)
                    ;

                nondefaultParameterList
                    : unnamedParameter (NL* COMMA NL* unnamedParameter)*
                        (NL* COMMA NL* namedParameter)*
                    | namedParameter (NL* COMMA NL* namedParameter)*
                    ;

                unnamedParameterList
                    : unnamedParameter (NL* COMMA NL* unnamedParameter)*
                    ;

                unnamedParameter
                    : (identifier | WILDCARD) NL* COLON NL* type
                    ;

                namedParameterList
                    : (namedParameter | defaultParameter)
                    (NL* COMMA NL* (namedParameter | defaultParameter))*
                    ;
                namedParameter
                    : identifier NL* NOT NL* COLON NL* type
                    ;
                defaultParameter
                    : identifier NL* NOT NL* COLON NL* type NL* ASSIGN NL* expression
                    ;

                functionModifierList
                    : (functionModifier NL*)+
                    ;
                functionModifier
                    : PUBLIC
                    | PRIVATE
                    | PROTECTED
                    | STATIC
                    | OPEN
                    | OVERRIDE
                    | OPERATOR
                    | REDEF
                    | MUT
                    | UNSAFE
                    ;

  @Description: Check trivial function declaration.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

func f6():Int64 {
    123_i64
}

open class myClass {
    public open func f1() {}
    protected func f2(a: Bool): Bool { !a }
    private func f3(b!:Int32) {}
    static func f4(c!:Float64 = 1.0/3.0) {}
    private operator func * (Right:Float64):Float64 { 0.1 }
}

open class myClass2 <: myClass {
    public open func f5(d: Rune, e!:Range<Int64>, f!:(Float32, Float32)) {}
    override public func f1() {
        let unused = 2 + 2
        return
    }
}

main() {
    return 0
}