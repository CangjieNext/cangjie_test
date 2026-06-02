/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         14_01_a01_02

  @Level:         1

  @Assertion:    14.1(1) The code reference uses the quote expression to reference specific code, indicating
                 operable data objects. The syntax of the quote expression is as follows:
                    quoteExpression 
                        : 'quote' quoteExpr 
                        ; 
                    quoteExpr 
                        : '(' quoteParameters ')' 
                        ; 
                    quoteParameters 
                        : (quoteToken | quoteInterpolate | macroExpression)+ 
                        ; 
                    quoteToken 
                        : '.' | ',' | '(' | ')' | '[' | ']' | '{' | '}' | '**' | '*' | '%' | '/' | '+' | '-' 
                        | '|>' | '~>' 
                        | '++' | '--' | '&&' | '||' | '!' | '&' | '|' | '^' | '<<' | '>>' | ':' | ';' 
                        | '=' | '+=' | '-=' | '*=' | '**=' | '/=' | '%=' 
                        | '&&=' | '||=' | '&=' | '|=' | '^=' | '<<=' | '>>=' 
                        | '->' | '=>' | '...' | '..=' | '..' | '#' | '@' | '?' | '<:' | '<' | '>' | '<=' | '>=' 
                        | '!=' | '==' | '_' | '\\' | '`' | '$' 
                        | 'Int8' | 'Int16' | 'Int32' | 'Int64' | 'UInt8' | 'UInt16' | 'UInt32' | 'UInt64' | 'Float16' 
                        | 'Float32' | 'Float64' | 'Rune' | 'Bool' | 'Unit' | 'Nothing' | 'struct' | 'enum' | 'This' 
                        | 'package' | 'import' | 'class' | 'interface' |'func' | 'let' | 'var' | 'type' 
                        | 'init' | 'this' | 'super' | 'if' | 'else' | 'case' | 'try' | 'catch' | 'finally' 
                        | 'for' | 'do' | 'while' | 'throw' | 'return' | 'continue' | 'break' | 'as' | 'in' | '!in' 
                        | 'match' | 'from' | 'where' | 'extend' | 'spawn' | 'synchronized' | 'macro' | 'quote' | 'true' | 'false' 
                        | 'sealed' |'static' | 'public' | 'private' | 'protected' 
                        | 'override' | 'abstract' | 'open' | 'operator' | 'foreign' 
                        | Identifier | DollarIdentifier 
                        | literalConstant 
                        ; 
                    quoteInterpolate 
                        : '$' '(' expression ')' 

  @Description:  Checking grammatical description for quoteExpression with macroExpression .
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros.cj
*/

import std.ast.*
import aux_macros.*
import std.convert.*
import utils.assert.Assert

main(): Unit {
    // macroInputExprWithParens
    var xqm = quote($(@PlusOne(56)))

    Assert.equals(57, @PlusOne(56))
    Assert.equals("57", xqm.toString())

    // macroAttrExpr & macroInputExprWithParens
    var m_res = @Concat["abc"]("def")
    var qm_res = quote($(@Concat["abc"]("def")))
    var qq_res = quote($(quote($("abc" + "def"))))

    Assert.equals('"abcdef"', qm_res.toString())
    Assert.equals('"abcdef"', qq_res.toString())
    Assert.equals(qm_res.toString(), qq_res.toString())

    Assert.isTrue(m_res is String)
    Assert.isTrue(qm_res is Tokens)
    Assert.isTrue(qq_res is Tokens)

    // macroInputExprWithoutParens
    @Plus555
    var mi = 333
    var qmi = quote($mi)
    
    Assert.equals(888, mi)
    Assert.equals("888", qmi.toString())

    // macroAttrExpr & macroInputExprWithoutParens
    @Plus[22.2]
    var mf = 11.1
    var qmf = quote($mf)
    
    Assert.equals(33.3, mf)
    Assert.equals(33.3.format('2.1'), qmf.toString())
}