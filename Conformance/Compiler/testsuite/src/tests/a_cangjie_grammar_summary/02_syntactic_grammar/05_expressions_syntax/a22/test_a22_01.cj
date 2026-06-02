/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a22_01

  @Level:         1
  @Assertion:   A.2.5(22)
                quoteExpression
                    : QUOTE quoteExpr
                    ;
                quoteExpr
                    : LPAREN NL* quoteParameters NL* RPAREN
                    ;
                quoteParameters
                    : (NL* quoteToken | NL* quoteInterpolate | NL* macroExpression)+
                    ;
                quoteToken
                    : DOT | COMMA | LPAREN | RPAREN | LSQUARE | RSQUARE | LCURL | RCURL | EXP | MUL | MOD
                     | DIV | ADD | SUB
                    | PIPELINE | COMPOSITION
                    | INC | DEC | AND | OR | NOT | BITAND | BITOR | BITXOR | LSHIFT | RSHIFT | COLON | SEMI
                    | ASSIGN | ADD_ASSIGN | SUB_ASSIGN | MUL_ASSIGN | EXP_ASSIGN | DIV_ASSIGN | MOD_ASSIGN
                    | AND_ASSIGN | OR_ASSIGN | BITAND_ASSIGN | BITOR_ASSIGN | BITXOR_ASSIGN | LSHIFT_ASSIGN
                     | RSHIFT_ASSIGN
                    | ARROW | BACKARROW | DOUBLE_ARROW | ELLIPSIS | CLOSEDRANGEOP | RANGEOP | HASH | AT |
                     QUEST | UPPERBOUND | LT | GT | LE | GE
                    | NOTEQUAL | EQUAL | WILDCARD | BACKSLASH | QUOTESYMBOL | DOLLAR
                    | INT8 | INT16 | INT32 | INT64 | INTNATIVE | UINT8 | UINT16 | UINT32 | UINT64 |
                     UINTNATIVE | FLOAT16
                    | FLOAT32 | FLOAT64 | CHAR | BOOL | UNIT | NOTHING | STRUCT | ENUM | THIS
                    | PACKAGE | IMPORT | CLASS | INTERFACE | FUNC | LET | VAR | TYPE
                    | INIT | THIS | SUPER | IF | ELSE | CASE | TRY | CATCH | FINALLY
                    | FOR | DO | WHILE | THROW | RETURN | CONTINUE | BREAK | AS | IN
                    | MATCH | FROM | WHERE | EXTEND | SPAWN | SYNCHRONIZED | MACRO | QUOTE | TRUE | FALSE
                    | STATIC | PUBLIC | PRIVATE | PROTECTED
                    | OVERRIDE | ABSTRACT | OPEN | OPERATOR | FOREIGN
                    | Identifier | DollarIdentifier
                    | literalConstant
                    ;


  @Description: Check trivial quote expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

import std.ast.*

main() {
    quote(..=)

    var v = 'd'
    quote(v)
    quote($v)
    quote($(v))

    quote(0xFFffFFff)

    return 0
}
