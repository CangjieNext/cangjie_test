/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        14_01_a01_01

  @Level:         1

  @Assertion:   14.1(1) The code reference uses the quote expression to reference specific code, indicating
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

  @Description: Checking grammatical description for quoteExpression(without macroExpression).
  
  @Mode:        compileonly

  @Negative:    no

  @Issue:       0006078
*/

import std.ast.*

main(): Unit {
    quote(.)
    quote(,)
    quote(\()
    quote(\))
    quote([)
    quote(])
    quote({)
    quote(})
    quote(**)
    quote(*)
    quote(%)
    quote(/)
    quote(+)
    quote(-)
    quote(|>)
    quote(~>)
    quote(++)
    quote(--)
    quote(&&)
    quote(||)
    quote(!)
    quote(&)
    quote(|)
    quote(^)
    quote(<<)
    quote(>>)
    quote(:)
    quote(;)
    quote(=)
    quote(+=)
    quote(-=)
    quote(*=)
    quote(**=)
    quote(/=)
    quote(%=)
    quote(&&=)
    quote(||=)
    quote(&=)
    quote(|=)
    quote(^=)
    quote(<<=)
    quote(>>=)
    quote(->)
    quote(=>)
    quote(...)
    quote(..=)
    quote(..)
    quote(@)
    quote(?)
    quote(<:)
    quote(<)
    quote(>)
    quote(<=)
    quote(>=)
    quote(!=)
    quote(==)
    quote(_)
    quote(\$)
    quote(Int8)
    quote(Int16)
    quote(Int32)
    quote(Int64)
    quote(UInt8)
    quote(UInt16)
    quote(UInt32)
    quote(UInt64)
    quote(Float16)
    quote(Float32)
    quote(Float64)
    quote(Rune)
    quote(Bool)
    quote(Unit)
    quote(Nothing)
    quote(struct)
    quote(enum)
    quote(This)
    quote(package)
    quote(import)
    quote(class)
    quote(interface)
    quote(func)
    quote(let)
    quote(var)
    quote(type)
    quote(init)
    quote(this)
    quote(super)
    quote(if)
    quote(else)
    quote(case)
    quote(try)
    quote(catch)
    quote(finally)
    quote(for)
    quote(do)
    quote(while)
    quote(throw)
    quote(return)
    quote(continue)
    quote(break)
    quote(as)
    quote(in)
    quote(!in)
    quote(match)
    quote(from)
    quote(where)
    quote(extend)
    quote(spawn)
    quote(synchronized)
    quote(macro)
    quote(quote)
    quote(true)
    quote(false)
    quote(sealed)
    quote(static)
    quote(public)
    quote(private)
    quote(protected)
    quote(override)
    quote(abstract)
    quote(open)
    quote(operator)
    quote(foreign)

    var someIdent = "It's cool in space"[0]
    quote(someIdent)
    quote($someIdent)
    quote($(someIdent))

    quote(.555)

    var variable1:Int64 = 527
    var variable2:Int64 = 32 
    var t:Tokens = quote(\() + quote($(variable1 * variable2)) + quote(\)) + 
                    quote(-) + quote(\($(variable1 * variable2)\))
}