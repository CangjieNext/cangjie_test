/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_02_a01_01

  @Level:         1

  @Assertion:    12.2(1) The syntax of the throw expressions is as follows.
                         throwExpression
                         : 'throw' expression
                         ;

  @Description:  Checks the syntax of throw expression.

  @Mode:         compileonly

  @Negative:     no

  @CompileWarning: Ignore

  @Structure:    single

*/

main() {
    let e = throw Exception()
}

