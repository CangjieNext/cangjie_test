/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_02_a01_14

  @Level:         1

  @Assertion:    12.2(1) The syntax of the throw expressions is as follows.
                         throwExpression
                         : 'throw' expression
                         ;

  @Description:  Checks using of throw expression with various expressions which are not Exception or Error type.
  @Comment:      Check struct as expression parameter
  @Mode:         compileonly
  @Negative:     yes
  @CompileWarning: Ignore
  @Structure:    single
*/
struct R1 {
    let smth = 123
}

main() {
    throw R1()

    return 0
}

