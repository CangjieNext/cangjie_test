/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a06_01

  @Level:         1

  @Assertion: 4.4(6) The syntax of a match expression is defined as follows.
  matchExpression
      : 'match' '(' expression ')' '{' matchCase+ '}'
      | 'match' '{' ('case' (expression | '_') '=>' expressionOrDeclaration+)+ '}'
      ;
  matchCase
      : 'case' pattern ('|' pattern)* patternGuard? '=>' expressionOrDeclaration+
      ;
  patternGuard
      : 'where' expression
      ;

  @Description: Validates compilation of some examples illustrating the syntax definition above.
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: ignore
*/

var expr = 0
var expr2 = 0

main() {
    var m = match (expr) {
        case 0 => "1"
        case _ => "fail"
    }
    m = match (expr) {
        case 0 => "0"
        case 1 => "2"
        case 3 => "3"
        case _ => "fail"
    }
    m = match (expr) {
        case 1 => "1"
        case 2 => "2"
        case _ => "fail"
    }

    m = match {
        case _ => "succeed"
    }
    m = match {
        case expr >= 0 => "succeed"
        case _ => "fail"
    }
    m = match {
        case expr == 0 => "0"
        case expr == 1 => "1"
        case _ => "fail"
    }

    m = match (expr) {
        case 0 where expr2 >= 0 => "0"
        case 1 => "1"
        case _ => "fail"
    }

    m = match (expr) {
        case 0 => match (expr2) {
            case 1 | 2 => "fail"
            case _ => "succeed"
        }
        case 1 => match {
            case expr2 >= 1 => "fail"
            case _ => "succeed"
        }
        case _ => "fail"
    }

    m = match {
        case expr >= 0 => match (expr2) {
            case 1 | 2 => "fail"
            case _ => "succeed"
        }
        case expr <= 0 => match {
            case expr2 >= 1 => "fail"
            case _ => "succeed"
        }
        case _ => "fail"
    }

    return
}
