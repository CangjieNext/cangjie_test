/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_a02_06

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

  @Description:  Checks "'try' block 'finally' block" rule with double 'finally'.
  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single
*/

main() {
    try {
    } finally {
    } finally { }
}
