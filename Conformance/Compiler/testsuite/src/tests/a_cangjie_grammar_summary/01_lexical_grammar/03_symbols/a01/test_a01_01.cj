/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: Symbols

              DOT: '.' ;
              COMMA: ',' ;
              LPAREN: '(' ;
              RPAREN: ')' ;
              LSQUARE: '[' ;
              RSQUARE: ']' ;
              LCURL: '{' ;
              RCURL: '}' ;
              EXP: '**' ;
              MUL: '*' ;
              MOD: '%' ;
              DIV: '/' ;
              ADD: '+' ;
              SUB: '-' ;
              PIPELINE: '|>' ;
              COMPOSITION: '~>' ;
              INC: '++' ;
              DEC: '--' ;
              AND: '&&' ;
              OR: '||' ;
              NOT: '!' ;
              BITAND: '&' ;
              BITOR: '|' ;
              BITXOR: '^' ;
              LSHIFT: '<<' ;
              RSHIFT: '>>' ;
              COLON: ':' ;
              SEMI: ';' ;
              ASSIGN: '=' ;
              ADD_ASSIGN: '+=' ;
              SUB_ASSIGN: '-=' ;
              MUL_ASSIGN: '*=' ;
              EXP_ASSIGN: '**=' ;
              DIV_ASSIGN: '/=' ;
              MOD_ASSIGN: '%=' ;
              AND_ASSIGN: '&&=' ;
              OR_ASSIGN: '||=' ;
              BITAND_ASSIGN: '&=' ;
              BITOR_ASSIGN: '|=' ;
              BITXOR_ASSIGN: '^=' ;
              LSHIFT_ASSIGN: '<<=' ;
              RSHIFT_ASSIGN: '>>=' ;
              ARROW: '->' ;
              BACKARROW: '<-' ;
              DOUBLE_ARROW: '=>' ;
              ELLIPSIS: '...' ;
              CLOSEDRANGEOP: '..=' ;
              RANGEOP: '..' ;
              HASH: '#' ;
              AT: '@' ;
              QUEST: '?' ;
              UPPERBOUND: '<:';
              LT: '<' ;
              GT: '>' ;
              LE: '<=' ;
              GE: '>=' ;
              NOTEQUAL: '!=' ;
              EQUAL: '==' ;
              WILDCARD: '_' ;
              BACKSLASH: '\\' ;
              QUOTESYMBOL: '`';
              DOLLAR: '$';
              QUOTE_OPEN: '"' ;
              TRIPLE_QUOTE_OPEN: '"""' NL;
              QUOTE_CLOSE: '"' ;
              TRIPLE_QUOTE_CLOSE: '"""' ;
              LineStrExprStart: '${' ;
              MultiLineStrExprStart: '${' ;

  @Description: Check symbols usage.
  @Level:         1

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: aux_macros_01.cj

  @Issue: 0006506 0006473
*/

import aux_macros_01.*

// COLON
func sqr(x: Int64) {
    x * x
}

func id<T>(x: T) { x }

interface I {}

// UPPERBOUND
class C <: I {
    var x = 0
}

main() {
    // DOT
    var c = C()
    c.x = 5

    // COMMA
    // LPAREN
    // RPAREN
    var t = (3, 4)

    // LSQUARE
    // RSQUARE
    var a = [1, 2, 3]

    // LCURL
    // RCURL
    var lambda = { => 42 }

    // EXP
    var x = 2 ** 3

    // MUL
    x = 2 * 3

    // MOD
    x = 2 % 3

    // DIV
    x = 2 / 3

    // ADD
    x = 2 + 3

    // SUB
    x = 2 - 3

    // PIPELINE
    x = 2 |> sqr

    // COMPOSITION
    x = (sqr ~> id<Int64>)(2)

    // INC
    x++

    // DEC
    x--

    // AND
    var b = true && false

    // OR
    b = true || false

    // NOT
    b = !b

    // BITAND
    x = x & 3

    // BITOR
    x = x | 0

    // BITXOR
    x = x ^ 1

    // LSHIFT
    x = 1 << 2

    // RSHIFT
    x = 1 >> 2

    // SEMI
    ;

    // ASSIGN
    x = 2

    // ADD_ASSIGN
    x += 2

    // SUB_ASSIGN
    x -= 2

    // MUL_ASSIGN
    x *= 0

    // EXP_ASSIGN
    x **= 2

    // DIV_ASSIGN
    x /= 2

    // MOD_ASSIGN
    x %= 5

    // AND_ASSIGN
    b &&= true

    // OR_ASSIGN
    b ||= true

    // BITAND_ASSIGN
    x &= 0

    // BITOR_ASSIGN
    x |= 0

    // BITXOR_ASSIGN
    x ^= 1

    // LSHIFT_ASSIGN
    x <<= 1

    // RSHIFT_ASSIGN
    x >>= 1

    // ARROW
    var f1: () -> Unit = { => }

    // BACKARROW
    // Issue: 0006473
    var oc2: ?C = C()
    if (let Some(v) <- oc2) {
        x = 2
    }

    // DOUBLE_ARROW
    var f2: () -> Unit = { => }

    // ELLIPSIS
    // Issue: 0006506

    // CLOSEDRANGEOP
    var r1 = 0..=3

    // RANGEOP
    var r2 = 0..3

    // HASH
    var s2 = #""#

    // AT
    @Identity(x = 3)

    // QUEST
    var oc: ?C = C()

    // LT
    if (3 < 5) {
        x = 3
    }

    // GT
    if (5 > 3) {
        x = 5
    }

    // LE
    if (3 <= 5) {
        x = 3
    }

    // GE
    if (5 >= 3) {
        x = 5
    }

    // NOTEQUAL
    if (3 != 5) {
        x = 5
    }

    // EQUAL
    if (3 == 5) {
        x = 3
    }

    // WILDCARD
    _ = x

    // BACKSLASH
    var c1 = '\\'

    // QUOTESYMBOL
    var `open` = 1

    // DOLLAR
    // QUOTE_OPEN
    // QUOTE_CLOSE
    var s = "${x}"

    // TRIPLE_QUOTE_OPEN
    // TRIPLE_QUOTE_CLOSE
    s = """
    multiline string
    """

    // LineStrExprStart
    s = "${x}"

    // MultiLineStrExprStart
    s = """
    ${
    x
    }
    """
}

