/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a04_02

  @Level:         1
  @Assertion:   A.2.5(4) 
                literalConstant
                    : IntegerLiteral
                    | FloatLiteral
                    | CharacterLiteral
                    | CharacterByteLiteral
                    | booleanLiteral
                    | stringLiteral
                    | ByteStringArrayLiteral
                    | unitLiteral
                    ;
                booleanLiteral
                    : TRUE
                    | FALSE
                    ;
                stringLiteral
                    : lineStringLiteral
                    | multiLineStringLiteral
                    | MultiLineRawStringLiteral
                    ;
                lineStringContent
                    : LineStrText
                    ;
                lineStringLiteral
                    : QUOTE_OPEN (lineStringExpression | lineStringContent)* QUOTE_CLOSE
                    ;
                lineStringExpression
                    : LineStrExprStart SEMI* (expressionOrDeclaration (SEMI+ expressionOrDeclaration?)*) SEMI* RCURL
                    ;
                multiLineStringContent
                    : MultiLineStrText
                    ;
                multiLineStringLiteral
                    : TRIPLE_QUOTE_OPEN (multiLineStringExpression | multiLineStringContent)* TRIPLE_QUOTE_CLOSE
                    ;
                multiLineStringExpression
                    : MultiLineStrExprStart end* (expressionOrDeclaration (end+ expressionOrDeclaration?)*) end* RCURL
                    ;

  @Description: Check lineStringLiteral literal.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
main() {
    var s1 = "//f4, no accessible after all requested (in the scenario that has three types: 1.For unary prefix negative ( ;)"
    var s2 = "()and just a compilation error } c)Bidirectional conversion between two tokens is Unit. Since classes modified Note that, when operators are allowed here. 6.2.2 Interface Declaration 6.2.1.1 Syntax of xand yrespectively from package p1 public func abs(x:Float64 ){ let foo3 foo3 is T.a,Tcan be used as follows. struct in interface If the following is as arguments with private,protected (only can both a non-generic interface, struct TaggedPoint { foo1(inout n) // Within the queue is as equivalence. Character Byte Literals Integer literals are divided into (Y, (Y) -> C1` return value that"
    var s3 = "C1are legal since all types It is instantiated, the mapping rules above operators it is the ability to"
    var s4 = "⎠= (𝐽𝑛)𝑇∗⎛⎜⎜⎜⎜⎜ ⎝𝜕𝑦 𝜕𝑥1𝜕𝑦 𝜕𝑥2 ... ; collectionLiteral | MOD_ASSIGN | VAR | (DecimalLiteral DecimalExponent | RSHIFT_ASSIGN ↪ public var a:Int32 =1 let arr1 :VArray <Int64 ,V>where V <: superClass (NL* typeParameters)? ; ASSIGN: '=' ; BOOLEAN: 'Bool' ; multiplicativeExpression (additiveOperator multiplicativeExpression)* ; DO: 'do' block after the following table lists the syntax definition, which is not allowed within a type. For example, @Outer @Inner(22+3) , the following try block, m.unlock() } 10.2.2 The actual value of sealed class or fractional"
    var s5 = "*/. 1.3 Literals A belongs to the last pattern s are defined outside a string representations (rather than or not, it can be downgraded into the following uses are two matching constructor super() // bitwise AND –fetchOr: apply for a compilation"
    var s6 = "patternin the compiler When an error. enum Type Conversion Between Class/Interface does not considered in enumBody '}' |'\\' |'f' |'v' |'0') ; TYPE_ALIAS: 'type' ; CASE: 'case'"
    var s7 = "checked whether the latest dependency between files/packages doesn’t matter; - platform dependent * -1 or equal"
    var s8 = "Chartype, or more catch block). 3.Assume that satisfy the execution environment variables defined as shown as - Note that does not be accessible constructor In an exception is current context of the following try expressions that contain any type cannot be divided into the function ∗the return so a breakexpression appears in section Integer Literals The sample code // b.cj package pkg1 .C // mutually recursive) struct Pair <T1, T2>{ let y: X, v!: Int64 If the type being converted"
    var s9 = ")*'' ; 4.5.1 The following instantiated In an odd n > default values –the second use. •The scope priority of Float64, respectively. In particular, the extension Its scope level, p2.v shadows the beginning is invoked, the same"
    var s10 = "C2<:C1 {} // Return 2. func -():Point { i+=1 } Lambda Expressions . See section [@Java classes except list (i.e., !,&&and ||), function in a pair of the macro with Unittype), the g1 } The AD system will be provided Use this level, p2.v here print( x is inferred to the right Furthermore, a Tuplelike the same as the name in the class type) an"

    var s11 = "Bla-bla ${s1} bla"
    var s12 = "Bla-bla ${ 1 + 1 } bla"
    var s13 = "Bla-bla ${ var a = 1; var b = 2; a + b } bla"
    return 0
}
