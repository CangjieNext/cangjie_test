/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_a02_01

  @Level:         1

  @Assertion:    12.1(2) The syntax of try expressions is as follows.
                         tryExpression
                         : 'try' block 'finally' block
                         | 'try' block ('catch' '(' catchPattern ')' block)+ ('finally' block)?
                         | 'try' '(' ResourceSpecifications ')' block ('catch' '(' catchPattern ')'
                            block)* ('finally' block)?
                         ;
                         catchPattern
                         : wildcardPattern
                         | exceptionTypePattern
                         ;
                         exceptionTypePattern
                         : ('_' | identifier) ':' type ('|' type)'*'
                         ;
                         ResourceSpecifications
                         : ResourceSpecification (',' ResourceSpecification)'*'
                         ;
                         ResourceSpecification
                         : identifier (':' classType)? '=' expression

  @Description:  Checks all possible variants of try expression without resource specification.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

main() {
// test case #1
    try {
    } finally {}
// test case #2
    try {
    } catch (_) {}
// test case #3
    try {
    } catch (_) {
    } finally {}
// test case #4
    try {
    } catch (e: ArithmeticException) {
    } catch (_) {
    } finally {}
// test case #5
    try {
    } catch (e: ArithmeticException | IndexOutOfBoundsException) {
    } catch (_ : StackOverflowError) {}
// test case #6
    try {
    } catch (e: ArithmeticException | IndexOutOfBoundsException) {
    } catch (_ : StackOverflowError) {
    } finally {}
}
