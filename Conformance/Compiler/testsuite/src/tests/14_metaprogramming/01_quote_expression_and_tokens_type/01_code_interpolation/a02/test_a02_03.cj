/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a02_03

  @Level:         1

  @Assertion:   14.1.1(2) The operator is followed by an expression, indicating that the
                value of the expression is converted to tokens.

  @Description: Check that value of match expression is converted to a token
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(inp: Array<String>): Unit {
    // Matching Expressions
    var score = 60
    let error = 101
    var m_const = match (Assert.getRuntimeZero(inp)) {
        case 0 => "zero"
        case 10 | 20 | 30 | 40 | 50 => "fail"
        case 60 => "pass"
        case _ => "not a valid score"}
    
    let m_score = match (score) {
        case 0 => "zero"
        case 10 | 20 | 30 | 40 | 50 => "fail"
        case 60 => "pass"
        case _ => "not a valid score"}

    let m_error = match (error) {
        case 0 => "zero"
        case 10 | 20 | 30 | 40 | 50 => "fail"
        case 60 => "pass"
        case _ => "not a valid score"}

    let tm_const = quote(m_const)
    let tm_score = quote(m_score)
    var tm_error = quote(m_error)

    var ci_const = quote($(match (Assert.getRuntimeZero(inp)) {
        case 0 => "zero"
        case 10 | 20 | 30 | 40 | 50 => "fail"
        case 60 => "pass"
        case _ => "not a valid score"}))

    let ci_score = quote($(match (score) {
        case 0 => "zero"
        case 10 | 20 | 30 | 40 | 50 => "fail"
        case 60 => "pass"
        case _ => "not a valid score"}))

    let ci_error = quote($(match (error) {
        case 0 => "zero"
        case 10 | 20 | 30 | 40 | 50 => "fail"
        case 60 => "pass"
        case _ => "not a valid score"}))

    let cim_const = quote($m_const)
    let cim_score = quote($m_score)
    var cim_error = quote($m_error)

    Assert.equals("zero", m_const)
    Assert.equals("pass", m_score)
    Assert.equals("not a valid score", m_error)

    Assert.equals("m_const", tm_const.toString())
    Assert.equals("m_score", tm_score.toString())
    Assert.equals("m_error", tm_error.toString())

    Assert.equals('"zero"', ci_const.toString())
    Assert.equals('"pass"', ci_score.toString())
    Assert.equals('"not a valid score"', ci_error.toString())
 
    Assert.equals('"zero"', cim_const.toString())
    Assert.equals('"pass"', cim_score.toString())
    Assert.equals('"not a valid score"', cim_error.toString())
}
