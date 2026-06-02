/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a04_03

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

  @Description: Check multiLineStringLiteral literal.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
main() {
    var s1 = """
        `a.fooAdj` as long as MONDAY = 8.0 let c1=Option <C>.Some(c) let
        /* /*  */
        *//*  */
        """
    var s2 = """
         concise syntax is: IntegerLiteralSuffix : '0' [oO] OctalDigit : '\'' ; public import java .lang .Integer

        complier, otherwise, the not supported) Multipleboundariescanbespecified The .jsfile from. foreign blocks the

        """
    var s3 = """
          """
    var s4 = """
        To invoke the following is as arguments with private,protected
        Analogously, given outer if there are two ways to the
        """
    var s5 = """
        ():Float16 {
        ${ """
        /*  */"""}

        """
    var s6 = """
         /* /* /*  */
        /*  */
        */
        /* ofva.b.cis equal to terminating the package, and the text

        /*  */
        •Regular parameters in interfaces , the type is empty, the block ↪

        NaN), positive number of a variable
        /*  */
        */

        */

        /*  */

        /* /* executed. func

        /* 0x) and processed as `bar` //
        res1 =a|>{x:Int32
        */
        /*  */ */
        */C<:CType {} } 8.2.1.1 Modifier of sealed class or fractional

        prefix) and cannot perform type Cdoes not be added to defining a string representations (rather
        /* Unittype, Nothingtype, Stringtype, Tupletype, then the calling

        */transferred to differentiate it will not explicitly

        """
    var s7 = """
         x=gg1() // f2 class B happens before

        """
    
    var s8 = """
        Bla-bla 
        ${s1} 
        bla
    """
    var s9 = """
        Bla-bla ${ 1 + 1 } bla"""
    var s10 = """
        Bla-bla ${ 
            var a = 1;
            var b = 2;
            a + b
        } bla"""

    return 0
}
